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

        # Try adding a constraint
        constraint = {
          "path": "Gene",
          "op": "LOOKUP",
          "value": "ab*",
          "extraValue": "",
          "code": "A"
        }

        val.addConstraint constraint;


        @set query: val

        #
        @

  setRoot: ->
    console.log "setRoot", @
    rootclass = @get('immodel').classes[@get 'root']
    {attributes: attributes, collections} = rootclass
    @set {attributes: attributes, collections: collections}

module.exports = QueryBlockModel
