Q         = require 'q'
_         = require 'underscore'
CoreModel  = require './CoreModel'
PathModel = require './PathModel'
TrackCollection = require './TrackCollection'
TrackModel = require './TrackModel'


class UIBlockModel extends CoreModel

  defaults: ->
    query: null
    parent: null
    children: new TrackCollection

  initialize: ->
    @listenTo @get('children'), 'add', @childrenEvtAdd
    console.log "UIBlockModel initialized.", @

  childrenEvtAdd: (model) ->
    console.debug "Model added to TrackCollection", model


  constructor: (opts) ->
    super

    if opts?.query?
      console.log "using existing query"
      @get('service').query(opts.query).then (query) =>
        @set query: query
    else
      console.log "using new query"
      @get('service').query().then (query) =>
        @set query: query


  saveSuccess: ->
    @trigger "change", "payload"

  addtrack: (query) ->



    @get('children').add query: "test", parent: "bob"
    console.log @
    # @get('service').query(query).then (query) =>
    #   @children.add new UIBlockModel query: query
    #   console.log @


module.exports = UIBlockModel
