Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'
CoreModel = require './CoreModel'
CoreCollection = require './CoreCollection'
PathModel = require './PathModel'


class BlockModel extends CoreModel

  defaults:
    query: null
    parent: null
    children: null
    selected: null
    constraints: null
    root: "Gene"

  initialize: ->
    @on 'change:query', @changequery, @

  # Setup is done in constructor on purpose.
  # Need to avoid recrusive loops (see BlockCollection))
  constructor: ->
    super

    @set children: new BlockCollection
    @set selected: new AttributeCollection
    @set constraints: new ConstraintCollection

    @listenTo @get('children'), 'add', (evt) -> {}
    @listenTo @get('selected'), 'all', (evt) -> {}

    if !@get('query')
      @get('service').query(root: @get('root')).then (query) =>
        @set query: query
        @addSummaryFieldsToSelect()
    else
      @get('service').query(@get('query')).then (query) =>
        @set query: query
        @buildViewFromQuery()

  buildViewFromQuery: ->
    @set root: @get('query').description
    arr = @get('query').views
    results = _.map arr, (next) =>
      @get('service').makePath next
    Q.all(results).then (final) =>
      @get('selected').add final
      console.log "ME", @


  addSummaryFieldsToSelect: ->
    root = @get 'root'
    @get('service').fetchSummaryFields().then (results) =>
      results = _.map results[root], (next) =>
        @get('service').makePath next
      Q.all(results).then (final) =>
        @get('selected').add final


  buildQuery: ->
    query = @get 'query'
    # Do I have children? Gonna need those views!
    @get('children').each (next) =>
      subviews = next.get('query').views
      _.each subviews, (subview) ->
        console.log "looking at", subview
        if !query.hasView subview then query.addToSelect subview

    @get('selected').each (next) ->
      if !query.hasView next.id then query.addToSelect next.id

    console.log "query is now", query



  addblock: (opts) ->
    @get('children').add opts

  addView: (strpath) ->
    @get('service').makePath(strpath).then (pi) =>
      @get('selected').add pi


class BlockCollection extends CoreCollection

  model: BlockModel

class AttributeCollection extends CoreCollection

  model: PathModel

class ConstraintCollection extends CoreCollection

  model: Backbone.Model

module.exports = BlockModel
