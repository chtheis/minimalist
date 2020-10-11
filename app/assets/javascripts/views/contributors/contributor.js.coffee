class listApp.Views.Contributor extends Backbone.View
  tagName: 'li'
  className: 'list-contributor'
  template: JST['contributors/contributor']

  events:
    "click .remove-contributor" : "removeContributor"

  render: ->
    prefix = if location.pathname.indexOf("/minimalist") == 0 then "/minimalist" else ""
    obj = @model
    obj.attributes.prefix = prefix
    $(@el).html(@template(obj.toJSON()))
    return this

  removeContributor: =>
    @model.destroy()
