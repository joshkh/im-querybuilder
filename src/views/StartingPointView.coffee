require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'

class StartingPointView extends Backbone.View

  template: require '../templates/startingpoint.tpl'
  test: 123

  talk: ->
    console.log "StartingPointView is talking"

  render: ->
    debugger;
    @$el.append @template {}
    console.log "I am rendering"

  another: ->
    console.log "I am another"


module.exports = StartingPointView
