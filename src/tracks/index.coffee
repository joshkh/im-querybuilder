_ = require 'underscore'

tracks = [
  require './go-terms'
  require './homologues'
]

console.log "tracks array", tracks
fetch = (root) ->
  _.filter tracks, (next) ->
    next.from is root

all = -> tracks

module.exports = {fetch, all}
