// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Ericaceae family
// Create Ericaceae family node
CREATE (:Family {name: 'Ericaceae', description: 'A family of flowering plants commonly known as the heath or heather family'})

// Create Genus nodes
CREATE (:Genus {name: 'Vaccinium', description: 'A genus of shrubs including blueberries and cranberries'})
CREATE (:Genus {name: 'Rhododendron', description: 'A genus of woody plants known for their showy flowers'})
CREATE (:Genus {name: 'Calluna', description: 'A genus containing a single species, heather'})
CREATE (:Genus {name: 'Arbutus', description: 'A genus of trees commonly known as strawberry trees'})

// Create Plant nodes
CREATE (:Plant {name: 'Blueberry', binomial_name: 'Vaccinium corymbosum', height: '1-4 meters', period_seed: '3-4 weeks', period_grow: '2-3 years', period_yield: '2-3 months', period_all: '3-4 years'})
CREATE (:Plant {name: 'Cranberry', binomial_name: 'Vaccinium macrocarpon', height: '0.1-0.3 meters', period_seed: '1-2 months', period_grow: '1-2 years', period_yield: '1-2 months', period_all: '2-3 years'})
CREATE (:Plant {name: 'Rhododendron', binomial_name: 'Rhododendron spp.', height: '0.3-8 meters', period_seed: '1-2 months', period_grow: '2-3 years', period_yield: '1-2 months', period_all: '3-4 years'})
CREATE (:Plant {name: 'Azalea', binomial_name: 'Rhododendron spp.', height: '0.5-3 meters', period_seed: '1-2 months', period_grow: '2-3 years', period_yield: '1-2 months', period_all: '3-4 years'})
CREATE (:Plant {name: 'Heather', binomial_name: 'Calluna vulgaris', height: '0.2-0.6 meters', period_seed: '2-3 weeks', period_grow: '1-2 years', period_yield: '2-3 months', period_all: '2-3 years'})
CREATE (:Plant {name: 'Strawberry Tree', binomial_name: 'Arbutus unedo', height: '5-10 meters', period_seed: '1-2 months', period_grow: '3-5 years', period_yield: '2-3 months', period_all: '5-7 years'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Ericaceae' AND g.name IN ['Vaccinium', 'Rhododendron', 'Calluna', 'Arbutus']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND g.name = 'Vaccinium'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Rhododendron', 'Azalea'] AND g.name = 'Rhododendron'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Heather' AND g.name = 'Calluna'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Strawberry Tree' AND g.name = 'Arbutus'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND pt.name = 'Fruit'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Rhododendron', 'Azalea', 'Heather'] AND pt.name = 'Shrub'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Strawberry Tree' AND pt.name = 'Tree'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Rhododendron', 'Azalea', 'Heather'] AND pt.name = 'Flower'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Blueberry', 'Cranberry', 'Rhododendron', 'Azalea', 'Heather'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name = 'Strawberry Tree' AND c.name = 'Mediterranean'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Blueberry', 'Cranberry', 'Rhododendron', 'Azalea', 'Heather'] AND s.name = 'Peaty'
CREATE (p)-[:SUITABLE_SOIL]->(s)

MATCH (p:Plant), (s:SoilType)
WHERE p.name = 'Strawberry Tree' AND s.name = 'Sandy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Rhododendron', 'Azalea'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND d.name = 'Blight'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Rhododendron', 'Azalea'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Blueberry', 'Cranberry', 'Rhododendron', 'Azalea', 'Heather'] AND f.name = 'Seaweed Extract'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Blueberry', 'Cranberry', 'Rhododendron', 'Azalea', 'Heather'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name = 'Strawberry Tree' AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Rhododendron', 'Azalea', 'Heather', 'Strawberry Tree'] AND lh.name = 'Partial Shade'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Rhododendron', 'Azalea'] AND s.name = 'Spring'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Heather' AND s.name = 'Fall'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Strawberry Tree' AND s.name = 'Fall'
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Blueberry', 'Cranberry', 'Rhododendron', 'Azalea', 'Heather'] AND shp.name = 'High'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name = 'Strawberry Tree' AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion (Note: Ericaceae plants often prefer to be grown alone or with other acid-loving plants)
MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Blueberry', 'Cranberry'] AND c.name = 'Rhododendron'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Rhododendron' AND c.name = 'Azalea'
CREATE (p)-[:COMPANION_WITH]->(c)

// No specific competitive plants are added here, as Ericaceae plants are often grown separately due to their specific soil requirements