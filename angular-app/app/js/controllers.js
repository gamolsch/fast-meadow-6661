'use strict';

/* Controllers */

angular.module('searchApp')
.factory('Item', ['$resource', function ($resource) {
	return $resource('/api/items/:itemID');
}]);

angular.module('searchApp')
.controller('ItemListController', ['$scope', 'Item', function ($scope, Item) {

  $scope.expired = true
  $scope.items = Item.query({expired: $scope.expired});
  $scope.removedItems = [];

  $scope.change = function() {
    console.log($scope.expired)
    // if $scope.expired is true
    // do this
    // else
    // do that
    // end
  }

  $scope.create = function(name) {
    Item.save({name: name}, function(item) {
      $scope.items.push(item);
    });
  };

  $scope.remove = function(item) {
    $scope.items.splice($scope.items.indexOf(item), 1);
    $scope.removedItems.push(item);
    console.log(item);
  }

  $scope.delete = function(id, item) {
    Item.delete( {itemID: id}, function() {
      $scope.removedItems.splice($scope.removedItems.indexOf(item), 1);
    });
  };

}]);
