'use strict';

/* Controllers */

var searchApp = angular.module('searchApp');

searchApp
.factory('Item', ['$resource', function ($resource) {
	return $resource('/api/items/:itemID');
}]);

searchApp
.controller('ItemListController', ['$scope', 'Item', function ($scope, Item) {

  // Default Properties
  $scope.expired = true
  $scope.items = Item.query({expired: $scope.expired});

  $scope.requery = function() {
    $scope.items = Item.query({expired: $scope.expired});
  };

  $scope.updateColors = function() {
    // AFTER query, run this function:
    window.setInterval( function() {
      $.each($('.color-label'), function(index, colorLabel) {
        console.log("Please hire me! We don't understand how to implement thenable promises!")
        var givenColor = $(colorLabel).data('color')
        $(colorLabel).css('background-color', givenColor)
      });
    }, 100);
    // END
  };

  $scope.create = function(name) {
    Item.save({name: name}, function(item) {
      $scope.items.push(item);
    });
  };

  $scope.delete = function(item) {
    Item.delete( {itemID: item.id}, function() {
      var index = $scope.items.indexOf(item);
      $scope.items.splice(index, 1);
    });
  };

}]);
