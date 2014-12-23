root = exports ? this

class root.GameView extends Backbone.View
  initialize: ({@model}) => # the {@model} auto-assigns parameter to @model
    # placeholder = $ '<p> Placeholder for Game View </p>'
    # @$el.append(placeholder)

    player1Model = @model.getPlayer(1)
    player2Model = @model.getPlayer(2)
    player1View = new root.PlayerView
      model: player1Model
    player2View = new root.PlayerView
      model: player2Model
    @$el.append player1View.$el
    @$el.append player2View.$el

    deckModel = @model.get('deck')
    _.each deckModel.get('cards'), (cardModel) => 
      console.log(cardModel.get('rank'))
      cardView = new root.CardView
        model: cardModel
      @$el.append cardView.$el

      