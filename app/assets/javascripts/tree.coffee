# Update…

p = (x) -> console.log(x)
pt = -> console.log(this)

# Generates an entire tree
genData = (maxDepth) ->
  maxSiblings = 4

  genDataRec = (currDepth) ->
    siblings = Math.random() * maxSiblings

    'depth': currDepth
    'text': "depth = #{currDepth}"
    'children': if currDepth <= maxDepth
      for i in [0..siblings]
        genDataRec(currDepth+1)

  genDataRec(1)

# A tree iterator
createIterator = ->
  id = 0
  root = { 'children': [], 'id': id }
  nodes = [ ]
  iterator = ->
    if nodes.length is 0
      nodes.push(root)
    else
      id += 1
      idx = Math.floor(Math.random() * nodes.length)
      parent = nodes[idx]
      node = { 'children': [], 'id': id }
      parent.children.push(node)
      nodes.push(node)
    root
  iterator


# internal/external nodes
partitionNodes = (graph) ->
  external = []
  internal = []
  traverse = (graph) ->
    if graph.children?.length > 0
      internal.push(graph)
      for child in graph.children
        traverse(child)
    else
      external.push(graph)
  traverse(graph)

  'internal': internal
  'external': external


padding = 50
w = 960
rx = ry = w/2
limbLen = w/2 - padding
spreadDegrees = (2/3) * 360
#duration = 2000
duration = 250

vis = d3.select("#tree")
  .append("svg:svg")
    .style("width", w + "px")
    .style("height", w + "px")
  .append("svg:g")
    #.attr("transform", "rotate(#{-spreadDegrees/2}, #{rx}, #{ry})translate(#{rx},#{ry})")
    .attr("transform", "translate(#{rx},#{ry})")

redraw = (data)->
  cluster = d3.layout.cluster()
    .size([spreadDegrees, limbLen])
    .sort(null)

  line = d3.svg.line.radial()
    .radius((d) -> d.y)
    .angle((d) -> (d.x - spreadDegrees/2) / 180 * Math.PI)

  nodes     = cluster.nodes(data)
  leafNodes = partitionNodes(data).external

  lines = vis.selectAll("path.limb")
    .data(cluster.links(nodes), (d) -> "#{d.source.id}_#{d.target.id}")

  lines
    .transition()
    .duration(duration)
    .attr("class", "limb")
    .attr("d", (d) -> line([d.source, d.target]))

  lines.enter()
    .append("svg:path")
      .attr("class", "limb")
      .attr("d", (d) -> line([d.source, d.target]))

  leaf = vis.selectAll(".node")
    .data(leafNodes, (d) -> d.id)

  leaf.exit().remove()

  leaf.enter().append("svg:g")
    .attr("class", "node")
    .attr("transform", (d) -> "rotate(#{d.x - spreadDegrees/2})translate(0,#{-d.y - 50})")
    .append("svg:image")
      .attr("class", "leaf")
      .attr("xlink:href", "leaf.svg")
      .attr("width", "50")
      .attr("height", "50")
      .attr("x", "-25")

  leaf
    .transition()
    .duration(duration)
    .attr("transform", (d) -> "rotate(#{d.x - spreadDegrees/2})translate(0,#{-d.y - 50})")


#redraw(genData(5))
iterate = createIterator()
redraw(iterate())

p genData(3)
setInterval (-> redraw(iterate()))
          , duration
