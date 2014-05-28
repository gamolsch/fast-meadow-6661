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
    console.log("Running requery...");
    $scope.items = Item.query({expired: $scope.expired});
  };

  $scope.colorAssign = function() {
    console.log("BEGIN color assign...")

    // AFTER query, run this function:
    window.setInterval( function() {
      $.each($('li'), function(index, listedItem) {
        console.log("SET given color...")
        var givenColor = $(listedItem).data('color')
        $(listedItem).css('background-color', givenColor)
      });
    }, 100);
    // END

    console.log("END color assign")
  };

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
