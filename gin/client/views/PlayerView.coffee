root = exports ? this

class root.PlayerView extends Backbone.View

  className: 'player'

  initialize: ({@model}, gameModel) =>
    console.log "initializing player view with model = #{@model}"
    nametag = $ "<p>#{@model.get('name')}</p>"
    handView = new root.HandView
        model: @model.get 'hand'
    @$el.append nametag
    @$el.append handView.$el
    # deck = gameModel.get('deck')
    # handModel = new root.HandModel
    #   startingCards: deck.getTen()
    # handView = new root.HandView
    #   model: handModel
    #   gameModel: gameModel
    # @$el.append handView.$el