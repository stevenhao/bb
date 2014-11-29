root = exports ? this

class root.GameView extends Backbone.View

  className: 'players'

  initialize: () =>
    discardModel = @model.get 'discardPile'
    player1Model = @model.get 'player1'
    player2Model = @model.get 'player2'
    discardView = new root.DiscardView
      model: discardModel
    player1View = new root.PlayerView
      model: player1Model
    player2View = new root.PlayerView
      model: player2Model
    @$el.append discardView.$el
    @$el.append player1View.$el
    @$el.append player2View.$el
