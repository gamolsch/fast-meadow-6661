  // ========================================================
  // Highcharts code goes here
$(function () {
  // Highcharts.theme = {colors: ["red"]}
  // Highcharts.getOptions().colors = Highcharts.map(colors, function(color) {
        // return {
        //     radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
        //     stops: [
        //         [0, color],
        //         [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
        //     ]
        // };
    // });
  Highcharts.setOptions({
    colors: ['red', 'yellow', 'green']
  });
  $('#health-chart').highcharts({
    chart: {
        type: 'pie'
    },
    title: {
        text: 'Global Reagent Health'
    },
    plotOptions: {
        pie: {
            shadow: true
        }
    },
    series: [{
        name: 'Browsers',
        data: [["Expired", dataset[0][1]],["Expiring In < Two Weeks",dataset[1][1]],["Not Pending Expired",dataset[2][1]]],
        // data: dataset,
        size: '90%',
        innerSize: '40%',
        showInLegend:true
    }]
  });
});
