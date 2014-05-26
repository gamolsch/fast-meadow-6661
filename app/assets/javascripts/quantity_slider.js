$(document).ready(function(){
  if($("#slider").length){
    var maxInventory = $("#current-amount").text();
    $("#slider").slider({
      min: 0,
      max: maxInventory,
      values: [0],
      slide: function(event, ui){
        $("#ammount_changed").val( maxInventory - ui.values[ 0 ])
      }
    });

    $("#ammount_changed").on('input', function () {
      var value = this.value;
      console.log(maxInventory)
      // console.log(value)
      if(value > parseInt(maxInventory)){
        $("#submit_change").prop("disabled", true)
        $("#ammount_changed").css("background-color", "red");
        $("#slider").slider({values: [0]})
      }else{
        $("#ammount_changed").css("background-color", "white");
        $("#submit_change").prop("disabled", false)
        $("#slider").slider({values: [maxInventory - value]});
      }
    });
  }

});
