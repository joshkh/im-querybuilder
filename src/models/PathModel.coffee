Backbone  = require 'backbone'
_         = require 'underscore'

class PathModel extends Backbone.Model

  defaults:
    attributes: []
    collections: []

  initialize: ->
    @children()

  # Get our children items
  children: ->
    childnodes = @get("path").getChildNodes()

    tempattributes = []

    _.each childnodes, (next) =>
      @get("attributes").push next if next.isAttribute()
      @get("collections").push next if next.isCollection()

    console.log "this", @


    # @set {children: @get("path").getChildNodes()}








module.exports = PathModel
