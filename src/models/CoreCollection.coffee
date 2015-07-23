Backbone = require 'backbone'
CoreView = require '../views/CoreView'

class CoreCollection extends Backbone.Collection

  model: CoreView

module.exports = CoreCollection
