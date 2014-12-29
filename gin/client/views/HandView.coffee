root = exports ? this

class root.HandView extends Backbone.View
  initialize: ({@model}, gameModel) =>
    console.log "initializing hand view with model = #{@model}"
    cards = @model.get('cards')
    _.each cards, (cardModel) =>
      cardView = new root.cardView
        model: cardModel
        gameModel: gameModel
    @$el.append cardView.$el