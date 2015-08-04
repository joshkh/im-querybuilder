Backbone = require 'backbone'
CoreModel = require '../models/CoreModel'
Q = require 'q'
_ = require 'underscore'

# The purpose of a PromiseCollection is to fire collection related events
# only its models have finished being constructed. A likely implementation
# could be that the constructors of the models fetch asynch data
class PromiseCollection extends Backbone.Collection

  model: CoreModel

  add: (models) ->
    if _.isArray models
      res = super models, silent: true
      all = _.map res, (model) -> model.settled()

      Q.all(all).then (fin) => @trigger 'add', fin
    else
      res = super models, silent: true
      models.settled().then => @trigger 'add', res

module.exports = PromiseCollection
