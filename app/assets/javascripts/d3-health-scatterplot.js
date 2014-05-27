$(document).ready(function(){

if($("#overall_percentage").length){

$(function(){
  global_percent_data = $.parseJSON($("#health_percentages").text()).global_percent_data;
  specific_percent_data = $.parseJSON($("#health_percentages_by_location").text()).by_location;
  locations = $.parseJSON($("#storages").text()).location;
  overall_percentage = $.parseJSON($("#overall_percentage").text()).location_total;

  global_percent_data = $.parseJSON($("#health_percentages").text()).global;

  console.log(global_percent_data)
  console.log(specific_percent_data)
  console.log(locations)
  console.log(overall_percentage)
})

}
});
