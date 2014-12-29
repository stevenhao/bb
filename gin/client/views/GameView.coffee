root = exports ? this

class root.GameView extends Backbone.View

  events: # this is a backbone thing
    'click': 'animate' # when the div is clicked, "animate" is called

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
        gameModel: @model
      @$el.append cardView.$el

  animate: =>
    console.log('animating.')
    @$el.children().each (index) -> #skinny arrow magic: @ refers to a child (an html-div-object)
      $(@).attr('hidden', true) # $(@) gives a jquery object (a wrapper around the html object)
      _.delay () =>
        $(@).attr('hidden', false)  # the jquery object let's me call .attr
        # @hidden = false # this is how i would do it without jquery
      , 50 * index + 500