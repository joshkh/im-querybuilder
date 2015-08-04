Backbone  = require 'backbone'
_         = require 'underscore'
Q         = require 'q'
CoreModel = require './CoreModel'
PromiseCollection = require './PromiseCollection'
PathModel = require './PathModel'




class MenuModel extends CoreModel

  defaults:
    paths: []
    complete: Q.defer()

  initialize: ->

  constructor: ->
    super

    # Stores the paths
    @set PathsCollection: new PathsCollection

    # Emit events from our collections and attributes
    @listenTo @get('PathsCollection'), 'add', (evt) -> @trigger 'add:PathsCollection', evt;


    @get('PathsCollection').add @get 'paths'




    # promises = _.map @get('paths'), (path) =>
    #   nm = new PathModel path
    #   @get('PathsCollection').add nm
    #   return nm.settled()
    #
    # Q.all(promises).then (woohoo) =>
    #   @trigger 'renderme'
      # @get('PathsCollection').add nm
      # console.log "nm", nm


    # console.log "IS COMPLETE", @get 'complete'
    #
    # # console.log "constructed with ", @get 'paths'
    # proms = _.each @get('paths'), (path) -> path.getDisplayName()
    #
    # Q.all(proms).then (all) =>
    #   _.each all, (path) =>
    #     path.namePromise.then (res) =>
    #       path.displayName = _.last res.split '>'
    #       console.log @
    #
    #     @trigger 'renderme'




  # getDisplayNames: ->
  #   p0 = @get('paths')[0]
  #   dn = p0.getDisplayName()
  #   dn.then (name) ->
  #     p0.displayName = name
  #     debugger;
  #   proms =
  #
  #   proms = _.each @get('paths'), (path) ->
  #     path.getDisplayName().then (name) =>
  #       console.log "got name", name
  #       path.displayName = name
  #
  #   Q.all proms
  #   .then =>
  #     console.log "FINISHED", @
  #     debugger

    # proms = _.each @get('paths'), (path) ->
    #   path.getDisplayName()
    #   path.namePromise
    # Q.all(proms).then ->
    #   console.log "finished getting proms", proms
    #   debugger;

    # @set children: new BlockCollection
    # @set selected: new AttributeCollection
    # @set constraints: new ConstraintCollection
    #
    # @listenTo @get('children'), 'add', (evt) -> {}
    # @listenTo @get('selected'), 'all', (evt) -> @trigger "changed:selected"
    #
    #
    #



  # addSummaryFieldsToSelect: ->
  #   root = @get 'root'
  #   @get('service').fetchSummaryFields().then (results) =>
  #     results = _.map results[root], (next) =>
  #       @get('service').makePath next
  #     Q.all(results).then (final) =>
  #       @get('selected').add final
  #
  #
  # buildQuery: ->
  #   query = @get 'query'
  #   # Do I have children? Gonna need those views!
  #   @get('children').each (next) =>
  #     subviews = next.get('query').views
  #     _.each subviews, (subview) ->
  #       console.log "looking at", subview
  #       if !query.hasView subview then query.addToSelect subview
  #
  #   @get('selected').each (next) ->
  #     if !query.hasView next.id then query.addToSelect next.id
  #
  #   console.log "query is now", query
  #



# class BlockCollection extends CoreCollection
#
#   model: BlockModel

class PathsCollection extends PromiseCollection

  model: PathModel

module.exports = MenuModel
