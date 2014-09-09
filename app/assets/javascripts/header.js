orderClub.controller('HeaderCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.popped = false;
  $scope.pop = function() {
    console.log(11111);
  }
  $scope.classIf = function(k,c){if(c){return k}else{return ''}};
}]);
