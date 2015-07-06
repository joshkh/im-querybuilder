_ = require 'underscore'
Backbone = require 'backbone'

class PathView extends Backbone.View

  template: require '../templates/pathview.tpl'

  initialize: ->
    console.log "PathView created", @

  render: ->
    console.log "PathView rendering.", @
    @$el.append @template {collections: @model.get("collections")}
    debugger;


module.exports = PathView
