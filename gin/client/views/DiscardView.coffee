root = exports ? this

class root.DiscardView extends Backbone.View
  className: 'discard'

  # events: # this is a backbone thing
  #   'click': 'animate' # when the div is clicked, "animate" is called

  initialize: ({@model}) =>
    console.log "initializing discard view"
    @model.on 'rerender', @render
    
  render: =>
    console.log('rendering.')
    @$el.empty()
    cards = @model.get('cards')
    card = cards[cards.length - 1]
    card.set 'selected', false
    cardView = new root.CardView
      model: card
    @$el.append cardView.$el