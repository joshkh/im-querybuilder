require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
$ 				= Backbone.$
Q = require 'q'

class TracksMenuView extends Backbone.View

  template: require '../templates/tracksmenu.tpl'

  className: "items"

  events:
    "click .item": "addtrack"

  initialize: ->
    # @model.on 'all', @evttalk, @

  constructor: ->
    super
    console.log "TracksMenuView created.", @

  addtrack: (evt) ->
    console.log "trigger add track"
    @trigger 'trackselected', evt
    # @$el.addClass 'stubify'

  render: ->
    @$el.html @template model: @model


module.exports = TracksMenuView
