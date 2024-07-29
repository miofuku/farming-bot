// Plant Family Rotation
// This script establishes relationships between plant families for crop rotation
// Run it after the family nodes have been created

// Create ROTATE_AFTER relationships between families
// Note: These relationships are based on general principles and may need to be adjusted based on specific regional practices or research

// Amaryllidaceae (e.g., onions, garlic) rotations
MATCH (a:Family {name: 'Amaryllidaceae'}), (b:Family)
WHERE b.name IN ['Brassicaceae', 'Cucurbitaceae', 'Fabaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Convolvulaceae (e.g., sweet potatoes) rotations
MATCH (a:Family {name: 'Convolvulaceae'}), (b:Family)
WHERE b.name IN ['Poaceae', 'Fabaceae', 'Brassicaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Malvaceae (e.g., okra) rotations
MATCH (a:Family {name: 'Malvaceae'}), (b:Family)
WHERE b.name IN ['Poaceae', 'Fabaceae', 'Asteraceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Apiaceae (e.g., carrots, celery) rotations
MATCH (a:Family {name: 'Apiaceae'}), (b:Family)
WHERE b.name IN ['Fabaceae', 'Poaceae', 'Brassicaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Cucurbitaceae (e.g., cucumbers, squash) rotations
MATCH (a:Family {name: 'Cucurbitaceae'}), (b:Family)
WHERE b.name IN ['Poaceae', 'Fabaceae', 'Brassicaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Asteraceae (e.g., lettuce, sunflowers) rotations
MATCH (a:Family {name: 'Asteraceae'}), (b:Family)
WHERE b.name IN ['Fabaceae', 'Brassicaceae', 'Amaryllidaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Ericaceae (e.g., blueberries) rotations
// Note: Ericaceae often requires specific soil conditions and is not commonly rotated
MATCH (a:Family {name: 'Ericaceae'}), (b:Family)
WHERE b.name IN ['Poaceae', 'Fabaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Poaceae (e.g., corn, wheat) rotations
MATCH (a:Family {name: 'Poaceae'}), (b:Family)
WHERE b.name IN ['Fabaceae', 'Brassicaceae', 'Solanaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Fabaceae (e.g., beans, peas) rotations
MATCH (a:Family {name: 'Fabaceae'}), (b:Family)
WHERE b.name IN ['Solanaceae', 'Cucurbitaceae', 'Brassicaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Rosaceae (e.g., strawberries) rotations
MATCH (a:Family {name: 'Rosaceae'}), (b:Family)
WHERE b.name IN ['Poaceae', 'Fabaceae', 'Brassicaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Brassicaceae (e.g., cabbage, broccoli) rotations
MATCH (a:Family {name: 'Brassicaceae'}), (b:Family)
WHERE b.name IN ['Cucurbitaceae', 'Fabaceae', 'Poaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Lamiaceae (e.g., basil, mint) rotations
MATCH (a:Family {name: 'Lamiaceae'}), (b:Family)
WHERE b.name IN ['Apiaceae', 'Asteraceae', 'Fabaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Solanaceae (e.g., tomatoes, potatoes) rotations
MATCH (a:Family {name: 'Solanaceae'}), (b:Family)
WHERE b.name IN ['Fabaceae', 'Poaceae', 'Cucurbitaceae']
CREATE (a)-[:ROTATE_AFTER]->(b)

// Create a ROTATE_AFTER relationship from each family to itself with a low weight
// This represents that while it's possible to plant the same family again, it's not ideal
MATCH (a:Family)
WHERE a.name IN ['Amaryllidaceae', 'Convolvulaceae', 'Malvaceae', 'Apiaceae', 'Cucurbitaceae',
                 'Asteraceae', 'Ericaceae', 'Poaceae', 'Fabaceae', 'Rosaceae', 'Brassicaceae',
                 'Lamiaceae', 'Solanaceae']
CREATE (a)-[:ROTATE_AFTER {weight: 0.1}]->(a)

// Add weights to all ROTATE_AFTER relationships (if not already set)
MATCH ()-[r:ROTATE_AFTER]->()
WHERE NOT EXISTS(r.weight)
SET r.weight = 1.0

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
