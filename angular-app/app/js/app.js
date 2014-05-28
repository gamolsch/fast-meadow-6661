'use strict';
var searchApp = angular.module('searchApp', []);

angular.module('searchApp', ['ngResource'])
  .config(['$routeProvider', function ($routeProvider) {
  	$routeProvider
  	  .when('/', {
  	  	templateUrl: 'partials/main.html',
  	  	controller: 'ItemListController'
  	  })
  	  .otherwise({
  	  	redirectTo: '/'
  	  });
  }]);
