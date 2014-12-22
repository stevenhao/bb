root = exports ? this

class root.PlayerView extends Backbone.View
  initialize: ({@model}) =>
    console.log "initializing player view with model = #{@model}"
    nametag = $ "<div><p>#{@model.get('name')}</p></div>",
      class: 'nametag'
    @$el.append nametag