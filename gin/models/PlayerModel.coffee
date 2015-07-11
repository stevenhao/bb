root = exports ? this

class root.PlayerModel extends Backbone.Model
  defaults:
    name: 'no_name'
    points: 0

  initialize: =>
    console.log("initialized player with name #{@get 'name'}")
    @set 'hand', new root.HandModel

  rerender: =>
    @trigger 'rerender'