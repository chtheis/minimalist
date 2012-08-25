class listApp.Models.List extends Backbone.Model
  urlRoot: listApp.apiUrl ''
  idAttribute: 'slug'

  initialize: ->
    listApp.log 'init list'
    @items ||= new listApp.Collections.Items()
    @items.list_id = @id
    @items.fetch()

    @on 'change:slug', @updateParams

  updateParams: =>
    @items.list_id = @id



window.demoItems = [
  {
    "completed":false,
    "created_at":"2012-07-20T05:07:54Z",
    "description":"Enter items & check them off",
    "id":1,
    "sort_order":null,
    "updated_at":"2012-07-26T02:55:40Z"
  },
  {
    "completed":false,
    "created_at":"2012-07-21T05:07:53Z",
    "description":"Swipe right to check off on mobile (left to undo)",
    "id":2,
    "sort_order":null,
    "updated_at":"2012-07-26T02:55:40Z"
  },  
  {
    "completed":false,
    "created_at":"2012-07-22T05:07:53Z",
    "description":"Double-click (or Double-tap) to edit",
    "id":3,
    "sort_order":null,
    "updated_at":"2012-07-26T02:55:40Z"
  },
  {
    "completed":false,
    "created_at":"2012-07-23T02:47:14Z",
    "description":"Click the trashcan or clear items to delete them",
    "id":4,
    "sort_order":null,
    "updated_at":"2012-07-26T02:55:38Z"
  }
]


class listApp.Models.DemoList extends Backbone.Model
  url: '/demo.json'
  idAttribute: 'slug'

  initialize: ->
    listApp.log 'init demo'

    @items ||= new listApp.Collections.DemoItems(window.demoItems)
