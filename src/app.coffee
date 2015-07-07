_ 				= require 'underscore'
Backbone 	= require 'backbone'
log 			= require './utils/log'
$ 				= Backbone.$
imjs 			= require 'imjs'
Q 				= require 'q'


pkg 		= require '../package.json'

template = require './templates/main.tpl'

CoreView 					= require './views/core-view'
StartingPointView	= require './views/StartingPointView'
PathView					= require './views/PathView'
QueryBlock				= require './views/QueryBlock'
QuantityModel 		= require './models/QuantityModel'
PathModel					= require './models/PathModel'


class MainView extends CoreView

	initialize: (opts) ->
		console.log "IMQB #{pkg.version}"


	load: (element, options) ->
		console.log "Loading"

		@$el = $(element)
		@render()

		flymine = new imjs.Service options.service

		that = 123

		flymine.fetchModel().then (immodel) =>

			queryblocksdiv = @.$(".imqb.queryblocks")


			genePathInfo = immodel.makePath "Gene"
			qb = new QueryBlock genePathInfo
			queryblocksdiv.append qb.render()



	render: ->
		@$el.html template {version: pkg.version}


module.exports = MainView
