'use strict';
var searchApp = angular.module('searchApp', []);

angular.module('searchApp', ['ngResource'])
  .config(function ($routeProvider) {
  	$routeProvider
  	  .when('/', {
  	  	templateUrl: 'partials/main.html',
  	  	controller: 'ItemListController'
  	  })
  	  .otherwise({
  	  	redirectTo: '/'
  	  });
  });

// angular.module('searchApp', [])
//   .controller('ItemListController', function ($scope) {
// 	$scope.items = [
//     {'name': 'Nexus S',
//      'snippet': 'Fast just got faster with Nexus S.'},
//     {'name': 'Motorola XOOM™ with Wi-Fi',
//      'snippet': 'The Next, Next Generation tablet.'},
//     {'name': 'MOTOROLA XOOM™',
//      'snippet': 'The Next, Next Generation tablet.'}
//   ];
// });

// Declare app level module which depends on filters, and services



// angular.module('myApp', [
//   'ngRoute',
//   'myApp.filters',
//   'myApp.services',
//   'myApp.directives',
//   'myApp.controllers'
// ]).
// config(['$routeProvider', function($routeProvider) {
//   $routeProvider.when('/view1', {templateUrl: 'partials/partial1.html', controller: 'MyCtrl1'});
//   $routeProvider.when('/view2', {templateUrl: 'partials/partial2.html', controller: 'MyCtrl2'});
//   $routeProvider.otherwise({redirectTo: '/view1'});
// }]);
