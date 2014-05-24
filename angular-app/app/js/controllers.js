'use strict';

/* Controllers */

var searchApp = angular.module('searchApp', []);

searchApp.controller('ItemListController', ['$scope', function($scope) {
  $scope.items = [];
}])
