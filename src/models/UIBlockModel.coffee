Q         = require 'q'
_         = require 'underscore'
CoreModel  = require './CoreModel'
PathModel = require './PathModel'






class UIBlockModel extends CoreModel

  defaults: ->
    children: []
    name: "Joker"
    root: false
    views = []
    query: null
    paths: []


  initialize: ->
    console.log "UIBlockModel initialized."

  constructor: (opts) ->
    super
    console.log "UIBlockModel constructed.", @
    @get('service').query().then (query) =>
      @set query: query
      @addSummaryFields()


  runQuery: ->
    console.log "running query", @get('query')
    @get('query').count().then (count) ->
      console.log "count is", count
    @get('service').rows(@get('query')).then (results) ->
      console.log 'results', results
    @get('query').summarize("Gene.primaryIdentifier").then (summary) ->
      console.log "primaryIdentifier total is", summary
    @get('query').summarize("Gene.symbol").then (summary) ->
      console.log "symbol total is", summary

  setLookupConstraint: (value) ->
    console.log "adding value to constraint", value

    constraints = @get('query').constraints
    _.each constraints, (constraint) =>
      if constraint.op is 'LOOKUP'
        console.log "removing a constraint"
        @get('query').removeConstraint constraint

    if !!value then @get('query').addConstraint
        path: "Gene"
        op: "LOOKUP"
        value: value


  talk: (evt) ->
    console.log @get('name') + ' is talking'
    @trigger 'change', @
    # if @get('root') is true
    #   console.log "root", @
    #   debugger;
    #   console.log "message got to parent", @
    #   debugger;

  addchild: (child) ->
    console.log "got child", child
    @listenTo child, "change", @talk
    @get('children').push child
    console.log "children length is now", @get('children').length



  addPaths: (strpaths = []) ->
    console.log 'addPaths called', strpaths
    # Turn our string paths into promises for imPaths
    promises = _.map strpaths, (n) => @get('service').makePath n

    # Create PathModels for the settled imPaths
    Q.all(promises).then (impaths) =>

      console.log "IN HERE"
      _.each impaths, (impath) =>
        @get('paths').push new PathModel impath
      # @get('paths').push (new PathModel impath) for impath in impaths
      console.og "addPaths finished with", @

  addSummaryFields: ->
    # Get our default fields
    @get('service').fetchSummaryFields().then (results) =>
      @addPaths results['Gene']






    # # Get the summary fields from the service
    #
    #
    #   # Create an imPath for each
    #   promises = _.map results['Gene'], (n) => @get('service').makePath n
    #
    #
    #   # Tell our paths to get their display name
    #   # and attach the paths to the model
    #   Q.all(promises).then (paths) =>
    #     _.each paths, (path) ->
    #       testModel = new PathModel path
    #       console.log "testModel", testModel
    #     # pathmodel = new PathModel
    #     #     path.displayName = name
    #     #
    #     # @set paths: paths
    #
    #
    #
    #
    #
    #   @get('service').makePath('Gene.primaryIdentifier').then (path) ->
    #     path.getDisplayName().then (name) ->
    #       console.log 'name', name
    #   @get('query').select results['Gene']
    #   console.log "QUERY IS", @get('query')



module.exports = UIBlockModel
