root = exports ? this

class root.CardView extends Backbone.View
  initialize: ({@model}) -> # the {@model} auto-assigns parameter to @model
    cardText = $ "<p>#{@model.get('rank')} #{@model.get('suit')}</p>"
    @$el.append cardText