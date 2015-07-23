# Packages
_ 								= require 'underscore'
Backbone 					= require 'backbone'
log 							= require './utils/log'
$ 								= Backbone.$
imjs 							= require 'imjs'
Q 								= require 'q'
pkg 							= require '../package.json'

# Backbone
CoreView 					= require './views/core-view'
BlockView				= require './views/BlockView'
BlockModel			= require './models/BlockModel'

TrackModel = require './models/TrackModel'

# Utilities
Service 					= require './utils/service'

require './shim'

# Styles
bootstrap 				= require 'bootstrap'

class AppView extends CoreView
	template: require './templates/app.tpl'

	initialize: (opts) ->
		console.debug "imqb #{pkg.version}"

	load: (element, options) ->
		@$el = $ element
		Service.set new imjs.Service options.service
		@render()

	render: ->
		@$el.html @template {}
		StartingView = new BlockView
			model: new BlockModel
				root: 'Gene'
		@$(".imqb").append StartingView.render()

module.exports = AppView
