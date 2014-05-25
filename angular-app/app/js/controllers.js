'use strict';

/* Controllers */
var searchApp = angular.module('searchApp', ['ngResource']);

searchApp.factory("Item", function($resource) {
  return $resource("/api"); // it should come packaged with RESTful routes, right?
})

searchApp.controller('ItemListController', ['$scope', function($scope, Item) {
  $scope.items = Item.query();
}])
