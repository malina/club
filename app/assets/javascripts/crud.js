orderClub.controller('CrudCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.items = [];
  $scope.master = [];
  $scope.template = {};
  
  $scope.add = function() {  $scope.items.push(angular.copy($scope.template))  };
  $scope.delete = function(item) {  $scope.items = _.without($scope.items, item)  };  
  
  $scope.isChanged = function() {
    if ($scope.items.length == $scope.master.length){
      return !angular.equals(
        $scope.master,
        _.filter($scope.master, function(item, i){  return angular.equals(item, $scope.items[i])  })
      )
    } else { return true }
  };
  
  $scope.eqls = function(item1, item2) {  return angular.equals(item1, item2)  }
  
  $scope.save = function() {
    $http.post('', {
      authenticity_token: aToken,
      items: $scope.items
    }).success(function(data){
      $scope.show_success = true;
      $scope.master = angular.copy($scope.items)
    });
  };

}]);
