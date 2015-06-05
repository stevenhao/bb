root = exports ? this

class root.DiscardView extends Backbone.View
  className: 'discard'

  # events: # this is a backbone thing
  #   'click': 'animate' # when the div is clicked, "animate" is called

  initialize: ({@model}) =>
    console.log "initializing discard view"
    @model.on 'rerender', @render
    
  render: =>
    # console.log('rendering.')
    @$el.empty()
    cards = @model.get('cards')
    if cards.length > 0
      cardModel = cards[cards.length - 1]
      cardView = new root.CardView
        model: cardModel
      @$el.append cardView.$el
    # @$el.style.background-image = "url(images/#{card}.jpg)"
    # img = $('<img>').attr('src', "images/#{card}.jpg")
    # @$el.html(img)