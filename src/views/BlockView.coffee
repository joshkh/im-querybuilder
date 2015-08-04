_ = require 'underscore'
$ = require 'jquery'
Tracks = require '../tracks/index'
BlockModel = require '../models/BlockModel'

MenuView = require './MenuView'
MenuModel = require '../models/MenuModel'


console.log "$", $

CoreView = require './CoreView'

class BlockView extends CoreView

  # template: require '../templates/uiblock.tpl'
  template: require '../templates/uiblockcard.tpl'
  tagName: "div"
  className: "temp"

  events:
    "click .addblock": "addblock"
    "click .query": "runQuery"
    "click .visible": "runVis"
    "click .talkup": "buildQuery"
    "focusout .lookup": "setLookupConstraint"
    "click .collection": "renderMenu"
    "click .item": "switchModel"
    "mouseover .flexcontent": "mouseOver"
    "mouseleave .flexcontent": "mouseLeave"

  initialize: ->
    console.log "checking out my model", @model
    @model.get('selected').on 'change', @render, @

  testfunc: ->
    console.log "HELLO WORLD"


  mouseOver: ->
    # console.log "MouseOver"
    @$('.toolbar').removeClass('stubify');

  mouseLeave: ->
    # console.log "MouseLeave"
    @$('.toolbar').addClass('stubify');

  constructor: ->
    super
    @regions = null

  toggleMenu: ->
    @$('.menu').toggleClass('stubify')
    console.log "model", @

  showCollections: (evt) ->
    evt.stopPropagation()
    @toggleMenu()
    col = @model.getCollections()
    console.log "col", col
    # @$('.collection').toggleClass('highlighted');
    # @$('.fullheight').toggleClass('stubify');

  switchModel: (evt) ->
    serv = @model.get('service');
    # console.log serv
    # serv.model.then (m) ->
    #   console.log "m", m
    #   debugger;


    serv.makePath("Gene").then (p) ->
      cn = p.getChildNodes()
      _.each cn, (c) ->
        if c.isCollection()
          c.getDisplayName().then (name) ->

            console.log "name:", name
            # console.log "c", c
    #

    # evt.stopPropagation()
    # console.log "switching model to", evt
    # m = evt.target.dataset.model
    # @model = new BlockModel root: m
    # @initialize()
    # @render()
    # setTimeout =>
    #   console.log "model", @model
    # , 5000
    # debugger;



  buildQuery: ->
    @model.buildQuery()


  setLookupConstraint: (evt) ->
    @model.setLookupConstraint evt.target.value


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

  renderMenu: ->

    if !@menu?
      mm = new MenuModel paths: @model.getCollections()
      @menu = new MenuView model: mm


    console.log "rendering menu"

    @menu.settled().then =>

      console.log "allowed"

      @$el.find('.menu').html @menu.render()
      @$el.find('.menu').toggleClass 'stubify'
      @$el

  render: ->
    # console.log "Rendering UIBlock", @
    @$el.html @template {model: @model}
    @regions = @$el.find('.children-entities')
    @$el.addClass "flash"
    @mouseLeave()
    @$el


      # body...
    # console.log "playground", @regions.children






module.exports = BlockView
