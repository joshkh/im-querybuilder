_ = require 'underscore'
Backbone = require 'backbone'
log = require './utils/log'
$ = require 'jquery'

pkg = require '../package.json'

template = require './templates/main.tpl'
CoreView = require './views/core-view'


class MainView extends CoreView

	initialize: (opts) ->
		log.debug "IMQB #{pkg.version}"

	load: (opts) ->
		@el = $(opts.el)
		@render()

	render: ->
		log.debug "MainView.render called", @el
		@el.html template {version: pkg.version}


module.exports = MainView