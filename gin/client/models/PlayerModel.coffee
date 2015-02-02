root = exports ? this

class root.PlayerModel extends Backbone.Model
  defaults:
    name: "player"
    hand: null

  initialize: =>
    console.log("initialized player with name #{@get 'name'}")
    @dealHand()
  
  dealHand: =>
    @set 'hand', new HandModel
      cards: []
    for i in _.range(10)
      ((@get 'game').get 'deck').deal(@get 'hand')