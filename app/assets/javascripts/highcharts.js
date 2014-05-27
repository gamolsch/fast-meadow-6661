// $(document).ready(function(){
// // console.log($("#health_percentages_by_location").val())
// if ($("#overall_percentage").length){

// $(function () {
//   global_percent_data = $.parseJSON($("#health_percentages").text()).global_percent_data;
//   specific_percent_data = $.parseJSON($("#health_percentages_by_location").text()).by_location;
//   locations = $.parseJSON($("#storages").text()).location;
//   overall_percentage = $.parseJSON($("#overall_percentage").text()).location_total

//   global_percent_data = $.parseJSON($("#health_percentages").text()).global;

//   var colors = Highcharts.getOptions().colors,
//         categories = locations,
//         name = 'Global Reagent Health',
//         data = [{
//           y: overall_percentage[0],
//           color: colors[0],
//           drilldown: {
//                   name: locations[0],
//                   categories: ['Expired', 'Expiring Soon', 'Live'],
//                   data: specific_percent_data[0],
//                   color: colors[0]
//               }
//           }, {
//               y: overall_percentage[1],
//               color: colors[1],
//               drilldown: {
//                   name: locations[1],
//                   categories: ['Expired', 'Expiring Soon', 'Not Pending'],
//                   data: specific_percent_data[1],
//                   color: colors[1]
//               }
//           }, {
//               y: overall_percentage[2],
//               color: colors[2],
//               drilldown: {
//                   name: locations[2],
//                   categories: ['Expired', 'Expiring Soon', 'Not Pending'],
//                   data: specific_percent_data[2],
//                   color: colors[2]
//               }
//           }, {
//               y: overall_percentage[3],
//               color: colors[3],
//               drilldown: {
//                   name: locations[3],
//                   categories: ['Expired', 'Expiring Soon', 'Not Pending'],
//                   data: specific_percent_data[3],
//                   color: colors[3]
//               }
//                 }, {
//                     y: overall_percentage[4],
//                     color: colors[4],
//                     drilldown: {
//                         name: locations[4],
//                         categories: ['Expired', 'Expiring Soon', 'Not Pending'],
//                         data: specific_percent_data[4],
//                         color: colors[4]
//                     }
//                 }];

//     var storageData = [];
//         var versionsData = [];
//         for (var i = 0; i < data.length; i++) {

//             // add browser data
//             storageData.push({
//                 name: categories[i],
//                 y: data[i].y,
//                 color: data[i].color
//             });

//             // add version data
//             for (var j = 0; j < data[i].drilldown.data.length; j++) {
//                 var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5 ;
//                 versionsData.push({
//                     name: data[i].drilldown.categories[j],
//                     y: data[i].drilldown.data[j],
//                     color: Highcharts.Color(data[i].color).brighten(brightness).get()
//                 });
//             }
//         }


//       $('#health-chart').highcharts({
//             credits: {
//                 enabled: false
//             },

//             chart: {
//                 type: 'pie'
//             },
//             title: {
//                 text: 'Global Inventory Status'
//             },
//             plotOptions: {
//                 pie: {
//                     shadow: false,
//                     center: ['50%', '50%']
//                 }
//             },
//             tooltip: {
//               valueSuffix: '%'
//             },
//             series: [{
//                 name: 'Storages',
//                 data: storageData,
//                 size: '60%',
//                 dataLabels: {
//                   enabled: false
//                 }
//             }, {
//                 name: 'Storages',
//                 data: versionsData,
//                 size: '80%',
//                 innerSize: '60%',
//                 dataLabels: {
//                     formatter: function() {
//                         // display only if larger than 1
//                         return this.y > 1 ? '<b>'+ this.point.name +':</b> '+ this.y +'%'  : null;
//                     }
//                 }
//             }]
//         });
//     });
//   }
// })
