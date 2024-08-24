const _ = require('lodash');

function PlantRotation(familyName, rotations) {
  _.extend(this, {
    familyName: familyName,
    rotations: rotations.map(function (r) {
      return {
        name: r.name,
        weight: r.weight.toNumber()
      }
    })
  });
}

module.exports = PlantRotation;