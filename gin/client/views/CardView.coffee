root = exports ? this

class root.CardView extends Backbone.View
  className: 'card'

  events:
    'click': '_onClick'

  initialize: ({@model, @gameModel}) -> # the {@model} auto-assigns parameter to @model
    card = @model.getName() # in the form AS or 4H...
    # @$el.style.background-image = "url(images/#{card}.jpg)"
    img = $('<img>').attr('src', "images/#{card}.jpg")
    @$el.html(img)
    @$el.addClass('blocked')
    @model.on 'change:selected', @_onChangeSelected
    
  _onClick: (e) =>
    @gameModel.trigger 'click', @model