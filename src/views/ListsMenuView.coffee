require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
$ 				= Backbone.$
Q = require 'q'

class TracksMenuView extends Backbone.View

  template: require '../templates/listsmenu.tpl'

  className: "items"

  events:
    "click .item": "reportvalue"

  initialize: ->
    # @model.on 'all', @talk(), @

  constructor: ->
    super
    console.log "TracksMenuView created.", @
    @listenTo @model, 'add', (evt) -> @render()

  talk: ->
    console.log "collection has changed!"
    # debugger;
    @render()

  reportvalue: (evt) ->
    console.log "item selected"
    @trigger 'itemselected', evt
    # @$el.addClass 'stubify'

  render: ->
    console.log "rendering with", @model
    @$el.html @template model: @model


module.exports = TracksMenuView
