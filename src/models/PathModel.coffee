Backbone  = require 'backbone'
_         = require 'underscore'


{Model: {NUMERIC_TYPES, BOOLEAN_TYPES}} = require 'imjs'

class PathModel extends Backbone.Model

  defaults: ->
    path: null
    type: null
    displayName: null
    typeName: null
    parts: []
    isNumeric: false
    isBoolean: false
    isReference: false # Assumes attribute by default
    isAttribute: true

  constructor: (path) ->
    super()
    @set @pathAttributes path
    @setDisplayName path
    @setTypeName path

  setDisplayName: (path) ->
    path.getDisplayName().then (name) =>
      @set displayName: name, parts: name.split(' > ')

  setTypeName: (path) ->
    console.log "setting type name"
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

    if isAttr
      attrs.isNumeric = (type in NUMERIC_TYPES)
      attrs.isBoolean = (type in BOOLEAN_TYPES)
    else
      attrs.isReference = true
      attrs.isAttribute = false

    return attrs


    # @children()

  # Get our children items
  # children: ->
  #   childnodes = @get("path").getChildNodes()
  #   debugger;
  #
  #   tempattributes = []
  #
  #   _.each childnodes, (next) =>
  #
  #     displayName = next.getDisplayName()
  #
  #     @get("attributes").push next if next.isAttribute()
  #     @get("collections").push next if next.isCollection()
  #
  #   console.log "this", @


    # @set {children: @get("path").getChildNodes()}



module.exports = PathModel
