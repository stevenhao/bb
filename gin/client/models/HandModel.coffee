root = exports ? this

class root.HandModel extends Backbone.Model
  defaults:
    selectedCard: null

  add: (card) =>
    cards = @get 'cards'
    cards.push card
    card.on 'change:selected', () =>
      if card.get 'selected' 
        (@get 'selectedCard')?.set 'selected', false
        @set 'selectedCard', card
      else
        @set 'selectedCard', null
    @trigger 'rerender'

  discard: =>
    cards = @get 'cards'
    index = (cards).indexOf(@get 'selectedCard')
    cards.splice(index, 1)
    for card in cards
      console.log(card.getName())
    @trigger 'rerender'