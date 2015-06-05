root = exports ? this

class root.DiscardModel extends Backbone.Model

  add: (card) =>
    (@get 'cards').push card
    @trigger 'rerender'

  remove: =>
    cards = @get 'cards'
    # card = cards[cards.length - 1]
    card = cards.pop()
    # cards.splice(cards.length - 1, 1)
    @trigger 'rerender'
    return card