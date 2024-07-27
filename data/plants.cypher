// Load plants
// This is an initialization script for the farming app
// Run it only once ;)


// Brassicaceae family
CREATE (brassicaceae:Family {name:'Brassicaceae'})
CREATE (brassica:Genus {name:'Brassica'})
CREATE (raphanus:Genus {name:'Raphanus'})
CREATE (chineseCabbage:Vegetable {name:'Chinese Cabbage', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[6.5,7.5], season:['spring','autumn'], light_hour:6, temp_seed:[20,25], temp_plant:[17,22], temp_grow:[12,22], water_seed:'80%', water_grow:'70%', water_fruit:'80%', days:80})
CREATE (greenRadish:Vegetable {name:'Green Radish', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[7,7.5], season:['spring','autumn'], light_hour:6, temp_seed:[20,25], temp_plant:[5,28], temp_grow:[6,20], water_seed:'80%', water_grow:'60%', water_fruit:'75%', days:70})
CREATE (pakChoi:Vegetable {name:'Pak Choi', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[6,7], season:['spring','autumn'], light_hour:6, temp_seed:[20,25], temp_grow:[15,20], water_seed:'20%', water_grow:'40%', water_fruit:'60%', days:25})
CREATE (tatsoi:Vegetable {name:'Tatsoi', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[6,7], season:['autumn','winter'], light_hour:6, temp_seed:[15,25], temp_grow:[5,20], water_seed:'20%', water_grow:'40%', days:80})
CREATE (babyCabbage:Vegetable {name:'Baby Cabbage', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[6.5,7.5], season:['spring','autumn'], light_hour:6, temp_seed:[20,25], temp_plant:[15,20], temp_grow:[5,25], water_seed:'20%', water_grow:'40%', days:50})
CREATE (redRadish:Vegetable {name:'Red Radish', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[7,7.5], season:['spring','autumn'], light_hour:6, temp_seed:[20,25], temp_grow:[8,24], temp_fruit:[10,18], water_seed:'80%', water_grow:'70%', water_fruit:'75%', days:25})
CREATE (chineseBroccoli:Vegetable {name:'Chinese Broccoli', height:'low', soil_humid:'wet', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[6.5,8], season:['spring','summer'], light_hour:6, temp_seed:[25,30], temp_grow:[15,25], temp_fruit:[10,18], water_seed:'80%', water_grow:'90%', days:80})
CREATE (kohlrabi:Vegetable {name:'Kohlrabi', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['K'], ph:[6.5,7], season:['spring','autumn'], light_hour:6, temp_seed:[20,25], temp_grow:[15,25], temp_fruit:[18,22], water_seed:'60%', water_grow:'70%', days:70})
CREATE (kale:Vegetable {name:'Kale', height:'high', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['K'], ph:[6.5,7], season:['spring','autumn'], light_hour:8, temp_seed:[20,25], temp_grow:[10,20], water_seed:'80%', water_grow:'70%', days:70})
CREATE 
  (brassica)-[:IN_FAMILY]->(brassicaceae),
  (raphanus)-[:IN_FAMILY]->(brassicaceae),
  (chineseCabbage)-[:IN_GENUS]->(brassica),
  (greenRadish)-[:IN_GENUS]->(raphanus),
  (pakChoi)-[:IN_GENUS]->(brassica),
  (tatsoi)-[:IN_GENUS]->(brassica),
  (babyCabbage)-[:IN_GENUS]->(brassica),
  (redRadish)-[:IN_GENUS]->(raphanus),
  (chineseBroccoli)-[:IN_GENUS]->(brassica),
  (kohlrabi)-[:IN_GENUS]->(brassica),
  (kale)-[:IN_GENUS]->(brassica)


// Convolvulaceae family
CREATE (convolvulaceae:Family {name:'Convolvulaceae'})
CREATE (ipomoea:Genus {name:'Ipomoea'}) 
CREATE (sweetPotato:Vegetable {name:'Sweet Potato', height:'low', soil_humid:'half-dry', fertile:'=', fert_growth:['N'], fert_fruit:['K'], ph:[5.2,6.7], season:['spring','summer'], light_hour:8, temp_seed:[20,32], temp_grow:[21,26], temp_fruit:[21,29], water_seed:'70%', water_grow:'80%', water_fruit:'70%', days:150})
CREATE (waterSpinach:Vegetable {name:'Water Spinach', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['K'], ph:[5.5,7.5], season:['summer'], light_hour:8, temp_seed:[20,32], temp_grow:[20,25], water_seed:'80%', water_grow:'85%', days:60})
CREATE 
  (ipomoea)-[:IN_FAMILY]->(convolvulaceae),
  (sweetPotato)-[:IN_GENUS]->(ipomoea),
  (waterSpinach)-[:IN_GENUS]->(ipomoea)
  

// Cucurbitaceae family
CREATE (cucurbitaceae:Family {name:'Cucurbitaceae'})
CREATE (cucumis:Genus {name:'Cucumis'}) 
CREATE (citrullus:Genus {name:'Citrullus'}) 
CREATE (cucurbita:Genus {name:'Cucurbita'}) 
CREATE (lagenaria:Genus {name:'Lagenaria'})
CREATE (cucumber:Vegetable {name:'Cucumber', height:'high', soil_humid:'wet', fertile:'-', fert_growth:['N','P','K'], fert_fruit:['P','K'], ph:[6.5,7], season:['spring','summer'], light_hour:8, temp_seed:[18,25], temp_grow:[20,24], temp_fruit:[25,30], water_seed:'85%', water_grow:'95%', days:70})
CREATE (melon:Fruit {name:'Melon', height:'low', soil_humid:'wet', fertile:'-', fert_growth:['N','P','K'], fert_fruit:['N','K'], ph:[6,6.8], season:['spring','summer'], light_hour:12, temp_seed:[25,30], temp_grow:[20,32], temp_fruit:[25,30], water_seed:'65%', water_grow:'75%', water_fruit:'55%', days:70})    
CREATE (watermelon:Fruit {name:'Watermelon', height:'low', soil_humid:'dry', fertile:'-', fert_growth:['N'], fert_fruit:['K'], ph:[6,6.8], season:['spring','summer'], light_hour:10, temp_seed:[25,30], temp_grow:[22,28], temp_fruit:[28,30], water_seed:'60%', water_grow:'70%', water_fruit:'70%', days:90})
CREATE (zucchini:Vegetable {name:'Zucchini', height:'high', soil_humid:'wet', fertile:'-', fert_growth:['N','P','K'], fert_fruit:['K'], ph:[5,6.8], season:['spring','summer'], light_hour:8, temp_seed:[25,30], temp_grow:[13,25], temp_fruit:[20,25], water_seed:'70%', water_grow:'80%', water_fruit:'70%', days:90}) 
CREATE (bottleGourd:Vegetable {name:'Bottle Gourd', height:'high', soil_humid:'wet', fertile:'-', fert_growth:['N','P','K'], fert_fruit:['K'], ph:[6.5,7], season:['spring','summer'], light_hour:8, temp_seed:[20,30], temp_grow:[20,28], water_seed:'70%', water_grow:'70%', days:90}) 
CREATE (pumpkin:Vegetable {name:'Pumpkin', height:'low', soil_humid:'dry', fertile:'-', fert_growth:['N','P','K'], fert_fruit:['K'], ph:[5.5,6.8], season:['spring','summer'], light_hour:8, temp_seed:[25,30], temp_grow:[15,25], temp_fruit:[25,27], water_seed:'70%', water_grow:'70%', days:50}) 
CREATE 
  (cucumis)-[:IN_FAMILY]->(cucurbitaceae),
  (citrullus)-[:IN_FAMILY]->(cucurbitaceae),
  (cucurbita)-[:IN_FAMILY]->(cucurbitaceae),
  (lagenaria)-[:IN_FAMILY]->(cucurbitaceae),  
  (cucumber)-[:IN_GENUS]->(cucumis),
  (melon)-[:IN_GENUS]->(cucumis),
  (watermelon)-[:IN_GENUS]->(citrullus),
  (zucchini)-[:IN_GENUS]->(cucurbita),
  (bottleGourd)-[:IN_GENUS]->(lagenaria),
  (pumpkin)-[:IN_GENUS]->(cucurbita)


// Ericaceae family
CREATE (ericaceae:Family {name:'Ericaceae'})
CREATE (vaccinium:Genus {name:'Vaccinium'}) 
CREATE (blueberry:Vegetable {name:'Blueberry', height:'low', soil_humid:'wet', fertile:'-', fert_growth:['N'], fert_fruit:['N','P','K'], ph:[4,5], season:['spring','summer'], light_hour:8, temp_seed:[20,25], temp_grow:[15,25], temp_fruit:[20,25], water_seed:'70%', water_grow:'70%', days:100})  
CREATE 
  (vaccinium)-[:IN_FAMILY]->(ericaceae),
  (blueberry)-[:IN_GENUS]->(vaccinium)
  
  
// Fabaceae family
CREATE (fabaceae:Family {name:'Fabaceae'})
CREATE (vigna:Genus {name:'Vigna'})  
CREATE (pisum:Genus {name:'Pisum'}) 
CREATE (glycine:Genus {name:'Glycine'}) 
CREATE (yardlongBean:Vegetable {name:'Yardlong Bean', height:'high', soil_humid:'dry', fertile:'+', fert_growth:['N'], fert_fruit:['N','P','K'], ph:[6,7.5], season:['spring','summer'], light_hour:10, temp_seed:[25,30], temp_grow:[18,25], temp_fruit:[25,28], water_seed:'50%', water_grow:'70%', days:100})  
CREATE (pea:Vegetable {name:'Pea', height:'high', soil_humid:'dry', fertile:'+', fert_growth:['N'], fert_fruit:['N','P','K'], ph:[6,7.2], season:['spring','autumn'], light_hour:10, temp_seed:[15,18], temp_grow:[12,20], temp_fruit:[15,20], water_seed:'50%', water_grow:'70%', days:80})   
CREATE (edamame:Vegetable {name:'Edamame', height:'medium', soil_humid:'dry', fertile:'+', fert_growth:['N'], fert_fruit:['N','P','K'], ph:[6,7.5], season:['spring','autumn'], light_hour:6, temp_seed:[15,20], temp_grow:[20,25], water_seed:'80%', water_grow:'70%', days:90})     
CREATE 
  (vigna)-[:IN_FAMILY]->(fabaceae),
  (pisum)-[:IN_FAMILY]->(fabaceae),
  (glycine)-[:IN_FAMILY]->(fabaceae),
  (yardlongBean)-[:IN_GENUS]->(vigna),
  (pea)-[:IN_GENUS]->(pisum),
  (edamame)-[:IN_GENUS]->(glycine)  


// Lamiaceae family
CREATE (lamiaceae:Family {name:'Lamiaceae'})
CREATE (perilla:Genus {name:'Perilla'}) 
CREATE (ocimum:Genus {name:'Ocimum'}) 
CREATE (mentha:Genus {name:'Mentha'}) 
CREATE (shiso:Vegetable {name:'Shiso', height:'low', soil_humid:'wet', fertile:'-', fert_growth:['N'], fert_fruit:['N','K'], ph:[6.6,7], season:['spring','summer'], light_hour:6, temp_seed:[18,20], temp_grow:[16,22], temp_fruit:[22,28], water_seed:'70%', water_grow:'70%', water_fruit:'80%', days:60})  
CREATE (basil:Vegetable {name:'Basil', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['N','K'], ph:[6,7], season:['spring','summer'], light_hour:8, temp_seed:[20,25], temp_grow:[15,28], water_seed:'70%', water_grow:'70%', days:60})  
CREATE (mint:Vegetable {name:'Mint', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['N','K'], ph:[6,7.5], season:['spring','summer'], light_hour:8, temp_seed:[20,25], temp_grow:[20,30], water_seed:'70%', water_grow:'70%', days:60})  
CREATE 
  (perilla)-[:IN_FAMILY]->(lamiaceae),
  (ocimum)-[:IN_FAMILY]->(lamiaceae),
  (mentha)-[:IN_FAMILY]->(lamiaceae),
  (shiso)-[:IN_GENUS]->(perilla),
  (basil)-[:IN_GENUS]->(ocimum),
  (mint)-[:IN_GENUS]->(ocimum)
  
  
// Malvaceae family
CREATE (malvaceae:Family {name:'Malvaceae'})
CREATE (abelmoschus:Genus {name:'Abelmoschus'}) 
CREATE (okra:Vegetable {name:'Okra', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['K'], ph:[6.6,7], season:['summer'], light_hour:10, temp_seed:[20,30], temp_grow:[21,26], temp_fruit:[26,30], water_seed:'70%', water_grow:'80%', water_fruit:'90%', days:70})  
CREATE 
  (abelmoschus)-[:IN_FAMILY]->(malvaceae),
  (okra)-[:IN_GENUS]->(abelmoschus)


// Poaceae family
CREATE (poaceae:Family {name:'Poaceae'})
CREATE (zea:Genus {name:'Zea'}) 
CREATE (corn:Fruit {name:'Corn', height:'high', soil_humid:'dry', fertile:'+', fert_growth:['N','K'], fert_fruit:['N','K'], ph:[6.5,7], season:['spring','summer','autumn'], light_hour:8, temp_seed:[15,20], temp_grow:[24,27], temp_fruit:[22,24], water_seed:'70%', water_grow:'60%', water_fruit:'70%', days:90})
CREATE 
  (zea)-[:IN_FAMILY]->(poaceae),
  (corn)-[:IN_GENUS]->(zea)


// Rosaceae family
CREATE (rosaceae:Family {name:'Rosaceae'})
CREATE (fragaria:Genus {name:'Fragaria'}) 
CREATE (strawberry:Fruit {name:'Strawberry', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[5.8,7], season:['spring','autumn'], light_hour:8, temp_seed:[15,20], temp_grow:[18,25], temp_fruit:[18,20], water_seed:'70%', water_grow:'80%', water_fruit:'60%', days:90})
CREATE 
  (fragaria)-[:IN_FAMILY]->(rosaceae),
  (strawberry)-[:IN_GENUS]->(fragaria)

  
// Solanaceae family
CREATE (solanaceae:Family {name:'Solanaceae'})
CREATE (solanum:Genus {name:'Solanum'})
CREATE (capsicum:Genus {name:'Capsicum'})
CREATE (physalis:Genus {name:'Physalis'})
CREATE (tomato:Vegetable {name:'Tomato', height:'medium', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['N','P','K'], ph:[6,7], season:['spring','summer'], light_hour:'6', temp_earth:[18,23], temp_seed:[10,25], temp_grow:[15,30], temp_fruit:[16,26], water_seed:'70%', water_grow:'80%', days:80})
CREATE (eggPlant:Vegetable {name:'Egg Plant', height:'medium', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['N','K'], ph:[6.8,7.3], season:['spring','summer'], light_hour:'8', temp_seed:[15,25], temp_grow:[20,30], temp_fruit:[25,30], water_grow:'60%', water_fruit:'80%', days:70})
CREATE (chiliPepper:Vegetable {name:'Chili Pepper', height:'medium', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['N','K'], ph:[6.2,7], season:['spring','summer'], light_hour:'8', temp_seed:[25,30], temp_grow:[20,30], temp_fruit:[20,25], water_grow:'70%', water_fruit:'80%', days:80})
CREATE (bellPepper:Vegetable {name:'Bell Pepper', height:'medium', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['N','K'], ph:[6.2,7], season:['spring','summer'], light_hour:'8', temp_seed:[25,30], temp_grow:[20,30], temp_fruit:[20,25], water_grow:'70%', water_fruit:'80%', days:80})
CREATE (potato:Vegetable {name:'Potato', height:'medium', soil_humid:'half-dry', fertile:'=', fert_growth:['N'], fert_fruit:['N','K'], ph:[6,7], season:['spring','summer'], light_hour:'10', temp_seed:[15,20], temp_grow:[16,22], water_seed:'50%', water_grow:'70%', days:100})
CREATE (physalisFruit:Vegetable {name:'Physalis Fruit', height:'low', soil_humid:'half-dry', fertile:'-', fert_growth:['N'], fert_fruit:['P','K'], ph:[6.5,7.5], season:['spring','summer'], light_hour:'10', temp_seed:[25,30], temp_grow:[20,25], water_seed:'60%', water_grow:'80%', water_fruit:'60%',days:80})
CREATE 
  (solanum)-[:IN_FAMILY]->(solanaceae),
  (capsicum)-[:IN_FAMILY]->(solanaceae),
  (physalis)-[:IN_FAMILY]->(solanaceae),
  (tomato)-[:IN_GENUS]->(solanum),
  (eggPlant)-[:IN_GENUS]->(solanum),
  (chiliPepper)-[:IN_GENUS]->(capsicum),
  (bellPepper)-[:IN_GENUS]->(capsicum),
  (potato)-[:IN_GENUS]->(solanum),
  (physalisFruit)-[:IN_GENUS]->(physalis)
 
 
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
  

  

// Intercrop  
CREATE
//NOT_WITH
  (cucumber)-[:NOT_WITH]->(tomato), 
  (cucumber)-[:NOT_WITH]->(pumpkin),
  (potato)-[:NOT_WITH]->(pumpkin),
  (potato)-[:NOT_WITH]->(cucumber),
  (potato)-[:NOT_WITH]->(melon),
  (potato)-[:NOT_WITH]->(watermelon),
  (potato)-[:NOT_WITH]->(tomato),
  (potato)-[:NOT_WITH]->(greenRadish),
  (eggPlant)-[:NOT_WITH]->(corn), 
  (eggPlant)-[:NOT_WITH]->(tomato), 
  (eggPlant)-[:NOT_WITH]->(potato), 
  (eggPlant)-[:NOT_WITH]->(bellPepper),
  (eggPlant)-[:NOT_WITH]->(chiliPepper), 
  (edamame)-[:NOT_WITH]->(garlic), 
  (edamame)-[:NOT_WITH]->(springOnion), 
  (edamame)-[:NOT_WITH]->(leek), 
  (pea)-[:NOT_WITH]->(garlic), 
  (pea)-[:NOT_WITH]->(springOnion), 
  (pea)-[:NOT_WITH]->(tomato), 
  (pea)-[:NOT_WITH]->(leek), 
  (yardlongBean)-[:NOT_WITH]->(edamame), 
  (yardlongBean)-[:NOT_WITH]->(pea), 
  (yardlongBean)-[:NOT_WITH]->(garlic), 
  (yardlongBean)-[:NOT_WITH]->(springOnion),
  (yardlongBean)-[:NOT_WITH]->(leek),
  (yardlongBean)-[:NOT_WITH]->(basil),
  (yardlongBean)-[:NOT_WITH]->(kohlrabi),
  (chineseCabbage)-[:NOT_WITH]->(celery),
  (chineseCabbage)-[:NOT_WITH]->(tomato),
  (chineseCabbage)-[:NOT_WITH]->(bellPepper),
  (pakChoi)-[:NOT_WITH]->(celery),
  (pakChoi)-[:NOT_WITH]->(tomato),
  (pakChoi)-[:NOT_WITH]->(bellPepper),
  (kale)-[:NOT_WITH]->(celery),
  (kale)-[:NOT_WITH]->(tomato),
  (kale)-[:NOT_WITH]->(bellPepper),
  (redRadish)-[:NOT_WITH]->(tomato),
  (chiliPepper)-[:NOT_WITH]->(yardlongBean),
  (chiliPepper)-[:NOT_WITH]->(tomato),
  (chiliPepper)-[:NOT_WITH]->(potato),
  (chiliPepper)-[:NOT_WITH]->(bellPepper),
  (bellPepper)-[:NOT_WITH]->(yardlongBean),
  (bellPepper)-[:NOT_WITH]->(edamame),  
  (lettuce)-[:NOT_WITH]->(celery),
  (lettuce)-[:NOT_WITH]->(springOnion),
  (corn)-[:NOT_WITH]->(chineseCabbage),
  (corn)-[:NOT_WITH]->(kale),
  (corn)-[:NOT_WITH]->(tomato),
  (corn)-[:NOT_WITH]->(celery),
  (garlic)-[:NOT_WITH]->(leek),
  (springOnion)-[:NOT_WITH]->(leek),
  (springOnion)-[:NOT_WITH]->(celery),  
  (melon)-[:NOT_WITH]->(yardlongBean), 
  (watermelon)-[:NOT_WITH]->(yardlongBean), 
  (strawberry)-[:NOT_WITH]->(chineseCabbage),
  (strawberry)-[:NOT_WITH]->(kale),
  (strawberry)-[:NOT_WITH]->(potato),
// WITH
  (tomato)-[:WITH]->(garlic),
  (tomato)-[:WITH]->(basil),
  (tomato)-[:WITH]->(springOnion),
  (tomato)-[:WITH]->(celery),
  (tomato)-[:WITH]->(chineseCabbage),
  (tomato)-[:WITH]->(pakChoi),
  (tomato)-[:WITH]->(strawberry),
  (eggPlant)-[:WITH]->(kale),
  (eggPlant)-[:WITH]->(chineseCabbage),
  (eggPlant)-[:WITH]->(greenRadish),
  (eggPlant)-[:WITH]->(redRadish),
  (eggPlant)-[:WITH]->(garlic),
  (eggPlant)-[:WITH]->(springOnion),
  (eggPlant)-[:WITH]->(celery),
  (potato)-[:WITH]->(coriander),
  (potato)-[:WITH]->(celery),
  (potato)-[:WITH]->(mint),
  (chiliPepper)-[:WITH]->(chineseCabbage),
  (chiliPepper)-[:WITH]->(pakChoi),
  (chiliPepper)-[:WITH]->(corn),
  (bellPepper)-[:WITH]->(garlic),
  (bellPepper)-[:WITH]->(springOnion),
  (bellPepper)-[:WITH]->(tomato),
  (bellPepper)-[:WITH]->(lettuce),
  (bellPepper)-[:WITH]->(mint),
  (garlic)-[:WITH]->(chineseCabbage),
  (garlic)-[:WITH]->(pakChoi),
  (garlic)-[:WITH]->(strawberry),
  (garlic)-[:WITH]->(tomato),
  (garlic)-[:WITH]->(cucumber),
  (garlic)-[:WITH]->(okra),
  (garlic)-[:WITH]->(potato),
  (springOnion)-[:WITH]->(chineseCabbage),
  (springOnion)-[:WITH]->(melon),
  (springOnion)-[:WITH]->(watermelon),
  (springOnion)-[:WITH]->(redRadish),
  (springOnion)-[:WITH]->(greenRadish),
  (springOnion)-[:WITH]->(cucumber),
  (springOnion)-[:WITH]->(okra),
  (springOnion)-[:WITH]->(zucchini),
  (pakChoi)-[:WITH]->(melon),
  (pakChoi)-[:WITH]->(cucumber),
  (pakChoi)-[:WITH]->(edamame),
  (pakChoi)-[:WITH]->(potato),
  (chineseCabbage)-[:WITH]->(potato),
  (greenRadish)-[:WITH]->(sweetPotato),
  (redRadish)-[:WITH]->(basil),
  (redRadish)-[:WITH]->(mint),
  (redRadish)-[:WITH]->(zucchini),
  (kale)-[:WITH]->(potato),
  (kale)-[:WITH]->(greenRadish),
  (tatsoi)-[:WITH]->(melon),
  (tatsoi)-[:WITH]->(cucumber),
  (tatsoi)-[:WITH]->(edamame),
  (yardlongBean)-[:WITH]->(potato),
  (yardlongBean)-[:WITH]->(cucumber),
  (yardlongBean)-[:WITH]->(eggPlant),
  (yardlongBean)-[:WITH]->(corn),
  (yardlongBean)-[:WITH]->(strawberry),
  (yardlongBean)-[:WITH]->(redRadish),
  (yardlongBean)-[:WITH]->(greenRadish),
  (edamame)-[:WITH]->(eggPlant),
  (edamame)-[:WITH]->(cucumber),
  (edamame)-[:WITH]->(potato),
  (edamame)-[:WITH]->(sweetPotato),
  (edamame)-[:WITH]->(corn),
  (edamame)-[:WITH]->(strawberry),
  (edamame)-[:WITH]->(chineseCabbage),
  (edamame)-[:WITH]->(redRadish),
  (edamame)-[:WITH]->(greenRadish),
  (edamame)-[:WITH]->(bellPepper),
  (edamame)-[:WITH]->(mint),
  (pea)-[:WITH]->(cucumber),
  (pea)-[:WITH]->(corn),
  (pea)-[:WITH]->(bellPepper),
  (pea)-[:WITH]->(coriander),
  (pea)-[:WITH]->(eggPlant),
  (pea)-[:WITH]->(redRadish),
  (pea)-[:WITH]->(greenRadish),
  (pea)-[:WITH]->(okra),
  (pea)-[:WITH]->(potato),
  (pea)-[:WITH]->(strawberry),
  (lettuce)-[:WITH]->(redRadish),
  (lettuce)-[:WITH]->(greenRadish),
  (lettuce)-[:WITH]->(cucumber),
  (lettuce)-[:WITH]->(yardlongBean),
  (corn)-[:WITH]->(pumpkin),
  (corn)-[:WITH]->(cucumber),
  (corn)-[:WITH]->(potato),
  (corn)-[:WITH]->(watermelon),
  (corn)-[:WITH]->(zucchini),
  (pumpkin)-[:WITH]->(springOnion),
  (pumpkin)-[:WITH]->(eggPlant),
  (shiso)-[:WITH]->(sweetPotato),
  (blueberry)-[:WITH]->(mint)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
