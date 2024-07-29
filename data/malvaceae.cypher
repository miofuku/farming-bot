// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Malvaceae family
// Create Malvaceae family node
CREATE (:Family {name: 'Malvaceae', description: 'A family of flowering plants commonly known as the mallow family, including economically important crops and ornamentals'})

// Create Genus nodes
CREATE (:Genus {name: 'Abelmoschus', description: 'A genus of flowering plants including okra'})
CREATE (:Genus {name: 'Gossypium', description: 'A genus of plants in the mallow family that includes cotton'})
CREATE (:Genus {name: 'Hibiscus', description: 'A genus of flowering plants known for their showy flowers'})
CREATE (:Genus {name: 'Theobroma', description: 'A genus of flowering plants including cacao trees'})

// Create Plant nodes
CREATE (:Plant {name: 'Okra', binomial_name: 'Abelmoschus esculentus', height: '1-2 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '4-6 months'})
CREATE (:Plant {name: 'Cotton', binomial_name: 'Gossypium hirsutum', height: '1-1.5 meters', period_seed: '1-2 weeks', period_grow: '3-4 months', period_yield: '2-3 months', period_all: '5-7 months'})
CREATE (:Plant {name: 'Hibiscus', binomial_name: 'Hibiscus rosa-sinensis', height: '2-3 meters', period_seed: '2-3 weeks', period_grow: '2-3 months', period_yield: '3-4 months', period_all: '5-7 months'})
CREATE (:Plant {name: 'Cacao', binomial_name: 'Theobroma cacao', height: '4-8 meters', period_seed: '2-3 weeks', period_grow: '3-5 years', period_yield: 'Continuous', period_all: 'Perennial'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Malvaceae' AND g.name IN ['Abelmoschus', 'Gossypium', 'Hibiscus', 'Theobroma']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Okra' AND g.name = 'Abelmoschus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Cotton' AND g.name = 'Gossypium'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Hibiscus' AND g.name = 'Hibiscus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Cacao' AND g.name = 'Theobroma'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Okra' AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Cotton' AND pt.name = 'Fiber Crop'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Hibiscus' AND pt.name = 'Flower'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Cacao' AND pt.name IN ['Tree', 'Fruit']
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND c.name = 'Tropical'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND c.name = 'Subtropical'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name = 'Cacao' AND c.name = 'Tropical'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus', 'Cacao'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Okra', 'Cotton'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name = 'Cacao' AND d.name = 'Blight'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus', 'Cacao'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name = 'Cacao' AND t.name = 'Hot'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

MATCH (p:Plant), (lh:LightHours)
WHERE p.name = 'Cacao' AND lh.name = 'Partial Shade'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Cacao' AND s.name IN ['Spring', 'Summer', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Okra', 'Cotton', 'Hibiscus'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name = 'Cacao' AND shp.name = 'High'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Okra' AND c.name = 'Tomato'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Okra' AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Note: Cotton, Hibiscus, and Cacao typically don't have well-known companion plants in vegetable gardens

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Okra' AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)

// Note: Cotton, Hibiscus, and Cacao typically don't have well-known competitive plants in vegetable gardens