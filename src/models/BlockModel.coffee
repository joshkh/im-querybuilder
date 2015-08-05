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
    pathinfo: null
    pathValues: []
    desc: null
    showorg: false

  initialize: ->
    @on 'change:query', @changequery, @

  # Setup is done in constructor on purpose.
  # Need to avoid recrusive loops (see BlockCollection))
  constructor: ->
    super

    @set children: new BlockCollection
    @set selected: new AttributeCollection
    @set constraints: new ConstraintCollection
    @set pathValues: new Backbone.Collection

    @get('service').makePath(@get('root')).then (path) => @set pathinfo: path

    @listenTo @get('children'), 'add', (evt) -> {}
    @listenTo @get('selected'), 'all', (evt) -> @trigger "changed:selected"

    if !@get('query')
      @get('service').query(root: @get('root')).then (query) =>
        @set query: query
        @addSummaryFieldsToSelect()
    else
      @get('service').query(@get('query')).then (query) =>
        @set query: query
        @buildViewFromQuery()

    @get('service').pathValues('Organism.shortName').then (results) =>
      @get('pathValues').add {value: "(Any)"}
      @get('pathValues').add results

    if !@get('desc')? then @set desc: @get('root')
    # debugger;

  getCollections: ->
    _.filter @get('pathinfo').getChildNodes(), (next) ->
      next.isCollection() is true


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

    # console.log "query is now", query

  countQuery: ->
    deferred = Q.defer()
    @get('query').count().then (c) ->
      console.log "resolving c", c
      deferred.resolve c
    deferred.promise

  setLookupConstraint: (value) ->

    console.log "adding value to constraint1", value

    constraints = @get('query').constraints
    _.each constraints, (constraint) =>
      if constraint.op is 'LOOKUP'
        console.log "removing a constraint"
        @get('query').removeConstraint constraint

    if !!value then @get('query').addConstraint
        path: "Gene"
        op: "LOOKUP"
        value: value

    console.log "query is now", @get('query')

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
