class listApp.Models.Item extends Backbone.Model
  defaults: 
    description: "empty item..."
    completed: false

  initialize: ->
    if !@get("description")
      @set({ "description": @defaults.description })

  toggle: ->
    @save({ completed: !@get("completed") })

  clear: ->
    @view.remove()  
    @destroy()    



class listApp.Collections.Items extends Backbone.Collection
  model: listApp.Models.Item
  url: -> listApp.apiUrl "#{@list_id}/tasks"

  completed: ->
    return @filter (task) ->
      task.get "completed"

  remaining: ->
    return @without.apply( this, @completed() )



class listApp.Collections.DemoItems extends Backbone.Collection
  model: listApp.Models.Item
  localStorage: new Backbone.LocalStorage("DemoItems")

  completed: ->
    return @filter (task) ->
      task.get "completed"

  remaining: ->
    return @without.apply( this, @completed() )
