require '../shim'

_ = require 'underscore'
Backbone = require 'backbone'
PathView = require './PathView'
$ 				= Backbone.$
UIBlockModel = require '../models/UIBlockModel'



class UIBlock extends Backbone.View

  template: require '../templates/uiblock.tpl'

  tagName: "div"
  className: "uiblock-container"



  model: UIBlockModel

  events:
    "click .add": "addchild"

  initialize: ->
    # @children = new Backbone.Collection
    @listenTo @model, 'change:query', @talk
    # @listenTo @children, 'add', @renderchildren

  constructor: ->
    super

  addchild: ->
    newmodel = new UIBlockModel name: @model.get("name") + "..child"
    @model.addchild newmodel
    @render()

  renderchildren: ->
    @render()
    # childcontainer = @$el.find(".children-entities");
    # console.log "childcontainer is", childcontainer.length
    # debugger;
    # @children.each (nextmodel) ->
    #   newview = new UIBlock model: nextmodel
    #   res = newview.render()
    #   console.log "res is", res
    #   console.log "newview is", newview.renderchildren()
    #   childcontainer.append res

  render: ->



    results = @template model: @model

    @$el.html results

    childhtml = []
    mychildren = @model.get 'children'
    _.each mychildren, (nextchild) =>
      console.log "UIBlock"
      console.log UIBlock
      view = new UIBlock model: nextchild
      ror = view.render()
      debugger;
      childhtml.push ror

    console.log "childhtml", childhtml
    childcontainer = @$el.find(".children-entities").append childhtml

    @$el




    # console.log "children"







module.exports = UIBlock
