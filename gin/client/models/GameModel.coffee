root = exports ? this

class root.GameModel extends Backbone.Model
  defaults:
    player1: null
    player2: null
    dealer: 1
    turn: 1
    deck: new root.DeckModel

  initialize: =>
    @set 'player1', new root.PlayerModel
      game: @
      name: 'player 1'
    @set 'player2', new root.PlayerModel
      game: @
      name: 'player 2'

  getPlayer: (id) =>
    if id == 1
      return @get('player1')
    else if id == 2
      return @get('player2')
    else
      return null

  onDiscard: =>
    console.log('discard button clicked')
    