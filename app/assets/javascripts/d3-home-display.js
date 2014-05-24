$(document).ready(function(){
//Width and height
      // var w = 300;
      // var h = 300;

      var dataset = [];
      dataset.push($("#expired_percent").text())
      dataset.push($("#almost_expired").text())
      dataset.push($("#not_pending_expired").text())
      console.log(dataset)

      // var outerRadius = w / 2;
      // var innerRadius = 0;
      // var arc = d3.svg.arc()
      //         .innerRadius(innerRadius)
      //         .outerRadius(outerRadius);

      // var pie = d3.layout.pie();

      // //Easy colors accessible via a 10-step ordinal scale
      // var color = d3.scale.category10();

      // //Create SVG element
      // var svg = d3.select("body")
      //       .append("svg")
      //       .attr("width", w)
      //       .attr("height", h);

      // //Set up groups
      // var arcs = svg.selectAll("g.arc")
      //         .data(pie(dataset))
      //         .enter()
      //         .append("g")
      //         .attr("class", "arc")
      //         .attr("transform", "translate(" + outerRadius + "," + outerRadius + ")");

      // //Draw arc paths
      // arcs.append("path")
      //     .attr("fill", function(d, i) {
      //       return color(i);
      //     })
      //     .attr("d", arc);

      // //Labels
      // arcs.append("text")
      //     .attr("transform", function(d) {
      //       return "translate(" + arc.centroid(d) + ")";
      //     })
      //     .attr("text-anchor", "middle")
      //     .text(function(d) {
      //       return d.value;
      //     });


  // d3.select("#health-chart").selectAll("div")
  //   .data(dataset)
  //   .enter()
  //   .append("div")
  //   .attr("class", "bar")
  //   .style("height", function(d) {
  //     return d + "px";
  //   });

    // If you want an amazingly kick ass bar chart, look here
    // ======================================================
    // var w = 300;
    // var h = 250;
    // var health_chart_svg = d3.select("#health-chart").append("svg");
    var bar_colors = ["red", "yellow", "green"]
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

    var w = 300;
    var h = 250;
    // radius = Math.min(w, h) / 2;

    // var color = d3.scale.category20();

    // var pie = d3.layout.pie()
    //           .sort(null);

    // var arc = d3.svg.arc()
    //           .innerRadius(radius - 100)
    //           .outerRadius(radius - 50);

    // var svg = d3.select("#health_chart")
    //           .append("svg")
    //           .attr("width", w)
    //           .attr("height", h)
    //           .attr("transform", "translate(150,120)");

    // var path = svg.selectAll("path")
    //           .data(pie(dataset))
    //           .enter()
    //           .append("path")
    //           .attr("fill", "steelblue")
    //           .attr("d", arc);

    // var health_chart_svg = d3.select("#health-chart").append("svg");
    // health_chart_svg.attr("width", w).attr("height", h)

    // var arc = d3.svg.arc()
    //              .innerRadius(50)
    //              .outerRadius(100)
    //              .startAngle(0)
    //              .endAngle(dataset[2] / 50 * Math.PI);

    // health_chart_svg.selectAll("path")
    //              .data(dataset)
    //              .enter()
    //              .append("path")
    //              .attr("d", arc)
    //              .innerRadius(50)
    //              .outerRadius(100)
    //              .startAngle(function(d, i){
    //               return dataset[i] / 50
    //              })
    //              .endAngle(function(d, i){
    //               dataset[i + 1] / 50 * Math.PI
    //              })
    //              .attr("transform", "translate( 150,120)")
    //              .attr("fill", "steelblue");

  // radius = Math.min(w, h) / 2;

// var color = d3.scale.category20();

var pie = d3.layout.pie()
    .sort(null);

var arc = d3.svg.arc()
    .innerRadius(100)
    .outerRadius(40);

var svg = d3.select("#health-chart").append("svg")
    .attr("width", w)
    .attr("height", h)
    .append("g")
    .attr("transform", "translate(150, 120)");

var path = svg.selectAll("path")
    .data(pie(dataset))
    .enter()
    .append("path")
    .attr("fill", function(d, i) { return bar_colors[i]; })
    .attr("d", arc);


    // var circles = health_chart_svg.selectAll("circle").data(dataset).enter().append("circle");
    // circles.attr("cx", function(d, i){
    //               return (i * 50) + 25;
    //               })
    //               .attr("cy", h/2)
    //               .attr("r", function(d){
    //                 return d;
    //               });

});

