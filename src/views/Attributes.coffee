CoreView  = require './CoreView'

class AttributesView extends CoreView

  defaults:
    paths: []

  template: require '../templates/attributes.tpl'

  constructor: ->
    super()
    console.log "AttributesView has been constructed.", @
    console.log "my template", @template


module.exports = AttributesView
