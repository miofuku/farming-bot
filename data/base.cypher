// Load base nodes
// This is an initialization script for the farming app
// Run it only once ;)

// Create PlantType nodes
CREATE (:PlantType {name: 'Vegetable', description: 'Plants cultivated for edible parts'})
CREATE (:PlantType {name: 'Fruit', description: 'Plants cultivated for edible fruit'})
CREATE (:PlantType {name: 'Grain', description: 'Plants cultivated for edible seeds or grains'})
CREATE (:PlantType {name: 'Herb', description: 'Plants valued for their aromatic or medicinal properties'})
CREATE (:PlantType {name: 'Flower', description: 'Ornamental plants grown for their blooms'})
CREATE (:PlantType {name: 'Tree', description: 'Woody perennial plants with a single stem'})
CREATE (:PlantType {name: 'Shrub', description: 'Woody perennial plants with multiple stems'})

// Create Climate nodes
CREATE (:Climate {name: 'Tropical', temperature: 'Hot', rainfall: 'High', humidity: 'High'})
CREATE (:Climate {name: 'Subtropical', temperature: 'Warm', rainfall: 'Moderate', humidity: 'Moderate to High'})
CREATE (:Climate {name: 'Mediterranean', temperature: 'Warm to Hot', rainfall: 'Moderate', humidity: 'Low to Moderate'})
CREATE (:Climate {name: 'Temperate', temperature: 'Moderate', rainfall: 'Moderate', humidity: 'Moderate'})
CREATE (:Climate {name: 'Continental', temperature: 'Cold to Hot', rainfall: 'Low to Moderate', humidity: 'Low to Moderate'})
CREATE (:Climate {name: 'Polar', temperature: 'Cold', rainfall: 'Low', humidity: 'Low'})

// Create SoilType nodes
CREATE (:SoilType {name: 'Sandy', pH: 6.0, drainage: 'Good', texture: 'Coarse'})
CREATE (:SoilType {name: 'Loamy', pH: 6.5, drainage: 'Moderate', texture: 'Fine'})
CREATE (:SoilType {name: 'Clay', pH: 7.0, drainage: 'Poor', texture: 'Fine'})
CREATE (:SoilType {name: 'Silty', pH: 6.8, drainage: 'Moderate', texture: 'Fine'})
CREATE (:SoilType {name: 'Peaty', pH: 5.5, drainage: 'Good', texture: 'Fine'})
CREATE (:SoilType {name: 'Chalky', pH: 8.0, drainage: 'Good', texture: 'Fine'})

// Create Pest nodes
CREATE (:Pest {name: 'Aphids', description: 'Small, soft-bodied insects that feed on plant sap', symptoms: 'Curled leaves, sticky honeydew, yellowing leaves', prevention: 'Encourage natural predators, use insecticidal soap or neem oil', treatment: 'Insecticidal soap, neem oil, or systemic insecticides'})
CREATE (:Pest {name: 'Spider Mites', description: 'Tiny arachnids that feed on plant cells', symptoms: 'Stippling or bronzing on leaves, webbing on plants', prevention: 'Maintain proper humidity, use predatory mites', treatment: 'Insecticidal soap, horticultural oil, or miticides'})
CREATE (:Pest {name: 'Slugs and Snails', description: 'Soft-bodied mollusks that feed on plants', symptoms: 'Holes in leaves, slime trails', prevention: 'Remove hiding spots, use copper barriers', treatment: 'Baits, diatomaceous earth, or organic pesticides'})
CREATE (:Pest {name: 'Cutworms', description: 'Caterpillars that feed on stems and leaves', symptoms: 'Chewed leaves or stems, wilting plants', prevention: 'Use collars around plants, remove debris', treatment: 'Bacillus thuringiensis (Bt) or other insecticides'})
CREATE (:Pest {name: 'Whiteflies', description: 'Small, winged insects that feed on plant sap', symptoms: 'Sticky honeydew, sooty mold, yellowing leaves', prevention: 'Use reflective mulches, encourage natural predators', treatment: 'Insecticidal soap, horticultural oil, or insecticides'})

// Create Disease nodes
CREATE (:Disease {name: 'Blight', description: 'A fungal disease that affects plants', symptoms: 'Wilting, brown spots on leaves, stem lesions', prevention: 'Plant disease-resistant varieties, crop rotation, good air circulation', treatment: 'Fungicides, removal of affected plants'})
CREATE (:Disease {name: 'Powdery Mildew', description: 'A fungal disease that causes a white, powdery coating on plants', symptoms: 'White powdery growth on leaves, stems, and buds', prevention: 'Proper spacing, good air circulation, resistant varieties', treatment: 'Fungicides, horticultural oils, remove affected parts'})
CREATE (:Disease {name: 'Rust', description: 'A fungal disease that causes reddish-brown spots or pustules', symptoms: 'Reddish-brown spots or pustules on leaves and stems', prevention: 'Plant resistant varieties, crop rotation, avoid overhead watering', treatment: 'Fungicides, remove affected plants'})
CREATE (:Disease {name: 'Wilt', description: 'A disease caused by fungi or bacteria that clogs the plant\'s vascular system', symptoms: 'Wilting, yellowing leaves, stunted growth', prevention: 'Plant resistant varieties, crop rotation, proper irrigation', treatment: 'Fungicides or bactericides, remove affected plants'})
CREATE (:Disease {name: 'Mosaic Virus', description: 'A viral disease that causes discoloration and distortion of leaves', symptoms: 'Mottled or streaked patterns on leaves, stunted growth', prevention: 'Use certified disease-free seeds, control insect vectors', treatment: 'No chemical treatment, remove affected plants'})

// Create Fertilizer nodes
CREATE (:Fertilizer {name: 'Compost', description: 'Organic matter that has been decomposed and recycled as a fertilizer', nutrientProfile: 'Balanced NPK, micronutrients', beneficialProperties: 'Improves soil structure, water retention, and microbial activity'})
CREATE (:Fertilizer {name: 'Manure', description: 'Animal waste used as a fertilizer', nutrientProfile: 'Balanced NPK, micronutrients', beneficialProperties: 'Improves soil structure, water retention, and microbial activity'})
CREATE (:Fertilizer {name: 'Blood Meal', description: 'Dried blood from animals, used as a nitrogen fertilizer', nutrientProfile: 'High nitrogen content', beneficialProperties: 'Slow-release nitrogen source'})
CREATE (:Fertilizer {name: 'Bone Meal', description: 'Ground animal bones, used as a phosphorus fertilizer', nutrientProfile: 'High phosphorus content', beneficialProperties: 'Promotes root growth and flower/fruit development'})
CREATE (:Fertilizer {name: 'Potassium Sulfate', description: 'A mineral fertilizer, used as a source of potassium', nutrientProfile: 'High potassium content', beneficialProperties: 'Improves plant vigor, disease resistance, and drought tolerance'})
CREATE (:Fertilizer {name: 'Seaweed Extract', description: 'A liquid fertilizer derived from seaweed', nutrientProfile: 'Balanced NPK, micronutrients, growth hormones', beneficialProperties: 'Promotes overall plant health and stress resistance'})

// Create Temperature nodes
CREATE (:Temperature {name: 'Very Low', range: 'Below 10°C (50°F)'})
CREATE (:Temperature {name: 'Low', range: '10-15°C (50-59°F)'})
CREATE (:Temperature {name: 'Cool', range: '15-20°C (59-68°F)'})
CREATE (:Temperature {name: 'Warm', range: '20-25°C (68-77°F)'})
CREATE (:Temperature {name: 'Hot', range: '25-30°C (77-86°F)'})
CREATE (:Temperature {name: 'Very Hot', range: 'Above 30°C (86°F)'})

// Create LightHours nodes
CREATE (:LightHours {name: 'Low Light', range: '4-6 hours of sunlight per day'})
CREATE (:LightHours {name: 'Partial Shade', range: '6-8 hours of sunlight per day'})
CREATE (:LightHours {name: 'Full Sun', range: 'More than 8 hours of sunlight per day'})

// Create Season nodes
CREATE (:Season {name: 'Spring', description: 'The season of new growth and planting'})
CREATE (:Season {name: 'Summer', description: 'The warmest season with abundant sunshine'})
CREATE (:Season {name: 'Fall', description: 'The season of harvest and preparation for winter'})
CREATE (:Season {name: 'Winter', description: 'The coldest season with dormancy and rest'})

// Create SoilHumidityPercentage nodes
CREATE (:SoilHumidityPercentage {name: 'Very Low', range: '0-20%'})
CREATE (:SoilHumidityPercentage {name: 'Low', range: '20-40%'})
CREATE (:SoilHumidityPercentage {name: 'Moderate', range: '40-60%'})
CREATE (:SoilHumidityPercentage {name: 'High', range: '60-80%'})
CREATE (:SoilHumidityPercentage {name: 'Very High', range: '80-100%'})

// Create Companion plant nodes
CREATE (:Plant {name: 'Carrot', description: 'A root vegetable that can be grown as a companion for onions and leeks'})
CREATE (:Plant {name: 'Marigold', description: 'A flowering plant that helps repel nematodes and other pests, making it a good companion for onions and garlic'})
CREATE (:Plant {name: 'Nasturtium', description: 'A flowering plant that attracts beneficial insects and can be a companion for onions and garlic'})

// Create Competitive plant nodes
CREATE (:Plant {name: 'Pea', description: 'A legume that competes for nutrients with onions and garlic'})
CREATE (:Plant {name: 'Fennel', description: 'A herb that can inhibit the growth of onions and other alliums'})
