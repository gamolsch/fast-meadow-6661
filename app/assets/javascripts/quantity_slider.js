$(document).ready(function(){
  if($("#slider").length){
    var maxInventory = $("#current-amount").text();
    $("#slider").slider({
      range: true,
      min: 0,
      max: maxInventory,
      values: [0, maxInventory],
      slide: function(event, ui){
        $("#ammount_changed").val( maxInventory - ui.values[ 0 ])
      }
    });
  }
});
