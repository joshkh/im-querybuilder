Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'



class UIBlockModel extends Backbone.Model

  defaults: ->
    children: []
    name: "Joker"
    root: false

  initialize: ->
    console.log "UIBlockModel initialized."

  constructor: (opts) ->
    super
    console.log "UIBlockModel constructed.", @

  talk: (evt) ->


    if @get('root') is true
      console.log "root", @
      debugger;
      console.log "message got to parent", @
      debugger;

  addchild: (child) ->
    console.log "got child", child
    @listenTo child, "change", @talk
    @get('children').push child
    console.log "children length is now", @get('children').length


module.exports = UIBlockModel
