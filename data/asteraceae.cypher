// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Asteraceae family
// Create Asteraceae family node
CREATE (:Family {name: 'Asteraceae', description: 'A large family of flowering plants, also known as the daisy family or composite family'})

// Create Genus nodes
CREATE (:Genus {name: 'Helianthus', description: 'A genus of plants comprising about 70 species, including sunflowers'})
CREATE (:Genus {name: 'Lactuca', description: 'A genus of plants that includes lettuce'})
CREATE (:Genus {name: 'Tagetes', description: 'A genus of annual or perennial, mostly herbaceous plants in the sunflower family, including marigolds'})
CREATE (:Genus {name: 'Chrysanthemum', description: 'A genus of about 40 species of flowering plants in the family Asteraceae'})
CREATE (:Genus {name: 'Calendula', description: 'A genus of about 15–20 species of annual and perennial herbaceous plants in the daisy family Asteraceae'})

// Create Plant nodes
CREATE (:Plant {name: 'Sunflower', binomial_name: 'Helianthus annuus', height: '1.5-3.0 meters', period_seed: '7-10 days', period_grow: '80-120 days', period_yield: '30-45 days', period_all: '4-5 months'})
CREATE (:Plant {name: 'Lettuce', binomial_name: 'Lactuca sativa', height: '0.15-0.3 meters', period_seed: '7-10 days', period_grow: '45-65 days', period_yield: '7-14 days', period_all: '2-3 months'})
CREATE (:Plant {name: 'Marigold', binomial_name: 'Tagetes erecta', height: '0.15-0.9 meters', period_seed: '5-7 days', period_grow: '50-60 days', period_yield: '60-90 days', period_all: '3-5 months'})
CREATE (:Plant {name: 'Chrysanthemum', binomial_name: 'Chrysanthemum morifolium', height: '0.3-1.5 meters', period_seed: '7-14 days', period_grow: '100-150 days', period_yield: '30-60 days', period_all: '5-8 months'})
CREATE (:Plant {name: 'Calendula', binomial_name: 'Calendula officinalis', height: '0.3-0.6 meters', period_seed: '5-10 days', period_grow: '45-60 days', period_yield: '60-90 days', period_all: '3-5 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Asteraceae' AND g.name IN ['Helianthus', 'Lactuca', 'Tagetes', 'Chrysanthemum', 'Calendula']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Sunflower' AND g.name = 'Helianthus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Lettuce' AND g.name = 'Lactuca'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Marigold' AND g.name = 'Tagetes'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Chrysanthemum' AND g.name = 'Chrysanthemum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Calendula' AND g.name = 'Calendula'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Sunflower', 'Marigold', 'Chrysanthemum', 'Calendula'] AND pt.name = 'Flower'
CREATE (p)-[:IS_A]->(pt)

MATCH (p:Plant), (pt:PlantType)
WHERE p.name = 'Lettuce' AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Sunflower', 'Lettuce', 'Marigold', 'Chrysanthemum', 'Calendula'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Sunflower', 'Lettuce', 'Marigold', 'Chrysanthemum', 'Calendula'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Sunflower', 'Lettuce'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Lettuce', 'Marigold', 'Chrysanthemum', 'Calendula'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Sunflower', 'Lettuce'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Chrysanthemum', 'Calendula'] AND d.name = 'Rust'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Sunflower', 'Lettuce', 'Marigold', 'Chrysanthemum', 'Calendula'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Sunflower', 'Marigold', 'Calendula'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Lettuce', 'Chrysanthemum'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Sunflower', 'Marigold', 'Chrysanthemum', 'Calendula'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

MATCH (p:Plant), (lh:LightHours)
WHERE p.name = 'Lettuce' AND lh.name = 'Partial Shade'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Sunflower', 'Marigold', 'Calendula'] AND s.name = 'Summer'
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Lettuce' AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name = 'Chrysanthemum' AND s.name = 'Fall'
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Sunflower', 'Marigold', 'Chrysanthemum', 'Calendula'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name = 'Lettuce' AND shp.name = 'High'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Marigold' AND c.name IN ['Tomato', 'Onion', 'Garlic']
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Lettuce' AND c.name IN ['Carrot', 'Radish']
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Sunflower' AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Lettuce' AND cp.name = 'Parsley'
CREATE (p)-[:COMPETES_WITH]->(cp)