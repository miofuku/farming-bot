// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Apiaceae family
// Create Apiaceae Family node
CREATE (:Family {name: 'Apiaceae', description: 'A family of herbaceous plants commonly known as the carrot or parsley family'})

// Create Genus nodes
CREATE (:Genus {name: 'Daucus', description: 'A genus of flowering plants in the carrot family, including carrots'})
CREATE (:Genus {name: 'Apium', description: 'A genus of plants in the carrot family, including celery'})
CREATE (:Genus {name: 'Coriandrum', description: 'A genus of plants in the carrot family, including cilantro/coriander'})

// Create Plant nodes
CREATE (:Plant {name: 'Carrot', binomial_name: 'Daucus carota', height: '0.2-0.6 meters', period_seed: '10-14 days', period_grow: '3-4 months', period_yield: '2-3 weeks', period_all: '4-5 months'})
CREATE (:Plant {name: 'Celery', binomial_name: 'Apium graveolens', height: '0.3-1 meter', period_seed: '14-21 days', period_grow: '4-5 months', period_yield: '2-3 weeks', period_all: '5-6 months'})
CREATE (:Plant {name: 'Cilantro/Coriander', binomial_name: 'Coriandrum sativum', height: '0.2-0.6 meters', period_seed: '7-14 days', period_grow: '2-3 months', period_yield: '2-4 weeks', period_all: '3-4 months'})

// Link plants to Family and Genus nodes
MATCH (p:Plant), (f:Family)
WHERE p.name IN ['Carrot', 'Celery', 'Cilantro/Coriander'] AND f.name = 'Apiaceae'
CREATE (p)-[:BELONGS_TO]->(f)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Carrot' AND g.name = 'Daucus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Celery' AND g.name = 'Apium'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Cilantro/Coriander' AND g.name = 'Coriandrum'
CREATE (p)-[:BELONGS_TO]->(g)



// Link plants to Companion plant nodes
MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Carrot', 'Celery'] AND c.name = 'Tomato'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Carrot', 'Cilantro/Coriander'] AND c.name = 'Radish'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant nodes
MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Carrot', 'Cilantro/Coriander'] AND cp.name = 'Dill'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Carrot', 'Celery'] AND cp.name = 'Potato'
CREATE (p)-[:COMPETES_WITH]->(cp)
