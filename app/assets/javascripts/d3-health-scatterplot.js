$(document).ready(function(){

if($("#health-chart").length){

$(function(){

  var itemData = $.parseJSON($("#item_values").text()).values;
  console.log(itemData)
  var dataset = [
                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],
                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88]
              ];
            w = 810
            h = 410
            var svg = d3.select("#health-chart")
                .append("svg")
                .attr("width", w)
                .attr("height", h)
                .style("background-color", "white");

            svg.selectAll("circle")
                .data(itemData)
                .enter()
                .append("circle")
                .attr("cx", function(d) {
                            return d[1] + 10;
                       })
                .attr("cy", function(d) {
                    console.log(d[0])
                    console.log((1 - d[0]) * 400)
                     return (1 - d[0]) * 400;
                })
                .attr("r", 5)
                .attr("fill", function(d){
                  var time_concern = Math.floor((d[1] / 1000) * 255)
                  var remaining_concern = Math.floor(d[0] * 255)
                  color_shift = time_concern + remaining_concern
                  shift_down = 255 - color_shift
                  // console.log(time_concern)
                  // console.log(remaining_concern);
                  return "rgb(" + shift_down + "," + color_shift  + ", 0)"
                })
                // .attr("id", function(d){
                //  return "sampleid" + d[0].toString() + d[1].toString()})
                //  .attr("class", "sample");  // Adds id, won't be necessary in final implementation, will get value for id from the JSON and will id each element uniquely

            var rectangles = [[10, 0, 2, 400], [10, 400, 800, 2]]  // Variables for drawing x and y axis

            for(var i = 1; i < 10; i++){   // Adds variables for drawing y axis hashes
                rectangles.push([11, (i * 40), 4, 1])
            }

            for(var i = 1; i < 26; i++){   // Adds variables for drawing x axis hashes
              if(i % 6 === 0){
                var hash_height = 8;
              }else{
                var hash_height = 4;
              }
                rectangles.push([(i * 31) + 10, 400 - hash_height, 1, hash_height])
            }

            svg.selectAll("rect")
                .data(rectangles)
                .enter()
                .append("rect")
                .attr("x", function(d, i){
                    return d[0]
                })
                .attr("y", function(d, i){
                    // console.log(d, i)
                    return d[1]
                })
                .attr("width", function(d, i){
                    // console.log(d, i)
                    return d[2]
                })
                .attr("height", function(d, i){
                    return d[3]
                });

            $(document).ready(function(){
                $(".sample").on("click", function(){
                    alert("Something happened.")
                });
            });

})

}
});
