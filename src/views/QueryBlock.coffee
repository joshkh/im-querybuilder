_ = require 'underscore'
Backbone = require 'backbone'
PathView = require './PathView'
$ 				= Backbone.$
PathModel = require '../models/PathModel'
AttributeCollection = require '../collections/AttributeCollection'

class QueryBlock extends Backbone.View

  template: require '../templates/queryblock.tpl'

  tagName: "div"
  className: "queryblock"

  constructor: (path) ->
    @collection = new AttributeCollection
    @model = new PathModel path
    @getAttributes path
    @listenTo @model, "change", @render
    super()

  initialize: ->
    @collection.on "change", @render, @

  getAttributes: (path) ->
    childnodes = path.getChildNodes()
    _.each childnodes, (node) =>
      if node.isAttribute() is true
        @collection.add node

  render: ->
    results = @template {@model, @collection}
    @$el.html results


module.exports = QueryBlock
