'use strict';

/* Controllers */

angular.module('searchApp')
.factory('Item', ['$resource', function ($resource) {
	return $resource('/api/items/:itemID');
}]);

angular.module('searchApp')
.controller('ItemListController', ['$scope', 'Item', function ($scope, Item) {

  // Testing!
  // $scope.items = [];

  $scope.items = Item.query();
  $scope.removedItems = [];

  $scope.create = function(name) {

    // Testing!
    // $scope.items.push({name: name});

    Item.save({name: name}, function(item) {
      $scope.items.push(item);
    });
  };

  $scope.remove = function(item) {
    $scope.items.splice($scope.items.indexOf(item), 1);
    $scope.removedItems.push(item);
    console.log(item);
  }

  $scope.clearGraveyard = function() {
    console.log("Clearing Graveyard...");

    angular.forEach($scope.removedItems, function(item, index) {
      $scope.delete(item.id, item);
    });
  };

  $scope.delete = function(id, item) {

    // Testing!
    // $scope.items.splice(index, 1);
    console.log("Deleting...")


    // Not deleting visual particle correctly due to filter
    Item.delete( {itemID: id}, function() {
      $scope.removedItems.splice($scope.removedItems.indexOf(item), 1);
      console.log("Deleted!")
    });
  };

}]);
