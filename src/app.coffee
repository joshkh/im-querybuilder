# Packages
# _ 								= require 'underscore'
Backbone 					= require 'backbone'
$ = require 'jquery'
log 							= require './utils/log'
$ 								= Backbone.$
imjs 							= require 'imjs'
Q 								= require 'q'
pkg 							= require '../package.json'
#
# Backbone
CoreView 					= require './views/core-view'
BlockView				= require './views/BlockView'
BlockModel			= require './models/BlockModel'

TrackModel = require './models/TrackModel'

# Utilities
Service 					= require './utils/service'

require './shim'

global.jQuery = require("jquery")


# Styles
bootstrap 				= require 'bootstrap'

class AppView extends Backbone.View
	template: require './templates/app.tpl'
	# statstemplate = require './templates/stats.tpl'

	initialize: (opts) ->
		console.log "init"
		# console.debug "imqb #{pkg.version}"

	load: (element, options) ->
		@$el = $ element
		Service.set new imjs.Service options.service
		@render()

	render: ->
		console.log "rendering"
		@$el.html @template {}
		StartingView = new BlockView
			model: new BlockModel
				root: 'Protein'
		@$(".imqb-container").append StartingView.render()
		@$(".imqb").append StartingView.render()


module.exports = AppView
