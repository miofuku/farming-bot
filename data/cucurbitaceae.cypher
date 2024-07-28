// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Cucurbitaceae family
// Create Cucurbitaceae family node
CREATE (:Family {name: 'Cucurbitaceae', description: 'A family of plants commonly known as gourds or cucurbits, including pumpkins, squash, melons, and cucumbers'})

// Create Genus nodes
CREATE (:Genus {name: 'Luffa', description: 'A genus of tropical and subtropical vines in the cucumber family'})
CREATE (:Genus {name: 'Lagenaria', description: 'A genus of vines in the squash family, including the bottle gourd'})
CREATE (:Genus {name: 'Citrullus', description: 'A genus of plants in the family Cucurbitaceae, including watermelon'})
CREATE (:Genus {name: 'Cucumis', description: 'A genus of plants in the gourd family, including cucumber and melon'})
CREATE (:Genus {name: 'Cucurbita', description: 'A genus of herbaceous vines in the gourd family, including pumpkins'})

// Create Plant nodes for vegetable PlantType
CREATE (:Plant {name: 'Luffa', binomial_name: 'Luffa aegyptiaca', height: '3-6 meters', period_seed: '7-14 days', period_grow: '3-4 months', period_yield: '2-3 months', period_all: '5-7 months'})
CREATE (:Plant {name: 'Bottle Gourd', binomial_name: 'Lagenaria siceraria', height: '3-9 meters', period_seed: '7-10 days', period_grow: '3-4 months', period_yield: '2-3 months', period_all: '5-7 months'})
CREATE (:Plant {name: 'Watermelon', binomial_name: 'Citrullus lanatus', height: '0.3-0.6 meters', period_seed: '3-10 days', period_grow: '2-3 months', period_yield: '2-3 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Melon', binomial_name: 'Cucumis melo', height: '0.5-2 meters', period_seed: '4-7 days', period_grow: '2-3 months', period_yield: '2-3 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Cucumber', binomial_name: 'Cucumis sativus', height: '2-3 meters', period_seed: '3-10 days', period_grow: '1.5-2 months', period_yield: '4-6 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Pumpkin', binomial_name: 'Cucurbita pepo', height: '0.3-0.6 meters', period_seed: '5-10 days', period_grow: '3-4 months', period_yield: '2-3 weeks', period_all: '4-5 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Cucurbitaceae' AND g.name IN ['Luffa', 'Lagenaria', 'Citrullus', 'Cucumis', 'Cucurbita']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Luffa' AND g.name = 'Luffa'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Bottle Gourd' AND g.name = 'Lagenaria'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Watermelon' AND g.name = 'Citrullus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Melon', 'Cucumber'] AND g.name = 'Cucumis'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Pumpkin' AND g.name = 'Cucurbita'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Watermelon', 'Melon'] AND pt.name = 'Fruit'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND c.name IN ['Tropical', 'Subtropical']
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Cucumber', 'Pumpkin'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND pe.name = 'Whiteflies'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon'] AND t.name = 'Hot'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Cucumber', 'Pumpkin'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Luffa', 'Bottle Gourd', 'Watermelon', 'Melon', 'Cucumber', 'Pumpkin'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Cucumber', 'Pumpkin'] AND c.name = 'Radish'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Cucumber', 'Pumpkin'] AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Cucumber', 'Pumpkin'] AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)