Backbone 	= require 'backbone'
imjs 			= require 'imjs'
Service 	= require '../utils/service'

class CoreModel extends Backbone.Model

	constructor: ->
		super
		@set service: Service.get()

module.exports = CoreModel
