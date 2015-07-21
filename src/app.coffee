_ 				= require 'underscore'
Backbone 	= require 'backbone'
log 			= require './utils/log'
$ 				= Backbone.$
imjs 			= require 'imjs'
Q 				= require 'q'

console.log "$", $


pkg 		= require '../package.json'

template = require './templates/app.tpl'
debugtemplate = require './templates/debug.tpl'
trackstemplate = require './templates/track-manager.tpl'

CoreView 					= require './views/core-view'
StartingPointView	= require './views/StartingPointView'
PathView					= require './views/PathView'
QueryBlock				= require './views/QueryBlock'
QuantityModel 		= require './models/QuantityModel'
PathModel					= require './models/PathModel'
QueryBlockModel 	= require './models/QueryBlockModel'
UIBlockView				= require './views/UIBlock'
UIBlockModel			= require './models/UIBlockModel'

CoreModel					= require './models/CoreModel'

bootstrap 		= require 'bootstrap'

tracks = require './tracks/index'
console.log "tracks", tracks

Service = require './utils/service'

console.log "SERVICE", Service


class MainView extends CoreView

	initialize: (opts) ->
		console.log "IMQB #{pkg.version}"

	load: (element, options) ->



		# jQueryify our target element and render the shell
		@$el = $(element)

		# Render our shell
		@render()

		# Create our service
		intermine = new imjs.Service options.service
		Service.set intermine



		AceModel = new UIBlockModel name: "Gene", root: true
		AceBlock = new UIBlockView model: AceModel
		@$(".myapp").append AceBlock.render()


		myquery =
		  'from': 'Gene'
		  'select': [
		    'Gene.secondaryIdentifier'
		    'Gene.symbol'
		    'Gene.primaryIdentifier'
		    'Gene.organism.name'
		  ]
		  'orderBy': [ {
		    'path': 'secondaryIdentifier'
		    'direction': 'ASC'
		  } ]
		  'where': [ {
		    'path': 'Gene'
		    'op': 'LOOKUP'
		    'value': 'ab*'
		    'extraValue': ''
		    'code': 'A'
		  } ]

		intermine.rows(myquery).then (qresults) ->
			console.log "query results are", qresults



		# loc.append kinguib.render()
		# loc.append queenuib.render()
		# loc.append queenuib2.render()
		# loc.append aceuib.render()




		# Fetch our model.
		intermine.fetchModel().then (immodel) =>

			# Create our first query block and pass it a model
			# qbv = new QueryBlock
			# 	model: new QueryBlockModel
			# 		root: "Gene"
			# 		service: intermine
			# 		immodel: immodel
			# 		parentel: @$el

			# Render the query block
			# @queryblocksdiv.append qbv.render()









		opts =
			"identifiers": ["eve", "zen", "bib"],
			"type": "Gene",
			"caseSensitive": true,
			"wildCards": true,
			"extra": "D. melanogaster"





		# console.log "idj is", idj


		# Let's make a query...

		# intermine.query(myquery).then (aquery) =>

			# Get a handle on our debug window:

			# debugwindow.html JSON.stringify myquery, null, 2

			# aquery.count().then(sayCount, sayError)

		sayCount = (value) ->
			# debugger;
			console.log "value is", value

		sayError = (value) ->
			# debugger;
			console.log "error is", error

		# debugger;

		# intermine.fetchModel().then (immodel) =>
		#
		# 	# We'll need a base query to work with
		# 	query = intermine.query().then (query) =>
		#
		# 		genePathInfo = immodel.makePath "Protein"
		# 		console.log "GenePathInfo is", genePathInfo
		# 		qb = new QueryBlock genePathInfo
		# 		console.log "qbdiv", @queryblocksdiv
		# 		@queryblocksdiv.append qb.render()


	renderdebug: ->
		$('body').append debugtemplate {}

	render: ->
		console.log "tracks template", trackstemplate
		xmodel = new Backbone.Model
		xcol = new Backbone.Collection model: xmodel

		xcol.add name: 'john'
		xcol.add name: 'sally'

		@$el.html template {debug: true, version: pkg.version}
		@$el.find('.track-manager').append trackstemplate collection: xcol


		# Get our containers for rendering
		@queryblocksdiv = @.$(".queryblocks")


module.exports = MainView
