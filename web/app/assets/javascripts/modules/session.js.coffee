app = angular.module('i64885App')

app.factory 'Session', ($http) ->
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
  # Commented off before session api becomes ready
  #Session.getall()
  return Session

