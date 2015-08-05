_ = require 'underscore'
$ = require 'jquery'
Tracks = require '../tracks/index'
BlockModel = require '../models/BlockModel'

MenuView = require './MenuView'
MenuModel = require '../models/MenuModel'

TracksMenuView = require './TracksMenuView'
TracksMenuModel = require '../models/TracksMenuModel'

ListsMenuModel = require '../models/ListsMenuModel'
ListsMenuView = require './ListsMenuView'

Events = require '../utils/Events'


console.log "$", $

CoreView = require './CoreView'

class BlockView extends CoreView

  # template: require '../templates/uiblock.tpl'
  template: require '../templates/uiblockcard.tpl'
  # tagName: "div"
  # className: "temp"


  events:
    "click .addblock": "addblock"
    "click .query": "runQuery"
    "click .visible": "runVis"
    "click .talkup": "buildQuery"
    "focusout .lookup": "setLookupConstraint"
    "click .collection": "renderMenu"
    # "click .item": "switchModel"
    "mouseover .flexcontent": "mouseOver"
    "mouseleave .flexcontent": "mouseLeave"
    "click .addtrack": "showTrackMenu"
    "click .showlists": "showListsMenu"
    "focus .filtertextbox": "hidelistbox"
    "focusout .filtertextbox": "showlistbox"



  runquery = ->
    console.log "message receieved"

  hidelistbox: ->
    # @$el.find('.listname').addClass 'hideme'

  showlistbox: ->
    # @$el.find('.listname').removeClass 'hideme'

  initialize: ->
    console.log "checking out my model", @model
    @model.get('selected').on 'change', @render, @
    Events.on 'runquery', @talk, @

  talk: ->
    if @model.get('top') == true
      console.log "my model is", @model.countQuery
      cc = @model.countQuery().then (c) =>
        Events.trigger 'newcount', c
      # console.log "cc", cc


  testfunc: ->
    console.log "track selected bubbled to parent"

  closeMenu: ->
    @$('.menu').addClass('stubify')
    console.log "model", @

  addtrack: (track) ->
    console.log "Adding track", track
    parsed = track.target.dataset.track
    console.log "plesae add", parsed
    nexttrack = new BlockView
      model: new BlockModel
        root: 'Organism'
        desc: parsed
        valuefilter: true
      template: 'test'
    @$el.find(".flexcontent").append nexttrack.render()
    console.log "nexttrack", nexttrack
    @closeMenu()

  showListsMenu: ->
    @$el.find('.menu').addClass 'stubify'
    if !@listsmenu?
      lm = new ListsMenuModel root: 'Gene'
      @listsmenu = new ListsMenuView model: lm
      @listsmenu.on 'itemselected', @setList, @
      @$el.find('.menu').html @listsmenu.render()
      @$el.find('.menu').removeClass 'stubify'
      @$el
    else
      # @$el.find('.menu').html @trackmenu.$el
      @$el.find('.menu').html @listsmenu.render()
      @$el.find('.menu').removeClass 'stubify'
      @$el

  showTrackMenu: (evt) ->
    evt.stopPropagation()
    @$el.find('.menu').addClass 'stubify'
    if !@trackmenu?
      tm = new TracksMenuModel root: 'Gene'
      @trackmenu = new TracksMenuView model: tm
      @trackmenu.on 'trackselected', @addtrack, @
      @$el.find('.menu').html @trackmenu.render()
      @$el.find('.menu').removeClass 'stubify'
      @$el
    else
      # @$el.find('.menu').html @trackmenu.$el
      @$el.find('.menu').html @trackmenu.render()
      @$el.find('.menu').removeClass 'stubify'
      @$el

  setList: (val) ->
    console.log "val", val
    list = val.target.dataset.list
    console.log "selected list", list
    @$el.find('.showlists').text(list)
    # @$el.find('.filter').addClass('hideme')
    @closeMenu()

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


    @model.get('service').fetchLists().then (lists) ->
      console.log "lists are", lists
    # debugger;
    @$el.find('.menu').addClass 'stubify'
    if !@menu?
      mm = new MenuModel paths: @model.getCollections()
      @menu = new MenuView model: mm
      @menu.settled().then =>
        @$el.find('.menu').html @menu.render()
        @$el.find('.menu').removeClass 'stubify'
        @$el
    else
       @$el.find('.menu').html @menu.$el
       @$el.find('.menu').removeClass 'stubify'
       @$el

  render: ->
    @$el.html @template {model: @model}
    @regions = @$el.find('.children-entities')
    @$el.addClass "flash"
    @mouseLeave()
    @model.buildQuery()
    # console.log "finished rendering", @

    # body = $('body').find('#infopanel').text('running')
    # console.log "body", body
    @$el.find('.filtertextbox')[0].focus()
    @$el


      # body...
    # console.log "playground", @regions.children






module.exports = BlockView
