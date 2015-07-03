QuantityModel = require '../src/models/QuantityModel'
should = require('chai').should()

describe "Quantity Model", ->

	it "should have default values", ->

		m = new QuantityModel()
		m.get('quantities').should.be.an('string')