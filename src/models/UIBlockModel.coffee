Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'



class UIBlockModel extends Backbone.Model

  defaults: ->
    children: []
    name: "Joker"

  initialize: ->
    console.log "UIBlockModel initialized."

  constructor: (opts) ->
    super
    console.log "UIBlockModel constructed."

  talk: ->
    console.log "child has been updated!"

  addchild: (child) ->
    @listenTo child, "change", @talk
    @get('children').push child

module.exports = UIBlockModel
