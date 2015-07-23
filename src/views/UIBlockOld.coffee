require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
PathView = require './PathView'
$ 				= Backbone.$
UIBlockModel = require '../models/UIBlockModel'
AttributesView = require './Attributes'

class UIBlock extends Backbone.View

  template: require '../templates/uiblock.tpl'

  tagName: "div"
  className: "uiblock-container"
  box: null

  events:
    "click .add": "addchild"
    "click .remove": "deleteme"
    "click .talkup": 'talkup'
    "click .visible": "togglevis"
    "click .query": "runQuery"
    "focusout .lookup": "setLookup"

  initialize: ->
    @listenTo @model, 'change:query', @talk
    @listenTo @model, 'change:views', -> alert 'Changed views.'
    @listenTo @model, 'change:paths', @speak


  speak: (evt) ->
    @render()


  setLookup: (evt) ->
    @model.setLookupConstraint evt.target.value

  runQuery: ->
    @model.runQuery();

  changeViews: ->
    console.log "VIEWS HAVE BEEN CHANGED", @model.get('views')

  talkup: (evt) ->
    debugger;
    evt.stopPropagation()
    console.log "talking up on", @model
    @model.set {name: "testname"}

  constructor: ->
    super
    root = @model.get 'root'
    if not root then @$el.addClass 'arrow_box'
    attView = new AttributesView



  deleteme: ->
    @remove();
    @unbind();
    @model.destroy();

  togglevis: (evt) ->
    evt.stopPropagation();
    bg = @$el.find(".contents")
    bg.toggleClass 'disabled'

  addchild: (evt) ->
    evt.stopPropagation();
    name = @$el.find("input").val()
    view = new UIBlock model: new UIBlockModel name: name
    @model.addchild view.model
    @box.append view.render()

  render: ->

    # Populate our element.
    @$el.html @template model: @model
    # Cache our elements for accessing later
    @box = @$el.find(".children")

    # Compute children views
    childhtml = []
    _.each @model.get 'children', (nextchild) =>
      view = new UIBlock model: nextchild
      childhtml.push view.render()

    # Append the children
    @box.append childhtml
    @$el

module.exports = UIBlock
