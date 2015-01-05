root = exports ? this

class root.PlayerModel extends Backbone.Model
  defaults:
    name: "player"
    hand: null

  initialize: ({@game, @name}) =>
    console.log("initialized player with name=#{@name}")
    @dealHand()
  
  dealHand: =>
    @set 'hand', new HandModel
      cards: []
    for i in _.range(10)
      (@game.get 'deck').deal(@get 'hand')