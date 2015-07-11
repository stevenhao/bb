root = exports ? this
    
class root.BarModel extends Backbone.Model
  defaults:
    text: ""
  
  nextWord: =>
    @trigger 'nextword'