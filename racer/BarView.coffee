root = exports ? this

class root.BarView extends Backbone.View
 initialize: ->
    bar = $('<input/>').attr
      type: 'text'
      class: 'txtInput'
      autocorrect: 'off'
      autocapitalize: 'off'
    @$el = bar

    @$el.on 'keydown', (e) =>
      if e.keyCode == 32
        @trigger 'spacebar'
        if @$el.val() == ''
          e.preventDefault()
    
    @$el.on 'input', (e) =>
      @trigger 'typed'

    @model.on 'nextword', (e) =>
      @$el.val('')
      

#  <div class="inputbarContainer">
#    <input type="text" class="txtInput" autocorrect="off" autocapitalize="off">
#  </div>

