Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'



class QueryBlockModel extends Backbone.Model

  defaults: ->
    root: "Gene"
    attributes: []
    collections: []
    immodel: null
    query: null
    service: null
    selected: []
    children: []
    parent: null

  initialize: ->
    @on "change:root", @setRoot, @
    @on 'change:selected', @

  constructor: (opts) ->
    super

    @setRoot()


    # If we weren't constructed with a parent then we likely don't have a root
    if !@get("query")?
      opts =
        root: @get 'root'

      @get("service").query(opts).then (queryobj) =>
        @set query: queryobj
        val = @get("query").addToSelect(["symbol"]);


        val.addConstraint constraint;


        @set query: val

        #
        @

  addchildview: (queryblock) ->
    console.log "adding child view"
    @listenTo queryblock, change,

  toggleview: (view) ->
    selected = @get 'selected'
    index = _.indexOf @selected, view

    # If we found it them remove it
    if index > -1
      @set 'selected', _.without selected, view
    else
      selected.push view
      @set 'selected', selected

    @buildquery()

  buildquery: ->
    query = @get 'query'
    query.views = @get 'selected';
    @set query: query

    # Needs a manual trigger since this attribute
    # is a model.
    @trigger "change:query"


  setRoot: ->
    console.log "setRoot", @
    rootclass = @get('immodel').classes[@get 'root']
    {attributes: attributes, collections} = rootclass
    @set {attributes: attributes, collections: collections}

module.exports = QueryBlockModel
