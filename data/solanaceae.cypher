// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Solanaceae family
// Create Solanaceae family node
CREATE (:Family {name: 'Solanaceae', description: 'A family of flowering plants, many of which are important agricultural crops, also known as nightshades'})

// Create Genus nodes
CREATE (:Genus {name: 'Solanum', description: 'A large and diverse genus of flowering plants, including tomato, potato, and eggplant'})
CREATE (:Genus {name: 'Capsicum', description: 'A genus of flowering plants that includes peppers'})
CREATE (:Genus {name: 'Physalis', description: 'A genus of flowering plants that includes ground cherries and tomatillos'})

// Create Plant nodes
CREATE (:Plant {name: 'Tomato', binomial_name: 'Solanum lycopersicum', height: '1-3 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-6 months'})
CREATE (:Plant {name: 'Eggplant', binomial_name: 'Solanum melongena', height: '0.5-1.2 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-6 months'})
CREATE (:Plant {name: 'Potato', binomial_name: 'Solanum tuberosum', height: '0.3-1 meter', period_seed: '2-3 weeks', period_grow: '3-4 months', period_yield: '2-3 weeks', period_all: '4-5 months'})
CREATE (:Plant {name: 'Chili Pepper', binomial_name: 'Capsicum annuum', height: '0.5-1.5 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-6 months'})
CREATE (:Plant {name: 'Bell Pepper', binomial_name: 'Capsicum annuum', height: '0.5-1 meter', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-6 months'})
CREATE (:Plant {name: 'Paprika', binomial_name: 'Capsicum annuum', height: '0.5-1 meter', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-6 months'})
CREATE (:Plant {name: 'Physalis', binomial_name: 'Physalis peruviana', height: '0.5-1 meter', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '5-6 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Solanaceae' AND g.name IN ['Solanum', 'Capsicum', 'Physalis']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Tomato', 'Eggplant', 'Potato'] AND g.name = 'Solanum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Chili Pepper', 'Bell Pepper', 'Paprika'] AND g.name = 'Capsicum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Physalis' AND g.name = 'Physalis'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Tomato', 'Eggplant', 'Potato', 'Chili Pepper', 'Bell Pepper', 'Paprika'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Tomato', 'Physalis'] AND pt.name = 'Fruit'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Physalis'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name = 'Potato' AND c.name IN ['Temperate', 'Continental']
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Potato', 'Physalis'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Tomato', 'Eggplant', 'Potato', 'Chili Pepper', 'Bell Pepper', 'Paprika'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Tomato', 'Potato'] AND pe.name = 'Cutworms'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Tomato', 'Potato'] AND d.name = 'Blight'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Tomato', 'Eggplant', 'Potato', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Physalis'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Physalis'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name = 'Potato' AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Potato', 'Physalis'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Physalis'] AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Potato' AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Tomato', 'Eggplant', 'Chili Pepper', 'Bell Pepper', 'Paprika', 'Potato', 'Physalis'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Tomato' AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Potato' AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Tomato', 'Eggplant', 'Potato'] AND cp.name = 'Fennel'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Potato' AND cp.name IN ['Tomato', 'Carrot', 'Celery']
CREATE (p)-[:COMPETES_WITH]->(cp)