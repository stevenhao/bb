root = exports ? this

class root.GameModel extends Backbone.Model
  defaults:
    player1: null
    player2: null
    dealer: 1
    currPlayer: null
    deck: new root.DeckModel
    discardPile: null
    canDraw: null

  initialize: =>
    @set 'player1', new root.PlayerModel
      game: @
      name: 'player 1'
    @set 'player2', new root.PlayerModel
      game: @
      name: 'player 2'
    @set 'currPlayer', @get 'player1'
    @set 'othPlayer', @get 'player2'
    @set 'discardPile', new root.DiscardModel
      cards: []
    @set 'canDraw', true
    # @testArrays()

  onDiscard: =>
    console.log "discard button clicked"
    discardCard = ((@get 'currPlayer').get 'hand').discard()
    if discardCard
      console.log "discarding #{discardCard.getName()}"
      (@get 'discardPile').add(discardCard)
      @changeTurns()

  onDraw: =>
    console.log "#{@get 'canDraw'}"
    if @get 'canDraw'
      console.log "draw button clicked"
      (@get 'deck').deal((@get 'currPlayer').get 'hand')
      @set 'canDraw', false

  # onPickUp: =>
  #   console.log 'on pick up'
  #   if @get 'canDraw'
  #     console,log "picked up from discard"
  #     lastIndex = (@get 'discardPile').length - 1
  #     card = (@get 'discardPile')[lastIndex]
  #     ((@get 'currPlayer').get 'hand').add(card)
  #     @set 'discardPile', (@get 'discardPile')[0...lastIndex]
  #     @set 'canDraw', false

  onKnock: => 
    console.log "knock button clicked"
    currDeadwood = ((@get 'currPlayer').get 'hand').calcDeadwood()
    if currDeadwood <= 10
      othDeadwood = ((@get 'othPlayer').get 'hand').calcDeadwood()
      if currDeadwood == 0 or currDeadwood < othDeadwood
        winner = @get 'currPlayer'
        add = othDeadwood - currDeadwood
        if currDeadwood == 0
          add += 25
      else
        winner = @get 'othPlayer'
        add = currDeadwood - othDeadwood
        if othDeadwood == 0
          add += 25
      winner.set 'points', (winner.get 'points') + add
      console.log add
      console.log winner.get 'points'
      @trigger 'rerender'
    else
      console.log 'invalid knock'
    (@get 'currPlayer').rerender()

  changeTurns: =>
    if (@get 'currPlayer') == (@get 'player1')
      @set 'currPlayer', @get 'player2'
      @set 'othPlayer', @get 'player1'
    else
      @set 'currPlayer', @get 'player1'
      @set 'othPlayer', @get 'player2'
    @set 'canDraw', true
