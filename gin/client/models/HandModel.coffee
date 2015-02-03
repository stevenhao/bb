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
    (@get 'cards').sort()
    @trigger 'rerender'

  discard: =>
    cards = @get 'cards'
    sCard = @get 'selectedCard'
    if sCard 
      console.log "sCard exists"
      index = (cards).indexOf(sCard)
      cards.splice(index, 1)
      @trigger 'rerender'
      return sCard

