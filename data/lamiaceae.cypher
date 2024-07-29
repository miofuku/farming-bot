// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

// Lamiaceae family
// Create Lamiaceae family node
CREATE (:Family {name: 'Lamiaceae', description: 'A family of flowering plants commonly known as the mint or deadnettle family'})

// Create Genus nodes
CREATE (:Genus {name: 'Perilla', description: 'A genus of annual herb plants including shiso'})
CREATE (:Genus {name: 'Ocimum', description: 'A genus of aromatic annual and perennial herbs including basil and Thai basil'})
CREATE (:Genus {name: 'Mentha', description: 'A genus of aromatic perennial herbs including various types of mint'})
CREATE (:Genus {name: 'Rosmarinus', description: 'A genus of evergreen aromatic shrubs including rosemary'})
CREATE (:Genus {name: 'Salvia', description: 'A large genus of shrubs, herbaceous perennials, and annuals including sage'})

// Create Plant nodes for herb PlantType
CREATE (:Plant {name: 'Shiso', binomial_name: 'Perilla frutescens', height: '0.5-1.0 meters', period_seed: '1-2 weeks', period_grow: '2-3 months', period_yield: '2-3 months', period_all: '4-6 months'})
CREATE (:Plant {name: 'Basil', binomial_name: 'Ocimum basilicum', height: '0.3-0.6 meters', period_seed: '5-10 days', period_grow: '6-8 weeks', period_yield: '2-3 months', period_all: '4-5 months'})
CREATE (:Plant {name: 'Thai Basil', binomial_name: 'Ocimum basilicum var. thyrsiflora', height: '0.3-0.6 meters', period_seed: '5-10 days', period_grow: '6-8 weeks', period_yield: '2-3 months', period_all: '4-5 months'})
CREATE (:Plant {name: 'Peppermint', binomial_name: 'Mentha × piperita', height: '0.3-0.9 meters', period_seed: 'N/A (propagated by cuttings)', period_grow: '2-3 months', period_yield: '3-4 months', period_all: '5-7 months'})
CREATE (:Plant {name: 'Rosemary', binomial_name: 'Rosmarinus officinalis', height: '0.5-1.5 meters', period_seed: '14-21 days', period_grow: '6-12 months', period_yield: 'Year-round', period_all: 'Perennial'})
CREATE (:Plant {name: 'Sage', binomial_name: 'Salvia officinalis', height: '0.3-0.6 meters', period_seed: '10-21 days', period_grow: '2-3 months', period_yield: '3-4 months', period_all: '5-7 months'})

// Relate Genera to Family
MATCH (f:Family), (g:Genus)
WHERE f.name = 'Lamiaceae' AND g.name IN ['Perilla', 'Ocimum', 'Mentha', 'Rosmarinus', 'Salvia']
CREATE (g)-[:BELONGS_TO]->(f)

// Relate Plants to Genera
MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Shiso' AND g.name = 'Perilla'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name IN ['Basil', 'Thai Basil'] AND g.name = 'Ocimum'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Peppermint' AND g.name = 'Mentha'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Rosemary' AND g.name = 'Rosmarinus'
CREATE (p)-[:BELONGS_TO]->(g)

MATCH (p:Plant), (g:Genus)
WHERE p.name = 'Sage' AND g.name = 'Salvia'
CREATE (p)-[:BELONGS_TO]->(g)

// Relate Plants to PlantTypes
MATCH (p:Plant), (pt:PlantType)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil', 'Peppermint', 'Rosemary', 'Sage'] AND pt.name = 'Herb'
CREATE (p)-[:IS_A]->(pt)

// Link plants to Climate
MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil', 'Peppermint'] AND c.name = 'Temperate'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

MATCH (p:Plant), (c:Climate)
WHERE p.name IN ['Rosemary', 'Sage'] AND c.name = 'Mediterranean'
CREATE (p)-[:SUITABLE_CLIMATE]->(c)

// Link plants to SoilType
MATCH (p:Plant), (s:SoilType)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil', 'Peppermint', 'Rosemary', 'Sage'] AND s.name = 'Loamy'
CREATE (p)-[:SUITABLE_SOIL]->(s)

// Link plants to Pest nodes
MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Basil', 'Thai Basil', 'Peppermint', 'Rosemary', 'Sage'] AND pe.name = 'Aphids'
CREATE (p)-[:AFFECTED_BY]->(pe)

MATCH (p:Plant), (pe:Pest)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil'] AND pe.name = 'Spider Mites'
CREATE (p)-[:AFFECTED_BY]->(pe)

// Link plants to Disease
MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Basil', 'Thai Basil'] AND d.name = 'Powdery Mildew'
CREATE (p)-[:AFFECTED_BY]->(d)

MATCH (p:Plant), (d:Disease)
WHERE p.name IN ['Peppermint', 'Rosemary', 'Sage'] AND d.name = 'Rust'
CREATE (p)-[:AFFECTED_BY]->(d)

// Link plants to Fertilizer
MATCH (p:Plant), (f:Fertilizer)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil', 'Peppermint', 'Rosemary', 'Sage'] AND f.name = 'Compost'
CREATE (p)-[:RECOMMENDED_FERTILIZER]->(f)

// Link plants to Temperature
MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil'] AND t.name = 'Warm'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

MATCH (p:Plant), (t:Temperature)
WHERE p.name IN ['Peppermint', 'Rosemary', 'Sage'] AND t.name = 'Cool'
CREATE (p)-[:SUITABLE_TEMPERATURE]->(t)

// Link plants to LightHours
MATCH (p:Plant), (lh:LightHours)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil', 'Rosemary', 'Sage'] AND lh.name = 'Full Sun'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

MATCH (p:Plant), (lh:LightHours)
WHERE p.name = 'Peppermint' AND lh.name = 'Partial Shade'
CREATE (p)-[:SUITABLE_LIGHT]->(lh)

// Link plants to Season
MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil'] AND s.name IN ['Spring', 'Summer']
CREATE (p)-[:SUITABLE_SEASON]->(s)

MATCH (p:Plant), (s:Season)
WHERE p.name IN ['Peppermint', 'Rosemary', 'Sage'] AND s.name IN ['Spring', 'Summer', 'Fall']
CREATE (p)-[:SUITABLE_SEASON]->(s)

// Link plants to SoilHumidityPercentage
MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Shiso', 'Basil', 'Thai Basil', 'Peppermint'] AND shp.name = 'Moderate'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

MATCH (p:Plant), (shp:SoilHumidityPercentage)
WHERE p.name IN ['Rosemary', 'Sage'] AND shp.name = 'Low'
CREATE (p)-[:SUITABLE_SOIL_HUMIDITY]->(shp)

// Link plants to Companion
MATCH (p:Plant), (c:Plant)
WHERE p.name IN ['Basil', 'Thai Basil'] AND c.name = 'Tomato'
CREATE (p)-[:COMPANION_WITH]->(c)

MATCH (p:Plant), (c:Plant)
WHERE p.name = 'Rosemary' AND c.name = 'Carrot'
CREATE (p)-[:COMPANION_WITH]->(c)

// Link plants to Competitive plant
MATCH (p:Plant), (cp:Plant)
WHERE p.name = 'Peppermint' AND cp.name = 'Parsley'
CREATE (p)-[:COMPETES_WITH]->(cp)

MATCH (p:Plant), (cp:Plant)
WHERE p.name IN ['Basil', 'Thai Basil'] AND cp.name = 'Rue'
CREATE (p)-[:COMPETES_WITH]->(cp)