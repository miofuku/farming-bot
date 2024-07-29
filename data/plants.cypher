// Load plants
// This is an initialization script for the farming app
// Run it only once ;)

 
// Crop rotation
CREATE
  (amaryllidaceae)-[:BEFORE_FAMILY]->(fabaceae),
  (amaryllidaceae)-[:BEFORE_FAMILY]->(solanaceae),
  (brassicaceae)-[:BEFORE_FAMILY]->(amaryllidaceae),
  (brassicaceae)-[:BEFORE_FAMILY]->(cucurbitaceae),
  (brassicaceae)-[:BEFORE_FAMILY]->(solanaceae),
  (convolvulaceae)-[:BEFORE_FAMILY]->(solanaceae),
  (cucurbitaceae)-[:BEFORE_FAMILY]->(amaryllidaceae),
  (cucurbitaceae)-[:BEFORE_FAMILY]->(brassicaceae),
  (cucurbitaceae)-[:BEFORE_FAMILY]->(fabaceae),
  (fabaceae)-[:BEFORE_FAMILY]->(amaryllidaceae),
  (fabaceae)-[:BEFORE_FAMILY]->(brassicaceae),
  (fabaceae)-[:BEFORE_FAMILY]->(solanaceae),
  (poaceae)-[:BEFORE_FAMILY]->(amaryllidaceae),
  (poaceae)-[:BEFORE_FAMILY]->(cucurbitaceae),
  (poaceae)-[:BEFORE_FAMILY]->(solanaceae),
  (solanaceae)-[:BEFORE_FAMILY]->(amaryllidaceae),
  (solanaceae)-[:BEFORE_FAMILY]->(brassicaceae),
  (solanaceae)-[:BEFORE_FAMILY]->(convolvulaceae),
  (solanaceae)-[:BEFORE_FAMILY]->(fabaceae)

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
