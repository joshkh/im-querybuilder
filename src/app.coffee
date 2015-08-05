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

Events = require './utils/Events'

TrackModel = require './models/TrackModel'
Tracks = require './tracks/index'

# Utilities
Service 					= require './utils/service'

require './shim'

global.jQuery = require("jquery")


# Styles
bootstrap 				= require 'bootstrap'

console.log "events", Events


class AppView extends Backbone.View

	el: "#querybuilder"

	events:
		"click #clickme": "dome"
		"click #runme": "dome"


	template: require './templates/app.tpl'

	# statstemplate = require './templates/stats.tpl'

	initialize: (opts) ->
		console.log "init"
		Events.on 'newcount', @updatecount, @
		# console.debug "imqb #{pkg.version}"

	updatecount: (value) ->
		console.log "updating the count"
		@$el.find('#infopanel').text value + " Results"

	talk: ->
		alert 'talking'
	dome: ->
		console.log "done is triggering"
		Events.trigger "runquery", @

	load: (element, options) ->
		# @$el = $ element

		Service.set new imjs.Service options.service
		@render()

	render: ->
		console.log "rendering"
		@$el.html @template {}

		StartingView = new BlockView
			model: new BlockModel
				root: 'Gene'
				top: true;
				showorg: true
		@$(".imqb-container").append StartingView.render()
		console.log "top view is", @
		# @$(".imqb-container").append "<h2>Another test</h2>"
		# StartingView2 = new BlockView
		# 	model: new BlockModel
		# 		root: 'Protein'
		# @$(".imqb-container").append StartingView2.render()
		# console.log "starting view has el of", @$el

		# @$el.html @template {}
		# StartingView2 = new BlockView
		# 	model: new BlockModel
		# 		root: 'Protein'
		# @$(".imqb-container").append "<h1>Test</h1>"


module.exports = AppView
