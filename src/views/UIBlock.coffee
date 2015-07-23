_ = require 'underscore'
$ = require 'jquery'
Tracks = require '../tracks/index'

console.log "$", $

CoreView = require './CoreView'

class UIBlock extends CoreView

  template: require '../templates/uiblock.tpl'
  tagName: "div"
  className: "uiblock-container"

  events:
    "click .addblock": "addblock"
    "click .query": "runQuery"

  initialize: ->

    console.log "checking out my model", @model

    @model.on 'change:children', (evt) ->
      console.log "children changed.", @

    # # If the query in the model has changed then
    # @listenTo @model, 'change', (evt) ->
    #   console.log "model changed.", evt





  constructor: ->
    super

  runQuery: ->
    console.log "running query", @model.get('query')
    @model.get('query').count().then (res) -> console.log "count", res

  addblock: ->
    t_goterms = Tracks.get('Gene')[0]
    @model.addtrack t_goterms

  render: ->
    console.log "Rendering UIBlock", @
    @$el.html @template {model: @model}





module.exports = UIBlock
