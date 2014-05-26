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
