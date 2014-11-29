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

  onDiscard: =>
    console.log "discard button clicked"
    discardCard = ((@get 'currPlayer').get 'hand').discard()
    if discardCard
      console.log "discarding #{discardCard.getName()}"
      (@get 'discardPile').add(discardCard)
      @changeTurns()

  onDrawDeck: =>
    console.log "#{@get 'canDraw'}"
    if @get 'canDraw'
      console.log "draw from deck button clicked"
      (@get 'deck').deal(((@get 'currPlayer').get 'hand'), true)
      @set 'canDraw', false

  onDrawDiscard: =>
    console.log "#{@get 'canDraw'}"
    if @get 'canDraw'
      console.log "draw from discard button clicked"
      card = (@get 'discardPile').remove()
      card.set 'inDiscardPile', false
      ((@get 'currPlayer').get 'hand').add(card)
      card.toggleSelected()
      @set 'canDraw', false

  # onPickUp: => Steven did you write this? sorry I saw it after writing the previous function
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
      @endGame()
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

  restart: =>
    @set 'deck', new root.DeckModel
    (@get 'player1').dealHand()
    (@get 'player2').dealHand()

  endGame: =>
    player1Points = (@get 'player1').points
    player2Points = (@get 'player2').points
    if player1Points <= 100 and player2Points < 100
      @restart()
    else
      if player1Points > 100
        console.log 'player 1 wins'
      else
        console.log 'player 2 wins'
