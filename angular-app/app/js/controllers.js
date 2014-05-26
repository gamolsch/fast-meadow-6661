'use strict';

/* Controllers */

angular.module('searchApp')
.factory('Item', function ($resource) {
	return $resource('/api/items/:itemID');
});

angular.module('searchApp')
.controller('ItemListController', function ($scope, Item) {

	$scope.items = Item.query();
	// TODO: fix default order
	// $scope.orderProp = 'manufacturer';
});

angular.module('searchApp')
  .controller('ItemStagingController', function ($scope, Item) {

    $scope.items = [];

    $scope.create = function(manufacturer, name, lot_number, manufactured_on, expired_on) {
        $scope.items.push( {manufacturer: manufacturer, name: name, lot_number: lot_number, manufactured_on: manufactured_on, expired_on: expired_on} );
    };
  });
