'use strict';

/* jasmine specs for controllers go here */

describe('controllers', function(){
  beforeEach(module('searchApp'));

  it('should have a ItemListController', inject(function($controller) {
    var myItemListController = $controller('ItemListController', { $scope: {} });
    expect(myItemListController).toBeDefined();
  }));

  xit('should return an array of Items', inject(function($controller) {
    var scope = {}
    var myItemListController = $controller('ItemListController', { $scope: scope });
    // expect scope.items to return an array of Items
  }));
});
