root = exports ? this

class root.GameView extends Backbone.View

  className: 'game'

  initialize: ({@model}) => # the {@model} auto-assigns parameter to @model

    player1Model = @model.get 'player1'
    player2Model = @model.get 'player2'
    player1View = new root.PlayerView
      model: player1Model
      gameModel: @model
    player2View = new root.PlayerView
      model: player2Model
      gameModel: @model
    @$el.append player1View.$el
    @$el.append player2View.$el
