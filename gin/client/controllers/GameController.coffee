root = exports ? this

class root.GameController
  initialize: =>
    console.log('initializing game.')

    @_createGameModel()
    @_createGameView()    


  _createGameModel: =>
    @gameModel = new root.GameModel

  _createGameView: => 
    @gameView = new root.GameView
      model: @gameModel

    @gameView.render()
    $('.game-container').html(@gameView.$el)

    $('.discard-button').on('click', @gameModel.onDiscard)