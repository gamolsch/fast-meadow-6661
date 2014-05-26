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
      console.log(value);
      $("#slider").slider({values: [maxInventory - value]});
    });
  }

});
