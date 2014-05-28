// $(document).ready(function(){

// if($("#health-chart").length){

// $(function(){

//   var itemData = $.parseJSON($("#item_values").text()).values;
//             w = 810
//             h = 410
//             circRadius = 5
//             var xScale = d3.scale.linear()
//                 .domain([0, d3.max(itemData, function(d){ return d[1] })])
//                 .range([0, w]);

//             var yScale = d3.scale.linear()
//                 .domain([0, d3.max(itemData, function(d){ return d[0] })])
//                 .range([0, w]);

//             var svg = d3.select("#health-chart")
//                 .append("svg")
//                 .attr("width", w)
//                 .attr("height", h)
//                 .style("background-color", "white")
//                 .call(d3.behavior.zoom().scaleExtent([1, 8]).on("zoom", zoom))
//                 .append("g");

//             svg.selectAll("circle")
//                 .data(itemData)
//                 .enter()
//                 .append("circle")
//                 .attr("cx", function(d) {
//                             return d[1] + 10;
//                        })
//                 .attr("cy", function(d) {
//                      return (1 - d[0]) * 400;
//                 })
//                 .attr("r", circRadius)
//                 .attr("fill", function(d){
//                   var time_concern = Math.floor((d[1] / 1000) * 255)
//                   var remaining_concern = Math.floor(d[0] * 255)
//                   color_shift = time_concern + remaining_concern
//                   shift_down = 255 - color_shift
//                   return "rgb(" + shift_down + "," + color_shift  + ", 0)"
//                 })
//                 .attr("id", function(d){
//                  return d[2].toString()})
//                  .attr("class", "sample");  // Adds id, won't be necessary in final implementation, will get value for id from the JSON and will id each element uniquely

//             var rectangles = [[10, 0, 2, 400], [10, 400, 800, 2]]  // Variables for drawing x and y axis

//             for(var i = 1; i < 10; i++){   // Adds variables for drawing y axis hashes
//                 rectangles.push([11, (i * 40), 4, 1])
//             }

//             for(var i = 1; i < 26; i++){   // Adds variables for drawing x axis hashes
//               if(i % 6 === 0){
//                 var hash_height = 8;
//               }else{
//                 var hash_height = 4;
//               }
//                 rectangles.push([(i * 31) + 10, 400 - hash_height, 1, hash_height])
//             }

//             svg.selectAll("rect")
//                 .data(rectangles)
//                 .enter()
//                 .append("rect")
//                 .attr("x", function(d, i){
//                     return d[0]
//                 })
//                 .attr("y", function(d, i){
//                     return d[1]
//                 })
//                 .attr("width", function(d, i){
//                     return d[2]
//                 })
//                 .attr("height", function(d, i){
//                     return d[3]
//                 });

//             function zoom() {
//               svg.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")")
//             }

//             $(document).ready(function(){
//                 $(".sample").on("click", function(){
//                     $("#item_info").toggle();
//                     $.post("/items/ajaxget",
//                     {id: $(this).attr("id")},
//                     function(data){
//                         console.log(data)
//                         $("#manufacturer").text(data.manufacturer)
//                         $("#item_name").text(data.name)
//                         $("#lot_no").text(data.lot_number)
//                         $("#man_date").text(data.manufactured_on)
//                         $("#exp_date").text(data.expired_on)
//                         for(var i = 0; i < data.trans_info.length; i++){
//                             $("#recent_transactions").append("<p>" + data.trans_info[i][0] + " | " + data.trans_info[i][1] + " " + data.trans_info[i][2] + " " + data.trans_info[i][3] + " " + data.trans_info[i][4]  + " to " + data.trans_info[i][5] + "</p>")
//                         }


//                         // console.log(parsedData)
//                     })
//                 });
//             });

// })

// }
// });
