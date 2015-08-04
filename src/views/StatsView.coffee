_ = require 'underscore'
$ = require 'jquery'

CoreView = require './CoreView'

class StatsView extends CoreView

  template: require '../templates/uiblock.tpl'
  tagName: "div"
  className: "uiblock-container"

  events:
    "click .addblock": "addblock"
    "click .query": "runQuery"
    "click .visible": "runVis"
    "click .talkup": "buildQuery"

  initialize: ->
    console.log "checking out my model", @model
    @model.get('selected').on 'change', @render, @

  constructor: ->
    super
    @regions = null

  woo: ->
    console.log "AHHHHH"

  buildQuery: ->
    @model.buildQuery()

  runVis: ->
    @model.addView "Gene.name"

  runQuery: ->
    q = @model.get('query')
    debugger;

    @model.get('query').count().then (res) -> console.log "count", res

  addblock: (evt) ->
    evt.stopPropagation()
    t_goterms = Tracks.get('Gene')[0]
    bm = @model.addblock query: t_goterms, root: "Protein"
    bv = new BlockView model: bm
    el = @$el

    @regions.append bv.render()

  render: ->
    # console.log "Rendering UIBlock", @
    @$el.html @template {model: @model}
    @regions = @$el.find('.children-entities')
    @$el.addClass "flash"
    @$el

      # body...
    # console.log "playground", @regions.children






module.exports = StatsView
