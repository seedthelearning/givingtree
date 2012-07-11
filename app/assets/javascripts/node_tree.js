var radius = 960 / 2;

var tree = d3.layout.tree()
    .size([180, radius])
    .separation(function(a, b) { return (a.parent == b.parent ? 1 : 2) / a.depth; });

var diagonal = d3.svg.diagonal.radial()
    .projection(function(d) { return [d.y, d.x / 180 * Math.PI]; });

var vis = d3.select("#chart").append("svg")
    .attr("width", radius * 2)
    .attr("height", radius * 3 - 150)
  .append("g")
    .attr("transform", "translate(" + radius + "," + radius + ")");

d3.json('/api/tree.json', function(json) {
  var nodes = tree.nodes(json);

  var link = vis.selectAll("path.link")
      .data(tree.links(nodes))
    .enter().append("path")
      .attr("class", "link")
      .attr("d", diagonal);

  var node = vis.selectAll("g.node")
      .data(nodes)
    .enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "rotate(" + (d.x - 90) + ")translate(" + d.y + ")"; })

  node.append("circle")
      .attr("r", 3);
});
