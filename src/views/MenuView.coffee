require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
$ 				= Backbone.$
Q = require 'q'

class MenuView extends Backbone.View

  template: require '../templates/menu.tpl'

  className: "items"

  canrender: Q.defer()


  events: {}

  initialize: ->
    # @listenTo @model, 'renderme', @rerender
    @model.on 'all', @evttalk, @
  #   @listenTo @model, 'change:views', -> alert 'Changed views.'
  #   @listenTo @model, 'change:paths', @speak

  evttalk: (evt) ->
    @canrender.resolve true
    # console.log "speak event", evt
    # @render()


  constructor: ->
    super
    console.log "MenuView created.", @

  settled: ->
    @canrender.promise



  render: ->
    @$el.html @template model: @model


module.exports = MenuView
