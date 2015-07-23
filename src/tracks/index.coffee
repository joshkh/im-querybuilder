_ = require 'underscore'

tracks = [
  require './go-terms'
  require './homologues'
]

get = (root) ->
  _.filter tracks, (next) ->
    next.from is root

all = -> tracks

module.exports = {get, all}
