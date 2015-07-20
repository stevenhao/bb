root = exports ? this

class root.TimerView extends Backbone.View
  # <div class="rankPanelWpm rankPanelWpm-user" style="white-space: normal;">
  #                   0 wpm
  #                 </div>
  initialize: ({@model}) -> # the {@model} auto-assigns parameter to @model
    @$el = $('<span>')
    @model.on 'update', @render

  render: =>
    wpm = @model.getWpm()
    console.log "wpm: #{wpm}"
    @$el.empty()
    @$el.text "#{wpm} wpm"
    console.log @$el
    $('.rankPanelWpm').html(@$el)