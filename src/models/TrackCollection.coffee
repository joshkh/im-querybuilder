TrackModel = require './TrackModel'
Backbone = require 'backbone'
_ = require 'underscore'


class TrackCollection extends Backbone.Collection

  model: TrackModel

  constructor: ->
    super

  add: (one) ->
    console.debug "TrackCollection adding:", one
    super

module.exports = TrackCollection
