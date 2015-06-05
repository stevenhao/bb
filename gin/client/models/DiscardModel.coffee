root = exports ? this

class root.DiscardModel extends Backbone.Model

  add: (card) =>
    (@get 'cards').push card
    card.toggleSelected()
    @trigger 'rerender'

  remove: =>
    cards = @get 'cards'
    card = cards.pop()
    @trigger 'rerender'
    return card