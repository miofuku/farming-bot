const api = require('./neo4jAPI');

$(function () {
  renderGraph();
  loadPlantFamilies();

  $("#family-select").change(e => {
    const family = $(e.target).val();
    if (family) {
      showPlantFamily(family);
    }
  });
});

function showPlantFamily(family) {
  api
    .getPlantRotation(family)
    .then(rotation => {
      if (!rotation) return;

      $("#family-name").text(rotation.familyName);
      const $list = $("#rotation-list").empty();
      rotation.rotations.forEach(rot => {
        $list.append($("<li>" + rot.name + " (weight: " + rot.weight + ")</li>"));
      });
    });

  api
    .getPlantsInFamily(family)
    .then(plants => {
      const $table = $("#plants-table tbody").empty();
      plants.forEach(plant => {
        $('<tr>')
          .append($('<td>').text(plant.name))
          .append($('<td>').text(plant.binomial_name))
          .append($('<td>').text(plant.height))
          .appendTo($table);
      });
    });
}

function loadPlantFamilies() {
  api
    .getPlantFamilies()
    .then(families => {
      const $select = $("#family-select").empty();
      $select.append($('<option value="">Select a plant family</option>'));
      families.forEach(family => {
        $select.append($('<option>').text(family).val(family));
      });
    });
}

function renderGraph() {
  const width = 800, height = 800;
  const force = d3.layout.force()
    .charge(-200).linkDistance(30).size([width, height]);

  const svg = d3.select("#graph").append("svg")
    .attr("width", "100%").attr("height", "100%")
    .attr("pointer-events", "all");

  api
    .getPlantGraph()
    .then(graph => {
      force.nodes(graph.nodes).links(graph.links).start();

      const link = svg.selectAll(".link")
        .data(graph.links).enter()
        .append("line").attr("class", "link");

      const node = svg.selectAll(".node")
        .data(graph.nodes).enter()
        .append("circle")
        .attr("class", d => {
          return "node " + d.label
        })
        .attr("r", 10)
        .call(force.drag);

      node.append("title")
        .text(d => {
          return d.title;
        });

      force.on("tick", () => {
        link.attr("x1", d => {
          return d.source.x;
        }).attr("y1", d => {
          return d.source.y;
        }).attr("x2", d => {
          return d.target.x;
        }).attr("y2", d => {
          return d.target.y;
        });

        node.attr("cx", d => {
          return d.x;
        }).attr("cy", d => {
          return d.y;
        });
      });
    });
}