_ = require 'underscore'
Backbone = require 'backbone'

module.exports = class CoreView extends Backbone.View

	initialize: ->
		console.log "CoreView has been initialized."