root = exports ? this

class root.GameView extends Backbone.View

  className: 'game'

  initialize: ({@model}) => # the {@model} auto-assigns parameter to @model
    # placeholder = $ '<p> Placeholder for Game View </p>'
    # @$el.append(placeholder)

    player1Model = @model.getPlayer(1)
    player2Model = @model.getPlayer(2)
    player1View = new root.PlayerView
      model: player1Model
      gameModel: @model
    player2View = new root.PlayerView
      model: player2Model
      gameModel: @model
    @$el.append player1View.$el
    @$el.append player2View.$el

    # deckModel = @model.get('deck')
    # _.each deckModel.get('cards'), (cardModel) => 
    #   console.log(cardModel.get('rank'))
    #   cardView = new root.CardView
    #     model: cardModel
    #     gameModel: @model
    #   @$el.append cardView.$el

    # handModel = new root.HandModel
    #   cards: deckModel.get('cards')[...10]
    # @$el.append($('<br><br><br><br><br><br><br><br>'))
    # _.each handModel.get('cards'), (cardModel) =>
    #   cardView = new root.CardView
    #     model: cardModel
    #     gameModel: @model
    #   @ $el.append cardView.$el
