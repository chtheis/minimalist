$.extend listApp, 
  log: (msg) -> if console? then console.log(msg) else msg
  apiPrefix: (path) -> joinPaths(getApiPath(window.location.pathname), path)
  appUrl: (path) -> joinPaths(getRootPath(window.location.pathname), path)
  Models: {}
  Views: {}
  Collections: {}
  Routers: {}
  init: ->
    listApp.router = new listApp.Routers.List
    Backbone.history.start({pushState: true, root: "/"})
  isMobile: -> 
    return Modernizr.touch

getApiPath = (path) ->
  prefix = if path.indexOf("/minimalist/") == 0 then "/minimalist" else ""
  offset = if path.indexOf("minimalist/") == 0 then 1 else 0

  if path.indexOf(prefix + "/dashboard") == 0
    return prefix + "/api"
  else
    # returns /s/:stack_id and drops everything after
    return prefix + path.split("/").slice(0, offset + 3).join("/")

getRootPath = (path) ->
  prefix = if path.indexOf("/minimalist/") == 0 then "/minimalist" else ""
  offset = if path.indexOf("minimalist/") == 0 then 1 else 0

  parts = if path.indexOf(prefix + '/dashboard') == 0 then 2 else 3
  return prefix + path.split("/").slice(0, offset + parts).join("/")

joinPaths = (pathA, pathB) ->
  aHasDivider = pathA[pathA.length - 1] == '/'
  bHasDivider = pathB && pathB[0] == '/'
  if aHasDivider
    pathA = pathA.slice(0, pathA.length - 1)
  if bHasDivider
    pathB = pathB.slice(1, pathB.length)

  return [pathA, pathB].filter((path) -> path).join('/')

# this ensures that the browser back button doesn't render json accidentally
# because some browsers will resuse cached ajax requests
$.ajaxSetup
  cache: false
  beforeSend: (xhr) ->
    xhr.setRequestHeader("Authorization", "Token token=\"#{user.token}\", email=\"#{user.email}\"")

$(document).ready ->
  FastClick.attach(document.body)
  listApp.init()
