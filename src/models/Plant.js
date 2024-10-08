const _ = require('lodash');

function Plant(_node) {
  _.extend(this, _node.properties);

  if (this.id) {
    this.id = this.id.toNumber();
  }

  // Convert any Neo4j Integer properties to JavaScript numbers
  ['height'].forEach(prop => {
    if (this[prop]) {
      this[prop] = this[prop].toNumber();
    }
  });

  // Initialize default values
  this.rotationWeight = this.rotationWeight ? this.rotationWeight.toNumber() : 1.0;
}

module.exports = Plant;
