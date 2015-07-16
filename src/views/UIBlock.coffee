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
  box: null



  model: UIBlockModel

  events:
    "click .add:first-of-type": "addchild"
    "click .remove": "deleteme"
    "click .visible": "togglevis"

  initialize: ->
    # @children = new Backbone.Collection
    @listenTo @model, 'change:query', @talk
    # @listenTo @children, 'add', @renderchildren

  constructor: ->
    super

  deleteme: ->
    @remove();
    @unbind();
    @model.destroy();

  togglevis: (evt) ->
    console.log "toggling vis"
    evt.stopPropagation();
    bg = @$el.find(".contents")
    debugger;
    @$el.find(".contents").toggleClass "disabled"



  addchild: (evt) ->
    evt.stopPropagation();
    # Get the name from the input
    name = @$el.find("input").val()
    console.log "NAME IS", name

    newmodel = new UIBlockModel name: name
    @model.addchild newmodel
    view = new UIBlock model: newmodel
    @box.append view.render()
    # @render()

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

    if @model.get 'name' is "Ace..child" then console.log "RENDERING SECOND"



    results = @template model: @model
    @$el.html results

    addbtn = @$el.find('.add')
    @listenTo addbtn, 'click', -> alert "test"

    console.log "addtn.length", addbtn.length

    console.log @$el.html()
    @box = @$el.find(".children-entities").append childhtml

    childhtml = []
    mychildren = @model.get 'children'
    _.each mychildren, (nextchild) =>
      view = new UIBlock model: nextchild
      ror = view.render()
      childhtml.push ror

    console.log "childhtml", childhtml
    childcontainer = @$el.find(".children-entities").append childhtml

    @$el




    # console.log "children"







module.exports = UIBlock
