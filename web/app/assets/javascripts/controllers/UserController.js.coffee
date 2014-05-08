app = angular.module("i64885App")
app.controller "UserController", ($scope,$routeParams,$location,$rootScope,User) ->
  $scope.init = ->
    $rootScope.user.sessionCheck()
