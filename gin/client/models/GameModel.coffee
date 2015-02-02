root = exports ? this

class root.GameModel extends Backbone.Model
  defaults:
    player1: null
    player2: null
    dealer: 1
    currPlayer: null
    deck: new root.DeckModel
    discardPile: null

  initialize: =>
    @set 'player1', new root.PlayerModel
      game: @
      name: 'player 1'
    @set 'player2', new root.PlayerModel
      game: @
      name: 'player 2'
    @set 'currPlayer', @get 'player1'
    @set 'discardPile', new root.DiscardModel
      cards: []
    # @testArrays()

  onDiscard: =>
    console.log "discard button clicked"
    discardCard = ((@get 'currPlayer').get 'hand').discard()
    if discardCard
      console.log "discarding #{discardCard.getName()}"
      (@get 'discardPile').add(discardCard)
      @changeTurns()

  onDraw: =>
    console.log "draw button clicked"
    (@get 'deck').deal((@get 'currPlayer').get 'hand')

  changeTurns: =>
    if (@get 'currPlayer') == (@get 'player1')
      @set 'currPlayer', @get 'player2'
    else
      @set 'currPlayer', @get 'player1'

  testArrays: =>
    console.log 'testing arrays.'
    tmp = [1, 2, 3, 4]
    console.log "tmp = #{tmp}" # tmp = 1,2,3,4
    tmp.splice(-1, 1)
    console.log "tmp = #{tmp}" # tmp = 1,2,3
    console.log "tmp[-1] = #{tmp[-1]}" # tmp[-1] = undefined
    console.log "tmp.indexOf(0) = #{tmp.indexOf(0)}" # tmp.indexOf(69) = -1
