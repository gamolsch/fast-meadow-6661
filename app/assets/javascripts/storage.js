// $(document).ready(function() {

//   $(function() {
//     Highcharts.setOptions({
//       colors: ['#333', '#444', '#555']
//     });
//       $('.gatorade_chart').highcharts({
//         credits: {
//           enabled: false
//         },
//         chart: {
//           type: 'column'
//         },
//         title: {
//           text: 'Gatorade Lab (Hazardous'
//         },
//         xAxis: {
//           categories: ['Expired', 'Expiring Soon', 'Live']
//         },
//         yAxis: {
//           min: 0,
//           title: {
//             text: 'Total Expired Samples'
//           }
//         },
//         tooltip: {
//           pointFormat: '<span style="color:{series:color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
//           shared: true
//         },
//         plotOptions: {
//           column: {
//             stacking: 'percent'
//           }
//         },
//         series: [{
//           name: 'Andrew',
//           data: [5,3,4]
//         }, {
//           name: 'George',
//           data: [2,2,3]
//         }, {
//           name: 'Jonathon',
//           data: [3,4,4]
//         }]
//       });
//   });
// });
$(function () {
  // Highcharts.setOptions({
  //     colors: ['#333', '#444', '#555']
  //   });
        $('.gatorade_chart').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Total Expired Samples'
            },
            // subtitle: {
            //     text: 'Source: WorldClimate.com'
            // },
            xAxis: {
                categories: ['Expired', 'Expiring Soon', 'Live']
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rainfall (mm)'
                }
            },
            tooltip: {
                pointFormat: '<span style="color:{series:color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
                shared: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            plotOptions: {
                column: {
                    stacking: 'percent'
          }
        },
            series: [{
                name: 'Andrew',
                data: [5,3,4]
            }, {
                name: 'George',
                data: [2,2,3]
            }, {
                name: 'Jonathon',
                data: [3,4,4]
            }]
        });
    });

$(function () {
        $('.btn-success').highcharts({
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Health Levels'
            },
            // subtitle: {
            //     text: 'Source: Wikipedia.org'
            // },
            xAxis: {
                categories: ['Health Level'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    // text: 'Population (millions)',
                    // align: 'high'
                },
                labels: {
                    // overflow: 'justify'
                }
            },
            tooltip: {
                // valueSuffix: ' millions'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'Year 1800',
                data: [107]
            }]
        });
    });
