angular.module('i64885App').controller "HomeCtrl", ($scope,$rootScope) ->

  $scope.formData = {}
  $scope.varFromApp = ["A","List"]
  $scope.welcomeMessage = 'Welcome to the world'

  $scope.init = ->
    console.log '$scope.init()'
    $scope.welcomeMessage += ' inited()'


#   console.log('HomeCtrl.js.coffee')

#   $scope.formData = {}
#   $scope.varFromApp = ["A","List"]
#   $scope.welcomeMessage = 'Welcome to the world'

#   $scope.init = ->
#     console.log '$scope.init()'
#     $scope.welcomeMessage += ' inited()'


# HomeCtrl = ($root) ->
#   console.log('HomeCtrl.js.coffee')

#   $scope.formData = {}
#   $scope.varFromApp = ["A","List"]
#   $scope.welcomeMessage = 'Welcome to the world'

#   $scope.init = ->
#     console.log '$scope.init()'
#     $scope.welcomeMessage += ' inited()'
