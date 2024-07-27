// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Convolvulaceae family
// Create Convolvulaceae family node
CREATE (:Family {name: 'Convolvulaceae', description: 'A family of about 60 genera and more than 1,650 species of mostly tropical vines and herbs, commonly known as the morning glory family'})

// Create Genus nodes
CREATE (:Genus {name: 'Ipomoea', description: 'A large genus of flowering plants including morning glories, sweet potatoes, and water spinach'})
CREATE (:Genus {name: 'Convolvulus', description: 'A genus of about 200 to 250 species of flowering plants, commonly known as bindweeds or morning glories'})
CREATE (:Genus {name: 'Cuscuta', description: 'A genus of about 100–170 species of parasitic flowering plants, commonly known as dodders'})

// Create Plant nodes
CREATE (:Plant {name: 'Water Spinach', binomial_name: 'Ipomoea aquatica', height: '0.3-0.6 meters', period_seed: '1-2 weeks', period_grow: '4-6 weeks', period_yield: '2-3 weeks', period_all: '2-3 months'})
CREATE (:Plant {name: 'Sweet Potato', binomial_name: 'Ipomoea batatas', height: '0.3-0.6 meters', period_seed: '2-3 weeks', period_grow: '3-5 months', period_yield: '2-4 weeks', period_all: '4-6 months'})
CREATE (:Plant {name: 'Morning Glory', binomial_name: 'Ipomoea purpurea', height: '1.8-3 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '4-6 months'})
CREATE (:Plant {name: 'Field Bindweed', binomial_name: 'Convolvulus arvensis', height: '0.3-1 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '4-6 months'})
CREATE (:Plant {name: 'Dodder', binomial_name: 'Cuscuta epithymum', height: '0.1-0.3 meters', period_seed: '1-2 weeks', period_grow: '1-2 months', period_yield: '1-2 months', period_all: '2-4 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Convolvulaceae' AND g.name IN ['Ipomoea', 'Convolvulus', 'Cuscuta']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Water Spinach', 'Sweet Potato', 'Morning Glory'] AND g.name = 'Ipomoea'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Field Bindweed' AND g.name = 'Convolvulus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Dodder' AND g.name = 'Cuscuta'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Water Spinach', 'Sweet Potato'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Morning Glory', 'Field Bindweed'] AND pt.name = 'Flower'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Dodder' AND pt.name = 'Herb'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Water Spinach', 'Sweet Potato', 'Morning Glory'] AND c.name = 'Tropical'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Field Bindweed', 'Dodder'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Water Spinach', 'Sweet Potato', 'Morning Glory', 'Field Bindweed'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Water Spinach', 'Sweet Potato'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Sweet Potato', 'Morning Glory'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Sweet Potato', 'Morning Glory'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Water Spinach', 'Sweet Potato', 'Morning Glory'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Water Spinach', 'Sweet Potato'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Morning Glory', 'Field Bindweed', 'Dodder'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Water Spinach', 'Sweet Potato', 'Morning Glory', 'Field Bindweed'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

MATCH (p:Plant), (lh:LightHours)
WHERE p.name = 'Dodder' AND lh.name = 'Partial Shade'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Water Spinach', 'Sweet Potato'] AND s.name IN ['Spring', 'Summer']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Morning Glory', 'Field Bindweed', 'Dodder'] AND s.name IN ['Spring', 'Summer', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name = 'Water Spinach' AND shp.name = 'High'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Sweet Potato', 'Morning Glory', 'Field Bindweed', 'Dodder'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Sweet Potato' AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Sweet Potato and Pole Beans are companions, but Pole Beans isn't in our database yet
// CREATE (p:Plant {name: 'Pole Beans'})
// MATCH (p:Plant), (c:Plant)
// WHERE p.name = 'Sweet Potato' AND c.name = 'Pole Beans'
// CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Sweet Potato' AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)

// Note: Dodder is a parasitic plant and competes with many plants, but we'll need to add more plants to our database to show this relationship