root = exports ? this

class root.PlayerModel extends Backbone.Model
  defaults:
    name: "player"
    hand: new root.HandModel
      cards: [] # no cards yet

  initialize: ({@game, @name}) =>
    console.log("initialized player with name=#{@name}")
    @dealHand()
  
  dealHand: =>
    for i in _.range(10)
      (@game.get 'deck').deal(@get 'hand')