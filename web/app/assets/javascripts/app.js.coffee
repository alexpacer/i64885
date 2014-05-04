i64885App = angular.module('i64885App',['ngRoute','ngResource','ui.bootstrap','pascalprecht.translate'])

i64885App.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken


i64885App.config ($routeProvider) ->
  $routeProvider.when '/', redirectTo: '/user/dashboard'
  # $routeProvider.when '/user/dashboard', 
  #   templateUrl: '/templates/user/dashboard.html'
  #   controller: 'DashboardController'
  
  # $routeProvider.when '/login',
  #   templateUrl: '/templates/user/login.html'
  #   controller: 'UserController'
  #   resolve:
  #     style: ->
  #       angular.element("head").append('<link href="assets/login.css" rel="stylesheet">')
  # $routeProvider.otherwise
  #   redirectTo: '/'


# configure translations for the site, the default language is set to "en-US"
# TODO: extract this configuration to external sources such as: 
#  - https://github.com/PascalPrecht/angular-translate/wiki/Asynchronous-loading#registering-asynchronous-loaders
i64885App.config ['$translateProvider', ($translateProvider)->
  $translateProvider
    .translations 'en-US',
      'ACCOUNT_TYPES':
        'Cash': 'Cash in Hand'
        'SavingsAccount': 'Savings Account'
        'TermDepositAccount': 'Term Deposit Account'
    .translations 'zh-TW',
      'ACCOUNT_TYPES':
        'Cash': 'Cash in Hand'
        'SavingsAccount': 'Savings Account'
        'TermDepositAccount': 'Term Deposit Account'
  $translateProvider.preferredLanguage('en-US')
]

# this is to solve problem that caused by browser auto filling input fields not being able to 
# be captured by angularjs' ng-model attribute
# http://stackoverflow.com/questions/14965968/angularjs-browser-autofill-workaround-by-using-a-directive
i64885App.directive "autofillable", ["$timeout", ($timeout) ->
  require: "ngModel"
  scope: {}
  link: (scope, elem, attrs, ctrl) ->
    scope.check = ->
      val = elem[0].value
      #var isPristine = false;
      #if(ctrl.$pristine) isPristine = true;
      ctrl.$setViewValue val  if ctrl.$viewValue isnt val
      #if the form control was originally pristine, set it back to pristine
      #ctrl.$pristine = isPristine;
      $timeout scope.check, 300
    scope.check()
]

# this directive allows a form control(input) within modal box to be set to fcused when modal is activated.
# use this by setting focuse-me="true" in control
# http://stackoverflow.com/questions/14833326/how-to-set-focus-in-angularjs
i64885App.directive 'focuseMe', ["$timeout", ($timeout) ->
  scope: 
    trigger: '@focuseMe'
  link: (scope,element)->
    # console.log('scope=',scope)
    # console.log('element=',element)
    scope.$watch 'trigger', (value)->
      # console.log('value=',value)
      if(value == 'true')
        $timeout ()->
          element[0].focus()
]

# This is non-scope implementation.
# app.directive 'focuseMe', ($timeout, $parse) ->
#   link: (scope, element, attrs)->
#     model = $parse(attrs.focuseMe)
#     scope.$watch model, (value)->
#       console.log('value=', value)
#       if(value == true)
#         $timeout ()->
#           element[0].focus()
#     element.bind 'blur', ()->
#       console.log('blur')
#       scope.$apply(model.assign(scope, false))

# This directive describes account type in it's own translation
# i64885App.directive "accountType", ["$translate", ($translate) ->
#   replace: true
#   restrict: "EA"
#   scope:
#     type: "@"
#   link:
#     post: (scope, linkElement, attrs) ->
#       scope.$watch scope.type, (value) ->
#         $(linkElement).text $translate 'ACCOUNT_TYPES.' + scope.type
# ]




i64885App.factory 'Session', ($http) ->
  Session = 
    headers: {"Content-Type": "application/json"},
    url: "/api/sessions",
    data: {},
    save: ->
      $http
        url: Session.url
        method: "PUT"
        headers: Session.headers
        data: data
    delete: (key)->
      $http
        url: Session.url + "/" + key
        method: "DELETE"
        headers: Session.headers
    clear: ->
      $http
        url: Session.url
        method: "DELETE"
        headers: Session.headers
    get: (key, callback)->
      $http(
        url: Session.url + "/" + key
        method: "GET"
        headers: Session.headers
      ).success (data)->
        if data.status == 'success'
          callback(data.session)
    getall: ->
      $http(
        url: Session.url
        method: "GET"
        headers: Session.headers
      ).success (data) ->
        Session.data = data
  Session.getall()
  return Session




