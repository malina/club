orderClub.controller('SelectCtrl', ['$scope', function($scope) {
  $scope.opened = false;
  $scope.options = [];
  $scope.name = ''
  
  $scope.classIf = function(k,c){if(c){return k}else{return ''}};
  
  $scope.selected = function() {
    item = _.detect($scope.options, function(option){  return option.selected  })
    if (item == undefined) {  return _.first($scope.options)  } else {  return item  }
  };
  
  $scope.select = function(option) {
    $scope.selected().selected = false;
    option.selected = true;
    $scope.opened = false;
    if ($scope.name != '') {  $scope.$parent.$eval($scope.name + ' = "' + $scope.selected().id + '"')  };
  }
  
  $scope.$watch('name', function(newValue, oldValue){
    selected = _.find($scope.options, function(item){
      return item.id == $scope.$parent.$eval(newValue)
    })
    if (selected) {$scope.select(selected)}
  });
  
}]);
