CoreModel = require '../src/models/CoreModel'
should = require('chai').should()

describe "Core Model", ->

	it "should return a pass", ->

		m = new CoreModel()

		m.test().should.equal('good')