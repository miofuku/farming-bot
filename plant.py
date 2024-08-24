#!/usr/bin/env python
import logging
import os
from contextlib import asynccontextmanager
from textwrap import dedent
from typing import Optional, cast

import neo4j
from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse
from neo4j import AsyncGraphDatabase
from typing_extensions import LiteralString


PATH = os.path.dirname(os.path.abspath(__file__))

uri = os.getenv("NEO4J_URI", "neo4j+s://95050584.databases.neo4j.io")
username = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD", "vD8NZsZ8leNzS6IfHRR9skig5ViyhHnZ49oiIzyAjjc")
neo4j_version = os.getenv("NEO4J_VERSION", "4")
aura_instanceid = os.getenv("AURA_INSTANCEID", "95050584")
aura_instancename = os.getenv("AURA_INSTANCENAME", "Instance01")

port = int(os.getenv("PORT", 8080))

shared_context = {}

cypher_files = [
    "data/base.cypher",
    "data/rotate.cypher",
    "data/amaryllidaceae.cypher",
    "data/apiaceae.cypher",
    "data/asteraceae.cypher",
    "data/brassicaceae.cypher",
    "data/convolvulaceae.cypher",
    "data/cucurbitaceae.cypher",
    "data/ericaceae.cypher",
    "data/fabaceae.cypher",
    "data/lamiaceae.cypher",
    "data/malvaceae.cypher",
    "data/poaceae.cypher",
    "data/rosaceae.cypher",
    "data/solanaceae.cypher"
]



def query(q: LiteralString) -> LiteralString:
    # this is a safe transform:
    # no way for cypher injection by trimming whitespace
    # hence, we can safely cast to LiteralString
    return cast(LiteralString, dedent(q).strip())


async def run_cypher_file(driver: neo4j.AsyncDriver, file_path: str):
    with open(file_path, 'r') as file:
        cypher_script = file.read()

    async with driver.session() as session:
        result = await session.run(cypher_script)
        return await result.consume()


@asynccontextmanager
async def lifespan(app: FastAPI):
    driver = AsyncGraphDatabase.driver(uri, auth=(username, password))
    shared_context["driver"] = driver

    # Run Cypher files
    for file in cypher_files:
        file_path = os.path.join(PATH, file)
        logging.info(f"Running {file}...")
        try:
            result = await run_cypher_file(driver, file_path)
            logging.info(f"Nodes created: {result.counters.nodes_created}")
            logging.info(f"Relationships created: {result.counters.relationships_created}")
        except Exception as e:
            logging.error(f"Error running {file}: {str(e)}")

    yield
    await driver.close()


def get_driver() -> neo4j.AsyncDriver:
    return shared_context["driver"]


app = FastAPI(lifespan=lifespan)


@app.get("/")
async def get_index():
    return FileResponse(os.path.join(PATH, "static", "index.html"))

#
# def serialize_movie(movie):
#     return {
#         "id": movie["id"],
#         "title": movie["title"],
#         "summary": movie["summary"],
#         "released": movie["released"],
#         "duration": movie["duration"],
#         "rated": movie["rated"],
#         "tagline": movie["tagline"],
#         "votes": movie.get("votes", 0)
#     }
#
#
# def serialize_cast(cast):
#     return {
#         "name": cast[0],
#         "job": cast[1],
#         "role": cast[2]
#     }


@app.get("/plant_families")
async def get_plant_families():
    records, _, _ = await get_driver().execute_query(
        query("""
            MATCH (f:Family)
            RETURN f.name AS family
            ORDER BY family
        """),
        database_="neo4j",
        routing_="r",
    )
    nodes = []
    rels = []
    i = 0
    for record in records:
        nodes.append({"title": record["movie"], "label": "movie"})
        target = i
        i += 1
        for name in record["cast"]:
            actor = {"title": name, "label": "actor"}
            try:
                source = nodes.index(actor)
            except ValueError:
                nodes.append(actor)
                source = i
                i += 1
            rels.append({"source": source, "target": target})
    return [record["family"] for record in records]


@app.get("/plant_rotation")
async def get_plant_rotation(family: str):
    records, _, _ = await get_driver().execute_query(
        query("""
            MATCH (f1:Family {name: $family})-[r:ROTATE_AFTER]->(f2:Family)
            RETURN f2.name AS rotateAfter, r.weight AS weight
            ORDER BY weight DESC
        """),
        family=family,
        database_="neo4j",
        routing_="r",
    )
    return [{"family": record["rotateAfter"], "weight": record["weight"]} for record in records]


@app.get("/plants_in_family")
async def get_plants_in_family(family: str):
    records, _, _ = await get_driver().execute_query(
        query("""
            MATCH (f:Family {name: $family})<-[:BELONGS_TO]-(:Genus)<-[:BELONGS_TO]-(p:Plant)
            RETURN p.name AS plant, p.binomial_name AS binomial_name
            ORDER BY plant
        """),
        family=family,
        database_="neo4j",
        routing_="r",
    )
    return [{"name": record["plant"], "binomial_name": record["binomial_name"]} for record in records]


if __name__ == "__main__":
    import uvicorn

    logging.root.setLevel(logging.INFO)
    logging.info("Starting on port %d, database is at %s", port, uri)

    uvicorn.run(app, port=port)