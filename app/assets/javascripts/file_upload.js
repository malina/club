orderClub.controller('FileUploadCtrl', ['$scope', function($scope) {
  $scope.file = ''
  
  $scope.set = function(element) {
    $scope.$apply(function($scope) {  $scope.file = element.files[0].name  });
  };
  
}]);
