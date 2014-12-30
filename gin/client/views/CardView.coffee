root = exports ? this

class root.CardView extends Backbone.View
  className: 'card'

  events:
    'click': '_onClick'

  initialize: ({@model}) => # the {@model} auto-assigns parameter to @model
    card = @model.getName() # in the form AS or 4H...
    # @$el.style.background-image = "url(images/#{card}.jpg)"
    img = $('<img>').attr('src', "images/#{card}.jpg")
    @$el.html(img)
    @$el.addClass('blocked')

  _onClick: =>
    @model.trigger 'click'