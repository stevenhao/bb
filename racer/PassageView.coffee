root = exports ? this

class root.PassageView extends Backbone.View
  initialize: ({@model}) -> # the {@model} auto-assigns parameter to @model
    @$el = $('<div>').attr(
      "aria-hidden": "false"
      width: "100%"
      height: "100%"
      class: "nonHideableWords unselectable")
    @render()
    @model.on 'nextword', @render
    @model.on 'change:correct', @render

  render: =>
    makeSpan = (words) ->
      $('<span>').text words.join(' ')
    
    words = @model.get 'words'
    pos = @model.get 'position'
    words1 = words.slice(0, pos)
    words1.push("")
    words2 = words.slice(pos, pos + 1)
    words3 = words.slice(pos + 1)
    words3.unshift("")
    green = "rgb(153, 204, 0)"
    red = "red"
    color = if @model.get('correct') then green else red
    @$el.empty()
    @$el.append makeSpan(words1)
    @$el.append makeSpan(words2).css
      "text-decoration": "underline",
      "color": "#{color}"
    @$el.append makeSpan(words3)
    


