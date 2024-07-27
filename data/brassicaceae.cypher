// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Brassicaceae family
// Create Brassicaceae family node
CREATE (:Family {name: 'Brassicaceae', description: 'A family of flowering plants commonly known as the cabbage or mustard family'})

// Create Genus nodes
CREATE (:Genus {name: 'Brassica', description: 'A genus of plants including cabbage, broccoli, cauliflower, kale, and Brussels sprouts'})
CREATE (:Genus {name: 'Raphanus', description: 'A genus of plants including radishes'})
CREATE (:Genus {name: 'Armoracia', description: 'A genus of plants including horseradish'})

// Create Plant nodes for vegetable PlantType
CREATE (:Plant {name: 'Broccoli', binomial_name: 'Brassica oleracea var. italica', height: '0.6-0.9 meters', period_seed: '5-10 days', period_grow: '2-3 months', period_yield: '2-3 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Cabbage', binomial_name: 'Brassica oleracea var. capitata', height: '0.3-0.6 meters', period_seed: '7-10 days', period_grow: '3-4 months', period_yield: '2-3 weeks', period_all: '4-5 months'})
CREATE (:Plant {name: 'Cauliflower', binomial_name: 'Brassica oleracea var. botrytis', height: '0.4-0.8 meters', period_seed: '7-10 days', period_grow: '2-3 months', period_yield: '2-3 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Kale', binomial_name: 'Brassica oleracea var. sabellica', height: '0.3-0.9 meters', period_seed: '5-10 days', period_grow: '2-3 months', period_yield: 'Continuous', period_all: '3-4 months'})
CREATE (:Plant {name: 'Brussels Sprouts', binomial_name: 'Brassica oleracea var. gemmifera', height: '0.6-0.9 meters', period_seed: '5-10 days', period_grow: '3-4 months', period_yield: '2-3 weeks', period_all: '4-5 months'})
CREATE (:Plant {name: 'Radish', binomial_name: 'Raphanus sativus', height: '0.15-0.3 meters', period_seed: '3-7 days', period_grow: '3-4 weeks', period_yield: '1-2 weeks', period_all: '1-2 months'})
CREATE (:Plant {name: 'Horseradish', binomial_name: 'Armoracia rusticana', height: '0.6-1.5 meters', period_seed: '10-15 days', period_grow: '1-2 years', period_yield: '2-3 weeks', period_all: '1-2 years'})
CREATE (:Plant {name: 'Tatsoi', binomial_name: 'Brassica rapa var. narinosa', height: '0.15-0.3 meters', period_seed: '5-10 days', period_grow: '1-2 months', period_yield: '2-3 weeks', period_all: '2-3 months'})
CREATE (:Plant {name: 'Chinese Broccoli', binomial_name: 'Brassica oleracea var. alboglabra', height: '0.3-0.6 meters', period_seed: '5-10 days', period_grow: '1-2 months', period_yield: '2-3 weeks', period_all: '2-3 months'})
CREATE (:Plant {name: 'Kohlrabi', binomial_name: 'Brassica oleracea var. gongylodes', height: '0.3-0.45 meters', period_seed: '5-10 days', period_grow: '1-2 months', period_yield: '2-3 weeks', period_all: '2-3 months'})
CREATE (:Plant {name: 'Napa Cabbage', binomial_name: 'Brassica rapa subsp. pekinensis', height: '0.3-0.45 meters', period_seed: '5-10 days', period_grow: '2-3 months', period_yield: '2-3 weeks', period_all: '3-4 months'})
CREATE (:Plant {name: 'Daikon', binomial_name: 'Raphanus sativus var. longipinnatus', height: '0.3-0.6 meters', period_seed: '5-10 days', period_grow: '1-2 months', period_yield: '2-3 weeks', period_all: '2-3 months'})
CREATE (:Plant {name: 'Pak Choi', binomial_name: 'Brassica rapa subsp. chinensis', height: '0.15-0.3 meters', period_seed: '5-10 days', period_grow: '1-2 months', period_yield: '2-3 weeks', period_all: '2-3 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Brassicaceae' AND g.name IN ['Brassica', 'Raphanus', 'Armoracia']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Pak Choi'] AND g.name = 'Brassica'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Radish', 'Daikon'] AND g.name = 'Raphanus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Horseradish' AND g.name = 'Armoracia'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND pt.name = 'Vegetable'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND s.name IN ['Spring', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Horseradish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts'] AND c.name = 'Onion'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts'] AND c.name = 'Marigold'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Broccoli', 'Cabbage', 'Cauliflower', 'Kale', 'Brussels Sprouts', 'Radish', 'Tatsoi', 'Chinese Broccoli', 'Kohlrabi', 'Napa Cabbage', 'Daikon', 'Pak Choi'] AND cp.name = 'Tomato'
CREATE (p)-[:COMPETES_WITH]->(cp)