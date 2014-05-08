angular.module('i64885App').controller "HomeCtrl", ($scope,$rootScope) ->

  $scope.formData = {}
  $scope.varFromApp = ["A","List"]
  $scope.welcomeMessage = 'Welcome to the world'
  
  $scope.init = ->
    $scope.welcomeMessage += ' inited()'

