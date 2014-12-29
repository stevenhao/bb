root = exports ? this

class root.PlayerView extends Backbone.View
  initialize: ({@model}, gameModel) =>
    console.log "initializing player view with model = #{@model}"
    nametag = $ "<p>#{@model.get('name')}</p>"
    @$el.append nametag
    # deck = gameModel.get('deck')
    # handModel = new root.HandModel
    #   startingCards: deck.getTen()
    # handView = new root.HandView
    #   model: handModel
    #   gameModel: gameModel
    # @$el.append handView.$el