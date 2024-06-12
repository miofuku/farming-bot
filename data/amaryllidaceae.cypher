// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Amaryllidaceae family
// Create Amaryllidaceae family node
CREATE (:Family {name: 'Amaryllidaceae', description: 'A family of herbaceous, bulbous flowering plants'})

// Create Genus nodes
CREATE (:Genus {name: 'Allium', description: 'A genus of bulbous plants including onions, garlic, and ornamental flowering plants'})
CREATE (:Genus {name: 'Narcissus', description: 'A genus of bulbous plants commonly known as daffodils'})

// Create Plant nodes for flower PlantType
CREATE (:Plant {name: 'Daffodil', binomial_name: 'Narcissus pseudonarcissus', height: '0.3-0.6 meters', period_seed: '12-14 weeks', period_grow: '4-6 months', period_yield: '2-4 weeks', period_all: '7-9 months'})
CREATE (:Plant {name: 'Ornamental Onion', binomial_name: 'Allium giganteum', height: '0.6-1.2 meters', period_seed: '10-12 weeks', period_grow: '3-4 months', period_yield: '4-6 weeks', period_all: '6-8 months'})

// Create Plant nodes for vegetable PlantType
CREATE (:Plant {name: 'Onion', binomial_name: 'Allium cepa', height: '0.3-0.6 meters', period_seed: '8-10 weeks', period_grow: '4-6 months', period_yield: '2-4 weeks', period_all: '6-8 months'})
CREATE (:Plant {name: 'Garlic', binomial_name: 'Allium sativum', height: '0.2-0.5 meters', period_seed: '10-12 weeks', period_grow: '5-7 months', period_yield: '2-4 weeks', period_all: '8-10 months'})
CREATE (:Plant {name: 'Leek', binomial_name: 'Allium ampeloprasum', height: '0.3-0.9 meters', period_seed: '10-12 weeks', period_grow: '5-7 months', period_yield: '2-4 weeks', period_all: '8-10 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Amaryllidaceae' AND g.name IN ['Allium', 'Narcissus']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Daffodil' AND g.name = 'Narcissus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek'] AND g.name = 'Allium'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Daffodil', 'Ornamental Onion'] AND pt.name = 'Flower'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Ornamental Onion'] AND pt.name = 'Bulb'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Onion', 'Garlic'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Leek' AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek', 'Daffodil'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

MATCH (p:Plant), (s:SoilType)
WHERE p.name = 'Daffodil' AND s.name = 'Sandy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Onion', 'Garlic', 'Leek'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Onion', 'Garlic', 'Leek'] AND pe.name = 'Slugs and Snails'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Onion', 'Garlic', 'Leek', 'Daffodil'] AND d.name = 'Rust'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek', 'Daffodil'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek', 'Daffodil'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek', 'Daffodil'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek'] AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Daffodil' AND s.name = 'Spring'
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Ornamental Onion', 'Onion', 'Garlic', 'Leek', 'Daffodil'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)