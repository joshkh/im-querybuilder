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
QuantityModel 		= require './models/QuantityModel'
PathModel					= require './models/PathModel'


class MainView extends CoreView

	initialize: (opts) ->
		console.log "IMQB #{pkg.version}"


	load: (element, options) ->

		@el = $(element)
		@render()

		flymine = new imjs.Service options.service

		that = 123

		flymine.fetchModel().then (immodel) =>

			setTimeout ->

				pathinfo = immodel.makePath "Gene"
				pm = new PathModel pathinfo
				console.log "pm is", pm

			, 2000
			# childnodes = pathinfo.getChildNodes()
			# console.log "childnodes", childnodes
			#
			# promises = childnodes.map (next) ->
			# 	next.getDisplayName()
			#
			# Q.all(promises).then (names) ->
			# 	console.log "names", names


			# pathinfo = immodel.makePath "Gene"
			#
			# debugger;
			# pm = new PathModel {path: pathinfo}
			# pv = new PathView {el: @el, model: pm}
			# pv.render()
			# console.log "pm is", pm



	render: ->
		@el.html template {version: pkg.version}


module.exports = MainView
