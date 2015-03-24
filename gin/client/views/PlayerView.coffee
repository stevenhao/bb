root = exports ? this

class root.PlayerView extends Backbone.View

  className: 'player'
  handView = null

  initialize: =>
    # console.log "initializing player view with model = #{@model}"
    @render()
    @model.on 'rerender', @render

  render: => 
    @$el.empty()
    nametag = $ "<p>#{@model.get('name') + ': ' + @model.get('points')}</p>"
    handView = new root.HandView
        model: @model.get 'hand'
    @$el.append nametag
    @$el.append handView.$el
