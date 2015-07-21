globalservice = null

get = ->
  return globalservice

set = (service) ->
  globalservice = service

module.exports = {get, set}
