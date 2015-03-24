root = exports ? this

class root.GameController
  initialize: =>
    console.log('initializing game.')

    @_createGameModel()
    @_createPlayerView()
    @_createDiscardView()
    @_addListeners()    


  _createGameModel: =>
    @gameModel = new root.GameModel

  _addListeners: => 
    $('.draw-button').on('click', @gameModel.onDraw)
    $('.discard-button').on('click', @gameModel.onDiscard)
    $('.knock-button').on('click', @gameModel.onKnock)
    #put in click discard pile --> onPickUp

  _createPlayerView: =>
    player1View = new root.PlayerView
      model: @gameModel.get('player1')
    player2View = new root.PlayerView
      model: @gameModel.get('player2')
    $('.player-1-hand').html(player1View.$el)
    $('.player-2-hand').html(player2View.$el)
    
  _createDiscardView: =>
    discardView = new root.DiscardView
      model: @gameModel.get('discardPile')
    $('.discard-pile').html(discardView.$el)
