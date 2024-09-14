require('file-loader?name=[name].[ext]!../node_modules/neo4j-driver/lib/browser/neo4j-web.min.js');
const Plant = require('./models/Plant');
const PlantRotation = require('./models/PlantRotation');
const _ = require('lodash');

const neo4j = window.neo4j;
const neo4jUri = process.env.NEO4J_URI;
let neo4jVersion = process.env.NEO4J_VERSION;
if (neo4jVersion === '') {
  neo4jVersion = '4';
}
let database = process.env.NEO4J_DATABASE;
if (!neo4jVersion.startsWith("4")) {
  database = null;
}
const driver = neo4j.driver(
    neo4jUri,
    neo4j.auth.basic(process.env.NEO4J_USER, process.env.NEO4J_PASSWORD),
);

console.log(`Database running at ${neo4jUri}`)

function getPlantFamilies() {
  const session = driver.session({database: database});
  return session.readTransaction((tx) =>
      tx.run('MATCH (f:Family) RETURN f.name AS family ORDER BY family')
    )
    .then(result => {
      return result.records.map(record => record.get('family'));
    })
    .catch(error => {
      throw error;
    })
    .finally(() => {
      return session.close();
    });
}

function getPlantRotation(family) {
  const session = driver.session({database: database});
  return session.readTransaction((tx) =>
      tx.run('MATCH (f1:Family {name: $family})-[r:ROTATE_AFTER]->(f2:Family) \
              RETURN f2.name AS rotateAfter, r.weight AS weight \
              ORDER BY weight DESC', {family})
    )
    .then(result => {
      return new PlantRotation(family, result.records.map(record => ({
        name: record.get('rotateAfter'),
        weight: record.get('weight')
      })));
    })
    .catch(error => {
      throw error;
    })
    .finally(() => {
      return session.close();
    });
}

function getPlantsInFamily(family) {
  const session = driver.session({database: database});
  return session.readTransaction((tx) =>
      tx.run('MATCH (f:Family {name: $family})<-[:BELONGS_TO]-(:Genus)<-[:BELONGS_TO]-(p:Plant) \
              RETURN p', {family})
    )
    .then(result => {
      return result.records.map(record => new Plant(record.get('p')));
    })
    .catch(error => {
      throw error;
    })
    .finally(() => {
      return session.close();
    });
}

function getPlantGraph() {
  const session = driver.session({database: database});
  return session.readTransaction((tx) =>
    tx.run('MATCH (f:Family)<-[:BELONGS_TO]-(g:Genus)<-[:BELONGS_TO]-(p:Plant) \
            RETURN f.name AS family, collect(p.name) AS plants \
            LIMIT $limit', {limit: neo4j.int(100)}))
    .then(results => {
      const nodes = [], rels = [];
      let i = 0;
      results.records.forEach(res => {
        nodes.push({title: res.get('family'), label: 'family'});
        const target = i;
        i++;

        res.get('plants').forEach(name => {
          const plant = {title: name, label: 'plant'};
          let source = _.findIndex(nodes, plant);
          if (source === -1) {
            nodes.push(plant);
            source = i;
            i++;
          }
          rels.push({source, target})
        })
      });

      return {nodes, links: rels};
    })
    .catch(error => {
      throw error;
    })
    .finally(() => {
      return session.close();
    });
}

exports.getPlantFamilies = getPlantFamilies;
exports.getPlantRotation = getPlantRotation;
exports.getPlantsInFamily = getPlantsInFamily;
exports.getPlantGraph = getPlantGraph;