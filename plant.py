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

uri = os.getenv("NEO4J_URI", "neo4j+s://instance.databases.neo4j.io")
username = os.getenv("NEO4J_USER", "username")
password = os.getenv("NEO4J_PASSWORD", "password")
neo4j_version = os.getenv("NEO4J_VERSION", "4")
aura_instanceid = os.getenv("AURA_INSTANCEID", "id")
aura_instancename = os.getenv("AURA_INSTANCENAME", "name")

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

def serialize_plant(plant):
    return {
        "name": plant["name"],
        "binomial_name": plant["binomial_name"],
        "height": plant["height"],
        "period_seed": plant["period_seed"],
        "period_grow": plant["period_grow"],
        "period_yield": plant["period_yield"],
        "period_all": plant["period_all"]
    }

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
            RETURN p
            ORDER BY p.name
        """),
        family=family,
        database_="neo4j",
        routing_="r",
    )
    return [serialize_plant(record["p"]) for record in records]

@app.get("/plant_graph")
async def get_plant_graph():
    records, _, _ = await get_driver().execute_query(
        query("""
            MATCH (f:Family)<-[:BELONGS_TO]-(g:Genus)<-[:BELONGS_TO]-(p:Plant)
            RETURN f.name AS family, collect(p.name) AS plants
            LIMIT 100
        """),
        database_="neo4j",
        routing_="r",
    )
    nodes = []
    links = []
    for record in records:
        family_node = {"id": record["family"], "label": "family", "title": record["family"]}
        if family_node not in nodes:
            nodes.append(family_node)
        for plant in record["plants"]:
            plant_node = {"id": plant, "label": "plant", "title": plant}
            if plant_node not in nodes:
                nodes.append(plant_node)
            links.append({"source": plant, "target": record["family"]})
    return {"nodes": nodes, "links": links}

if __name__ == "__main__":
    import uvicorn

    logging.root.setLevel(logging.INFO)
    logging.info("Starting on port %d, database is at %s", port, uri)

    uvicorn.run(app, port=port)