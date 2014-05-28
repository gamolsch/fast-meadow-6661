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

  $scope.requery = function() {
    $scope.items = Item.query({expired: $scope.expired});
  };

  $scope.colorAssign = function() {
    $.each($('li'), function(index, listedItem) {
      var givenColor = $(listedItem).data('color')
      $(listedItem).css('background-color', givenColor)
    });
  }

  $scope.create = function(name) {
    Item.save({name: name}, function(item) {
      $scope.items.push(item);
    });
  };

  $scope.delete = function(id, item) {
    Item.delete( {itemID: id}, function() {
      $scope.items.splice($scope.items.indexOf(item), 1);
    });
  };

}]);
