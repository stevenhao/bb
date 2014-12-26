root = exports ? this

class root.PlayerModel extends Backbone.Model
  defaults:
    name: "player"

  initialize: ({@name}) =>
    console.log("initialized player with name=#{@name}")
    @set 'name', @name