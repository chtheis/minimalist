class listApp.Collections.Lists extends Backbone.Collection
  model: listApp.Models.List
  url: -> listApp.apiPrefix "lists"

  comparator: "sort_order"

  selectList: (list) =>
    @selectedList = list.get('id')

  nextOrder: ->
    # use the length instead of length + 1 because of zero-based indexes
    @length
    
