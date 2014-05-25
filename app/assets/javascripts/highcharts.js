  // ========================================================
  // Highcharts code goes here
$(function () {

  global_percent_data = $.parseJSON($("#health_percentages").text()).global;

      var colors = Highcharts.getOptions().colors,
        categories = locations,
        name = 'Global Reagent Health',
        data = [{
          y: overall_percentage[0],
          color: colors[0],
          drilldown: {
                  name: locations[0],
                  categories: ['Expired', 'Expiring In Less Than Two Weeks', 'Not Pending Expired'],
                  data: specific_percent_data[0],
                  color: colors[0]
              }
          }, {
              y: overall_percentage[1],
              color: colors[1],
              drilldown: {
                  name: locations[1],
                  categories: ['Expired', 'Expiring In Less Than Two Weeks', 'Not Pending Expired'],
                  data: specific_percent_data[1],
                  color: colors[1]
              }
          }, {
              y: overall_percentage[2],
              color: locations[2],
              drilldown: {
                  name: locations[2],
                  categories: ['Expired', 'Expiring In Less Than Two Weeks', 'Not Pending Expired'],
                  data: specific_percent_data[2],
                  color: colors[2]
              }
          }, {
              y: overall_percentage[3],
              color: colors[3],
              drilldown: {
                  name: locations[3],
                  categories: ['Expired', 'Expiring In Less Than Two Weeks', 'Not Peinding Expired'],
                  data: specific_percent_data[3],
                  color: colors[3]
              }
                }, {
                    y: overall_percentage[4],
                    color: colors[4],
                    drilldown: {
                        name: locations[4],
                        categories: ['Expired', 'Expiring In Less Than Two Weeks', 'Not Peinding Expired'],
                        data: specific_percent_data[4],
                        color: colors[4]
                    }
                }];

    var storageData = [];
        var versionsData = [];
        for (var i = 0; i < data.length; i++) {

            // add browser data
            storageData.push({
                name: categories[i],
                y: data[i].y,
                color: data[i].color
            });

            // add version data
            for (var j = 0; j < data[i].drilldown.data.length; j++) {
                var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5 ;
                versionsData.push({
                    name: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    color: Highcharts.Color(data[i].color).brighten(brightness).get()
                });
            }
        }


      $('#health-chart').highcharts({
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Browser market share, April, 2011'
            },
            yAxis: {
                title: {
                    text: 'Total percent market share'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false,
                    center: ['50%', '50%']
                }
            },
            tooltip: {
              valueSuffix: '%'
            },
            series: [{
                name: 'Browsers',
                data: storageData,
                size: '60%',
                dataLabels: {
                    formatter: function() {
                        return this.y > 5 ? this.point.name : null;
                    },
                    color: 'white',
                    distance: -30
                }
            }, {
                name: 'Versions',
                data: versionsData,
                size: '80%',
                innerSize: '60%',
                dataLabels: {
                    formatter: function() {
                        // display only if larger than 1
                        return this.y > 1 ? '<b>'+ this.point.name +':</b> '+ this.y +'%'  : null;
                    }
                }
            }]
        });

















  // Highcharts.setOptions({
  //   colors: ['red', 'yellow', 'green']
  // });
  // $('#health-chart').highcharts({
  //   chart: {
  //       type: 'pie'
  //   },
  //   title: {
  //       text: 'Global Reagent Health'
  //   },
  //   plotOptions: {
  //       pie: {
  //           shadow: true
  //       }
  //   },
  //   series: [{
  //       name: 'Browsers',
  //       data: [["Expired", global_percent_data[0][1]],["Expiring In < Two Weeks",global_percent_data[1][1]],["Not Pending Expired",global_percent_data[2][1]]],
  //       // data: global_percent_data,
  //       size: '90%',
  //       innerSize: '40%',
  //       showInLegend:true
  //   }]
  // });
});
