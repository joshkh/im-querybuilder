Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'
CoreModel = require './CoreModel'
PromiseCollection = require './PromiseCollection'
PathModel = require './PathModel'
TracksCollection = require './TrackCollection'
Tracks = require '../tracks/index'



class ListsMenuModel extends CoreModel

  defaults:
    root: null


  initialize: ->

  constructor: ->
    super

    # console.lo

    # Stores the paths
    @set lists: new Backbone.Collection
    @listenTo @get('lists'), 'add', (evt) -> @trigger 'add', evt;

    console.log "this is", @
    # @get('tracks').add Tracks.get @get('root')

    @get('service').fetchLists().then (lists) =>
      @get('lists').add lists



  filter: ->
    console.log "lists are", @get 'lists'
    filtered = @lists.select (list) ->
      return list.type == "Gene"

    # console.log "fil"
    console.log "filtered", filtered




    # Emit events from our collections and attributes
    # @listenTo @get('tracks'), 'add', (evt) -> @trigger 'add:tracks', evt;


    # @get('PathsCollection').add @get 'paths'


module.exports = ListsMenuModel
