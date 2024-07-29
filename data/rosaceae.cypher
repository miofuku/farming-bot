// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Rosaceae family
// Create Rosaceae family node
CREATE (:Family {name: 'Rosaceae', description: 'A large family of flowering plants, including many edible fruits and ornamental flowers'})

// Create Genus nodes
CREATE (:Genus {name: 'Fragaria', description: 'A genus of flowering plants commonly known as strawberries'})
CREATE (:Genus {name: 'Malus', description: 'A genus of about 30–55 species of small deciduous trees or shrubs in the family Rosaceae, including the domesticated apple'})
CREATE (:Genus {name: 'Prunus', description: 'A genus of trees and shrubs, including the plums, cherries, peaches, nectarines, apricots, and almonds'})
CREATE (:Genus {name: 'Rubus', description: 'A large and diverse genus of flowering plants in the rose family, including raspberries and blackberries'})

// Create Plant nodes
CREATE (:Plant {name: 'Strawberry', binomial_name: 'Fragaria × ananassa', height: '0.1-0.3 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '4-6 weeks', period_all: '4-5 months'})
CREATE (:Plant {name: 'Apple', binomial_name: 'Malus domestica', height: '2-10 meters', period_seed: '6-8 weeks', period_grow: '3-5 years', period_yield: '4-6 weeks', period_all: 'Perennial'})
CREATE (:Plant {name: 'Cherry', binomial_name: 'Prunus avium', height: '6-30 meters', period_seed: '10-14 weeks', period_grow: '3-7 years', period_yield: '2-3 weeks', period_all: 'Perennial'})
CREATE (:Plant {name: 'Raspberry', binomial_name: 'Rubus idaeus', height: '1-2 meters', period_seed: '1-2 weeks', period_grow: '1-2 years', period_yield: '4-5 weeks', period_all: 'Perennial'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Rosaceae' AND g.name IN ['Fragaria', 'Malus', 'Prunus', 'Rubus']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Strawberry' AND g.name = 'Fragaria'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Apple' AND g.name = 'Malus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Cherry' AND g.name = 'Prunus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Raspberry' AND g.name = 'Rubus'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Strawberry', 'Apple', 'Cherry', 'Raspberry'] AND pt.name = 'Fruit'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Apple', 'Cherry'] AND pt.name = 'Tree'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Raspberry' AND pt.name = 'Shrub'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Strawberry', 'Apple', 'Cherry', 'Raspberry'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Strawberry', 'Raspberry'] AND s.name = 'Sandy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Apple', 'Cherry'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Strawberry', 'Raspberry'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Apple', 'Cherry'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Strawberry', 'Raspberry'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Apple', 'Cherry'] AND d.name = 'Blight'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Strawberry', 'Apple', 'Cherry', 'Raspberry'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Strawberry', 'Raspberry'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Apple', 'Cherry'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Strawberry', 'Apple', 'Cherry', 'Raspberry'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Strawberry', 'Raspberry'] AND s.name IN ['Spring', 'Summer']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Apple', 'Cherry'] AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Strawberry', 'Raspberry'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Apple', 'Cherry'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Strawberry' AND c.name = 'Carrot'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Apple' AND c.name = 'Nasturtium'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Strawberry' AND cp.name = 'Tomato'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Apple', 'Cherry'] AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)