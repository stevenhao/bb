root = exports ? this

class root.CardModel extends Backbone.Model
  # defaults:
  #   rank: null
  #   suit: null

  initialize: ({@rank, @suit}) =>
    console.log('hi')