// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Apiaceae family
// Create Apiaceae family node
CREATE (:Family {name: 'Apiaceae', description: 'A family of mostly aromatic flowering plants commonly known as the celery, carrot or parsley family'})

// Create Genus nodes
CREATE (:Genus {name: 'Daucus', description: 'A genus of flowering plants including carrots'})
CREATE (:Genus {name: 'Apium', description: 'A genus of plants including celery and parsley'})
CREATE (:Genus {name: 'Pastinaca', description: 'A genus of flowering plants including parsnips'})
CREATE (:Genus {name: 'Coriandrum', description: 'A genus of plants including cilantro/coriander'})
CREATE (:Genus {name: 'Petroselinum', description: 'A genus of plants including parsley'})

// Create Plant nodes for vegetable PlantType
CREATE (:Plant {name: 'Carrot', binomial_name: 'Daucus carota', height: '0.3-0.6 meters', period_seed: '1-3 weeks', period_grow: '2-4 months', period_yield: '2-4 weeks', period_all: '3-5 months'})
CREATE (:Plant {name: 'Celery', binomial_name: 'Apium graveolens', height: '0.3-0.6 meters', period_seed: '2-3 weeks', period_grow: '3-4 months', period_yield: '2-4 weeks', period_all: '4-6 months'})
CREATE (:Plant {name: 'Parsnip', binomial_name: 'Pastinaca sativa', height: '0.5-1.5 meters', period_seed: '2-3 weeks', period_grow: '4-5 months', period_yield: '2-4 weeks', period_all: '5-7 months'})
CREATE (:Plant {name: 'Cilantro/Coriander', binomial_name: 'Coriandrum sativum', height: '0.3-0.6 meters', period_seed: '1-2 weeks', period_grow: '4-6 weeks', period_yield: '2-3 weeks', period_all: '2-3 months'})
CREATE (:Plant {name: 'Parsley', binomial_name: 'Petroselinum crispum', height: '0.15-0.3 meters', period_seed: '2-3 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-7 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Apiaceae' AND g.name IN ['Daucus', 'Apium', 'Pastinaca', 'Coriandrum', 'Petroselinum']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Carrot' AND g.name = 'Daucus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Celery' AND g.name = 'Apium'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Parsnip' AND g.name = 'Pastinaca'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Cilantro/Coriander' AND g.name = 'Coriandrum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Parsley' AND g.name = 'Petroselinum'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Cilantro/Coriander', 'Parsley'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Cilantro/Coriander', 'Parsley'] AND pt.name = 'Herb'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Cilantro/Coriander', 'Parsley'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Carrot', 'Parsnip'] AND s.name = 'Sandy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Celery', 'Cilantro/Coriander', 'Parsley'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Parsley'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Cilantro/Coriander', 'Parsley'] AND pe.name = 'Slugs and Snails'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Parsley'] AND d.name = 'Blight'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Cilantro/Coriander', 'Parsley'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Cilantro/Coriander', 'Parsley'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Parsley'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Cilantro/Coriander', 'Parsley'] AND lh.name = 'Partial Shade'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Carrot', 'Celery', 'Parsnip', 'Parsley'] AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Cilantro/Coriander', 'Parsley'] AND s.name IN ['Spring', 'Fall', 'Winter']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Carrot', 'Parsnip'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Celery', 'Cilantro/Coriander', 'Parsley'] AND shp.name = 'High'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Carrot', 'Celery'] AND c.name = 'Onion'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Carrot', 'Parsley'] AND c.name = 'Radish'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Cilantro/Coriander' AND c.name = 'Radish'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Carrot', 'Parsley'] AND cp.name = 'Dill'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Cilantro/Coriander' AND cp.name = 'Dill'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Carrot', 'Celery'] AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)