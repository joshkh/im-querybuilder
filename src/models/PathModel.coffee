Q         = require 'q'
CoreModel = require './CoreModel'

{Model: {NUMERIC_TYPES, BOOLEAN_TYPES}} = require 'imjs'

class PathModel extends CoreModel

  defaults: ->
    human: "default"
    path: null
    type: null
    displayName: "default"
    typeName: null
    parts: []
    isNumeric: false
    isBoolean: false
    isReference: false # Assumes attribute by default
    isAttribute: true
    active: Q.defer()

  settled: -> @get('active').promise

  constructor: (path) ->
    deferred = Q.defer()
    super()
    @set @pathAttributes path
    @setDisplayName path
    @setTypeName path
    deferred.promise

  setDisplayName: (path) ->
    path.getDisplayName().then (name) =>
      split = name.split ' > '
      @set displayName: name, parts: split
      @set human: split[split.length - 1]
      @get('active').resolve @

  setTypeName: (path) ->
    type = (if path.isAttribute() then path.getParent() else path).getType()
    type.getDisplayName().then (name) => @set typeName: name

  pathAttributes: (path) ->
    str = String path
    isAttr = path.isAttribute()
    type = path.getType()
    attrs =
      id: (if isAttr then str else "#{ str }.id")
      path: str
      type: (type.name ? type)
      pathinfo: path

    if isAttr
      attrs.isNumeric = (type in NUMERIC_TYPES)
      attrs.isBoolean = (type in BOOLEAN_TYPES)
    else
      attrs.isReference = true
      attrs.isAttribute = false

    return attrs

module.exports = PathModel
