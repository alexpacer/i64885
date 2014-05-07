# app = angular.module('i64885App')

# app.factory 'User', ($resource, $http, $location, $rootScope, Session) ->
#   class User
#     constructor: (errHandler) ->
#       # -- Alex Commented off before session api becomes ready
#       # $rootScope.currentUser = @sessionCheck()
#     currentUser: ->
#       return $rootScope.currentUser
#     login: (attrs, successCallback, errorCallback) ->
#       $http(
#         url: attrs.url
#         method: "POST"
#         headers: {"Content-Type": "application/json"}
#         data: attrs.data
#       ).success (data, status, headers, config) ->
#         if data.status == "success"
#           $rootScope.currentUser = data.user
#           successCallback(data)
#         else
#           $rootScope.currentUser = null
#           $rootScope.flash.error = data.message
#           $location.path "/login"
#       .error (data, status) ->
#         console.log "RPC failed"
#         console.log data
#         if errorCallback
#           errorCallback(data, status)
#     logined: ->
#       return (@currentUser() != null && @currentUser() != undefined)
#     ###
#     Performs a session check, use this to validate if user's logged on to site
#     ###
#     sessionCheck: ()->
#       return if($rootScope.currentUser == null || $rootScope.currentUser == undefined)
#         return Session.get 'user', (sessData) ->
#           if(sessData == null)
#             $rootScope.currentUser = null
#             $location.path "/login"
#             return null
#           else
#             return sessData
#       else
#         return $rootScope.currentUser

# #
# # Register User object when application starts.
# #
# app.run ($rootScope, User) ->
#   $rootScope.user = new User()