root = exports ? this

class root.PlayerView extends Backbone.View

  className: 'player'

  initialize: =>
    console.log "initializing player view with model = #{@model}"
    nametag = $ "<p>#{@model.get('name')}</p>"
    handView = new root.HandView
        model: @model.get 'hand'
    @$el.append nametag
    @$el.append handView.$el