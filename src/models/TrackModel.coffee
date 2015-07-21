Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'



class TrackModel extends Backbone.Model

  defaults: ->
    views: []
    roots: []
    root: null

  initialize: ->
    console.log "TrackModel initialized."

  constructor: (opts) ->
    super
    console.log "UIBlockModel constructed.", @

  talk: (evt) ->
    console.log @get('name') + ' is talking'
    @trigger 'change', @
    # if @get('root') is true
    #   console.log "root", @
    #   debugger;
    #   console.log "message got to parent", @
    #   debugger;

  addchild: (child) ->
    console.log "got child", child
    @listenTo child, "change", @talk
    @get('children').push child
    console.log "children length is now", @get('children').length


module.exports = UIBlockModel
