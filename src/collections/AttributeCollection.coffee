Backbone  = require 'backbone'
_         = require 'underscore'
PathModel  = require '../models/PathModel'

class AttributeCollection extends Backbone.Collection

  model: PathModel

module.exports = AttributeCollection
