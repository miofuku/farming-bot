// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Fabaceae family
// Create Fabaceae family node
CREATE (:Family {name: 'Fabaceae', description: 'A family of flowering plants commonly known as the legume, pea, or bean family'})

// Create Genus nodes
CREATE (:Genus {name: 'Vigna', description: 'A genus of plants including various beans'})
CREATE (:Genus {name: 'Pisum', description: 'A genus of plants including peas'})
CREATE (:Genus {name: 'Glycine', description: 'A genus of plants including soybeans'})

// Create Plant nodes for vegetable PlantType
CREATE (:Plant {name: 'Yardlong Bean', binomial_name: 'Vigna unguiculata subsp. sesquipedalis', height: '1.8-3.0 meters', period_seed: '7-10 days', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '4-6 months'})
CREATE (:Plant {name: 'Pea', binomial_name: 'Pisum sativum', height: '0.3-2.0 meters', period_seed: '7-14 days', period_grow: '2-3 months', period_yield: '3-4 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Edamame', binomial_name: 'Glycine max', height: '0.3-0.9 meters', period_seed: '7-14 days', period_grow: '2-3 months', period_yield: '2-3 weeks', period_all: '3-4 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Fabaceae' AND g.name IN ['Vigna', 'Pisum', 'Glycine']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Yardlong Bean' AND g.name = 'Vigna'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Pea' AND g.name = 'Pisum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Edamame' AND g.name = 'Glycine'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Yardlong Bean', 'Edamame'] AND c.name = 'Subtropical'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name = 'Pea' AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Yardlong Bean', 'Pea'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Yardlong Bean', 'Edamame'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name = 'Pea' AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Yardlong Bean', 'Edamame'] AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Pea' AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Yardlong Bean', 'Pea', 'Edamame'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Pea' AND c.name = 'Carrot'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Pea' AND c.name = 'Radish'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Yardlong Bean', 'Edamame'] AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Pea' AND cp.name IN ['Onion', 'Garlic']
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Yardlong Bean', 'Edamame'] AND cp.name = 'Onion'
CREATE (p)-[:COMPETES_WITH]->(cp)