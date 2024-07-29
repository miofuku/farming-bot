// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Poaceae family
// Create Poaceae family node
CREATE (:Family {name: 'Poaceae', description: 'A large and nearly ubiquitous family of monocotyledonous flowering plants known as grasses'})

// Create Genus nodes
CREATE (:Genus {name: 'Zea', description: 'A genus of grasses including corn (maize)'})
CREATE (:Genus {name: 'Triticum', description: 'A genus of grasses including wheat'})
CREATE (:Genus {name: 'Oryza', description: 'A genus of grasses including rice'})
CREATE (:Genus {name: 'Hordeum', description: 'A genus of grasses including barley'})

// Create Plant nodes for grain PlantType
CREATE (:Plant {name: 'Corn', binomial_name: 'Zea mays', height: '1.5-3 meters', period_seed: '5-10 days', period_grow: '60-100 days', period_yield: '20-30 days', period_all: '90-140 days'})
CREATE (:Plant {name: 'Wheat', binomial_name: 'Triticum aestivum', height: '0.6-1.2 meters', period_seed: '7-10 days', period_grow: '100-140 days', period_yield: '7-10 days', period_all: '120-160 days'})
CREATE (:Plant {name: 'Rice', binomial_name: 'Oryza sativa', height: '0.5-1.5 meters', period_seed: '5-10 days', period_grow: '90-120 days', period_yield: '30-40 days', period_all: '125-170 days'})
CREATE (:Plant {name: 'Barley', binomial_name: 'Hordeum vulgare', height: '0.6-1.2 meters', period_seed: '7-10 days', period_grow: '60-90 days', period_yield: '7-10 days', period_all: '80-110 days'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Poaceae' AND g.name IN ['Zea', 'Triticum', 'Oryza', 'Hordeum']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Corn' AND g.name = 'Zea'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Wheat' AND g.name = 'Triticum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Rice' AND g.name = 'Oryza'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Barley' AND g.name = 'Hordeum'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Corn', 'Wheat', 'Rice', 'Barley'] AND pt.name = 'Grain'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Corn', 'Wheat', 'Barley'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name = 'Rice' AND c.name IN ['Tropical', 'Subtropical']
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Corn', 'Wheat', 'Barley'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

MATCH (p:Plant), (s:SoilType)
WHERE p.name = 'Rice' AND s.name = 'Clay'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Corn', 'Wheat', 'Rice', 'Barley'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name = 'Corn' AND pe.name = 'Cutworms'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Corn', 'Wheat', 'Rice', 'Barley'] AND d.name = 'Rust'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Corn', 'Wheat', 'Rice'] AND d.name = 'Blight'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Corn', 'Wheat', 'Rice', 'Barley'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Corn', 'Wheat', 'Rice', 'Barley'] AND f.name = 'Manure'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Corn', 'Rice'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Wheat', 'Barley'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Corn', 'Wheat', 'Rice', 'Barley'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name = 'Corn' AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Wheat', 'Barley'] AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Rice' AND s.name IN ['Spring', 'Summer']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Corn', 'Wheat', 'Barley'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name = 'Rice' AND shp.name = 'High'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Corn' AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Note: You may want to add more companion plants as they are added to the database

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Corn' AND cp.name = 'Tomato'
CREATE (p)-[:COMPETES_WITH]->(cp)

// Note: You may want to add more competitive plants as they are added to the database