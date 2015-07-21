require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
PathView = require './PathView'
$ 				= Backbone.$
UIBlockModel = require '../models/UIBlockModel'

class TrackManager extends Backbone.View

  template: require '../templates/track-manager.tpl'

  tagName: "div"
  className: "track-manager"

  initialize: ->
    @listenTo @model, 'change:query', @talk


  talkup: (evt) ->
    evt.stopPropagation()
    console.log "talking up on", @model
    @model.set {name: "testname"}

  constructor: ->
    super

  deleteme: ->
    @remove();
    @unbind();
    @model.destroy();

  togglevis: (evt) ->
    evt.stopPropagation();
    console.log "el is", @$el
    bg = @$el.find(".contents")
    console.log "bg is", bg
    debugger;
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
    @box = @$el.find(".children-entities")

    # Compute children views
    childhtml = []
    _.each @model.get 'children', (nextchild) =>
      view = new UIBlock model: nextchild
      childhtml.push view.render()

    # Append the children
    @box.append childhtml
    @$el

module.exports = UIBlock
