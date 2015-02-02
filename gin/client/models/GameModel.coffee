root = exports ? this

class root.GameModel extends Backbone.Model
  defaults:
    player1: null
    player2: null
    dealer: 1
    currPlayer: null
    deck: new root.DeckModel

  initialize: =>
    @set 'player1', new root.PlayerModel
      game: @
      name: 'player 1'
    @set 'player2', new root.PlayerModel
      game: @
      name: 'player 2'
    @set 'currPlayer', @player1

  onDiscard: =>
    console.log('discard button clicked')
