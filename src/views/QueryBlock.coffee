require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
PathView = require './PathView'
$ 				= Backbone.$
PathModel = require '../models/PathModel'
AttributeCollection = require '../collections/AttributeCollection'
TypeaheadSearch = require '../mixins/typeahead'
QueryBlockModel = require '../models/QueryBlockModel'


typeahead = require 'typeahead.js'

class QueryBlock extends Backbone.View

  template: require '../templates/queryblock.tpl'

  tagName: "div"


  events:
    "click .dropdown-menu li a": "setRoot"
    "click .attribute": "toggleAttribute"
    "click .addcollection": "runquery"


  constructor: ->
    super

  initialize: ->
    @model.on 'change', @talk, @

  talk: (evt) ->

    setTimeout =>
      parentel = @model.get("parentel")
      debugwindow = parentel.find(".query")
      debugger;
      debugwindow.html JSON.stringify @model.get("query").toJSON(), null, 2
    , 3000

  runquery: ->
    @model.get("service").rows(@model.get 'query').then (value) ->
      console.log "value is", value




  addCollection: (evt) ->
    parentel = @model.get("parentel")
    @queryblocksdiv = parentel.find(".imqb.queryblocks")


    newModel = @model.clone()
    newModel.set {parent: @model}



    qbv = new QueryBlock model: newModel
    @queryblocksdiv.append qbv.render()



  toggleAttribute: (evt) ->
    attribute = evt.target.dataset.attributename
    selected = @model.get 'selected'
    index = _.indexOf selected, attribute

    # If we found it them remove it
    if index > -1
      @model.set 'selected', _.without selected, attribute
    else
      selected.push attribute
      @model.set 'selected', selected

    @render()


  setRoot: (evt) ->
    @model.set root: evt.target.dataset.classname
    @render()

  render: ->

    console.log "rendering as", @


    collections = @model.get "collections"
    attributes = @model.get "attributes"
    root = @model.get "root"

    parent = @model.get "parent"


    if parent
      classes = @model.get('immodel').classes[root].collections
    else
      classes = @model.get('immodel').classes
    selected = @model.get 'selected'




    results = @template {root, classes, attributes, collections, selected}
    @$el.html results

    # We need to update the appropriate textboxes.
    # Damn you input boxes and your lack of inner html.
    @$('.classInputText').val(root);


    @$el



module.exports = QueryBlock
