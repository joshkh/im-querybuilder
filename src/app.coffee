_ = require 'underscore'
Backbone = require 'backbone'
log = require './utils/log'
$ = Backbone.$
imjs = require 'imjs'


pkg = require '../package.json'

template = require './templates/main.tpl'

CoreView 				= require './views/core-view'
QuantityModel 	= require './models/QuantityModel'
PathModel				= require './models/PathModel'


class MainView extends CoreView

	initialize: (opts) ->
		console.log "IMQB #{pkg.version}"


	load: (element, options) ->




		flymine = new imjs.Service options.service

		flymine.fetchModel().then (model) ->



			pathinfo = model.makePath "Gene"
			pm = new PathModel {path: pathinfo}
			console.log "pm is", pm
			debugger;



		@el = $(element)
		@render()


	render: ->
		@el.html template {version: pkg.version}


module.exports = MainView
