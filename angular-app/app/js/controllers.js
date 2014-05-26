'use strict';

/* Controllers */

angular.module('searchApp')
.factory('Item', ['$resource', function ($resource) {
	return $resource('/api/items/:itemID');
}]);

angular.module('searchApp')
.controller('ItemListController', ['$scope', 'Item', function ($scope, Item) {

	$scope.items = Item.query();
	// TODO: fix default order
	// $scope.orderProp = 'manufacturer';
}]);
