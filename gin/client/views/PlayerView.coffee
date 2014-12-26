root = exports ? this

class root.PlayerView extends Backbone.View
  initialize: ({@model}) =>
    console.log "initializing player view with model = #{@model}"
    nametag = $ "<p>#{@model.get('name')}</p>"
    @$el.append nametag