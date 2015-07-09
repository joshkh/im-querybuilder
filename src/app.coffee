_ 				= require 'underscore'
Backbone 	= require 'backbone'
log 			= require './utils/log'
$ 				= Backbone.$
imjs 			= require 'imjs'
Q 				= require 'q'

console.log "$", $


pkg 		= require '../package.json'

template = require './templates/main.tpl'
debugtemplate = require './templates/debug.tpl'

CoreView 					= require './views/core-view'
StartingPointView	= require './views/StartingPointView'
PathView					= require './views/PathView'
QueryBlock				= require './views/QueryBlock'
QuantityModel 		= require './models/QuantityModel'
PathModel					= require './models/PathModel'

bootstrap 		= require 'bootstrap'
console.log "bootstrap is", bootstrap




class MainView extends CoreView

	initialize: (opts) ->
		console.log "IMQB #{pkg.version}"

	load: (element, options) ->

		# jQueryify our target element and render the shell
		@$el = $(element)
		@render()
		@renderdebug()

		# Set up our intitial query block:
		flymine = new imjs.Service options.service

		flymine.fetchModel().then (immodel) =>

			genePathInfo = immodel.makePath "Protein"
			qb = new QueryBlock genePathInfo
			@queryblocksdiv.append qb.render()


	renderdebug: ->
		$('body').append debugtemplate {}

	render: ->
		@$el.html template {debug: true, version: pkg.version}

		# Get our containers for rendering
		@queryblocksdiv = @.$(".imqb.queryblocks")


module.exports = MainView
