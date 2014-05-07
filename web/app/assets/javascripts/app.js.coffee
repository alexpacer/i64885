app = angular.module('i64885App',['ui.router','ngResource'])

app.config ($stateProvider, $urlRouterProvider) ->
  # For any unmatched url send to /home
  $urlRouterProvider.otherwise "/home"

  $stateProvider.state 'home',
    url: '/home',
    templateUrl: '/templates/home/welcome.html',
    controller: "HomeCtrl"
