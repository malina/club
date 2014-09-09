orderClub.controller('CaterersCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.caterers = [];
  $scope.cuisines = [];
  $scope.options = [];

  $scope.district = '0';
  $scope.sort = 'rating';
  $scope.set = 'open';
  
  $scope.classIf = function(k,c){if(c){return k}else{return ''}};

  $scope.selectedCuisines = function(){  return _.without($scope.cuisines, '')  };
  $scope.selectedOptions = function(){  return _.without($scope.options, '')  };
  
  $scope.cuisines_string = function(caterer){
    return _.map(caterer.cuisines, function(cuisine){  return cuisine.name  }).join(', ');
  };

  $scope.cnv = {
    toS : function(obj){
      var u=[];
      for(param in obj){
        if(obj[param] instanceof Array)
          u.push(param + "=" + encodeURI(obj[param].join(",")));
        else if(obj[param] instanceof Object)
          u.push(this.toS(obj[param]));
        else
          u.push(param + "=" + encodeURI(obj[param]));
      }
      return u.join("&amp;");
    }
  };
  
  
  
  $scope.$watch('selectedCuisines().length', function(newValue, oldValue) {  $scope.query()  });
  $scope.$watch('selectedOptions().length', function(newValue, oldValue) {  $scope.query()  });
  $scope.$watch('district', function(newValue, oldValue) {  $scope.query()  });
  $scope.$watch('sort', function(newValue, oldValue) {  $scope.query()  });
  $scope.$watch('set', function(newValue, oldValue) {  $scope.query()  });
  
  $scope.query = function(){
    var queryURL = '?' + $scope.cnv.toS({
      district: $scope.district,
      cuisines: $scope.selectedCuisines(),
      options: $scope.selectedOptions(),
      set: $scope.set,
      sort: $scope.sort
    });
    
    $http.get(queryURL).success(function(data){
      $scope.caterers = data; console.log(data)
    });
  };  


}]);
