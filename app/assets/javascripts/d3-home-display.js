$(document).ready(function(){
  dataset = $.parseJSON($("#health_percentages").text()).dataset;
  console.log(dataset)
  labels = ["expired", "not expired", "uninspired"]
  // Ring chart attempt

  var w = 300;
  var h = 250;

  var health_chart_svg = d3.select("#health-chart").append("svg");
  health_chart_svg.attr("width", w).attr("height", h);

  var cScale = d3.scale.linear().domain([0, 100]).range([0, 2 * Math.PI]);

  // vis = d3.select("#health-chart").append("svg");
  var arc = d3.svg.arc()
      .innerRadius(40)
      .outerRadius(100)
      .startAngle(function(d){return cScale(d[0]);})
      .endAngle(function(d){return cScale(d[1]);});

  health_chart_svg.selectAll("path")
      .data(dataset)
      .enter()
      .append("path")
      .attr("d", arc)
      .style("fill", function(d){return d[2];})
      .attr("transform", "translate(150, 125)");

  var outer_arc = d3.svg.arc()
      .innerRadius(100)
      .outerRadius(101)
      .startAngle(cScale(0))
      .endAngle(cScale(100));

  health_chart_svg.append("path")
      .attr("d", outer_arc)
      .attr("transform", "translate(150, 125)");

  var inner_arc = d3.svg.arc()
      .innerRadius(39)
      .outerRadius(40)
      .startAngle(cScale(0))
      .endAngle(cScale(100))

  health_chart_svg.append("path")
      .attr("d", inner_arc)
      .attr("transform", "translate(150, 125)");

  var center_fill = d3.svg.arc()
      .innerRadius(0)
      .outerRadius(39)
      .startAngle(cScale(0))
      .endAngle(cScale(100))

  health_chart_svg.append("path")
      .attr("d", center_fill)
      .attr("transform", "translate(150, 125)")
      .attr("fill", "steelblue");

  d3.select("#health-chart")
      .append("text")
      .attr("transform", "translate(-75, 75)")
      .style("font-family", "sans-serif")
      .attr("fill", "red")
      .text(labels[0]);

    // If you want an amazingly kick ass bar chart, look here
    // ======================================================
    // var w = 300;
    // var h = 250;
    // var health_chart_svg = d3.select("#health-chart").append("svg");
    // health_chart_svg.attr("width", w).attr("height", h);

    // health_chart_svg.selectAll("rect")
    //                 .data(dataset)
    //                 .enter()
    //                 .append("rect")
    //                 .attr("x", function(d, i){
    //                   return (i * 100) + 5;
    //                 })
    //                 .attr("y", function(d){
    //                   return h - ((d * 3) - 3);
    //                 })
    //                 .attr("width", 90)
    //                 .attr("height", function(d){
    //                   return d * 3;
    //                 })
    //                 .attr("fill", function(d ,i){
    //                   return bar_colors[i];
    //                 })
    //                 .attr("stroke", "black")
    //                 .attr("stroke-width", 2)

    // health_chart_svg.selectAll("text")
    //                 .data(dataset)
    //                 .enter()
    //                 .append("text")
    //                 .text(function(d) {
    //                   return d + "%";
    //                 })
    //                 .attr("x", function(d, i) {
    //                   return (i * 100) + 25;
    //                 })
    //                 .attr("y", function(d) {
    //                   return h - (d * 3);
    //                 });
    //
    //======================================================


});

