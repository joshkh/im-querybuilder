CoreModel = require './CoreModel'
imjs = require 'imjs'

class QuantityModel extends CoreModel

	defaults:
		quantities: ["one", "some", "all"]

	initialize: ->
		console.log "QuantityModel has been inited"

module.exports = QuantityModel