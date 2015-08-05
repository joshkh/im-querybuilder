Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'
CoreModel = require './CoreModel'
PromiseCollection = require './PromiseCollection'
PathModel = require './PathModel'
TracksCollection = require './TrackCollection'
Tracks = require '../tracks/index'



class TracksMenuModel extends CoreModel

  defaults:
    root: null

  initialize: ->

  constructor: ->
    super

    # console.lo

    # Stores the paths
    @set tracks: new TracksCollection
    @get('tracks').add Tracks.get @get('root')


    # Emit events from our collections and attributes
    @listenTo @get('tracks'), 'add', (evt) -> @trigger 'add:tracks', evt;


    # @get('PathsCollection').add @get 'paths'


module.exports = TracksMenuModel
