root = exports ? this

class root.DiscardModel extends Backbone.Model

  add: (card) =>
    (@get 'cards').push card.getName()
    @trigger 'rerender'