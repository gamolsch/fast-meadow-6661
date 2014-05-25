'use strict';

/* Controllers */
// var searchApp =
angular.module('searchApp')
.factory('Item', function ($resource) {
	return $resource('/api/items/:itemID');
});

// NOT IN EFFECT
angular.module('searchApp')
.controller('ItemListController', function ($scope, Item) {

	// $scope.orderProp = 'name';
	$scope.items = Item.query();

	// $scope.create = function(manufacturer, name, lot_number, manufactured_on, expired_on, unit_of_measure) {
	// 	Item.save({manufacturer: manufacturer, name: name, lot_number: lot_number, manufactured_on: manufactured_on, expired_on: expired_on, unit_of_measure: unit_of_measure },
	// 		function(item) {
	// 			$scope.items.push(item);
	// 	});
	// };

	// $scope.delete = function(index) {
	// 	Item.delete({itemID: $scope.items[index].id}, function(){
	// 		$scope.items.splice(index, 1);
	// 	});
	// };
});

// searchApp.factory("Item", function($resource) {
//   return $resource("/api"); // it should come packaged with RESTful routes, right?
// })

// searchApp.controller('ItemListController', ['$scope', function($scope, Item) {
//   $scope.items = Item.query();
// }])
