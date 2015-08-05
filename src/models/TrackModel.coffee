Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'
CoreModel = require './CoreModel'
# TrackCollection = require './TrackCollection'

class TrackModel extends CoreModel

  defaults:
    query: null
    parent: null
    # children: new TrackCollection

  constructor: ->
    super
    console.log "TrackModel created."

module.exports = TrackModel
