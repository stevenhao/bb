root = exports ? this

class root.HandView extends Backbone.View
  className: 'hand'

  events: # this is a backbone thing
    'click': 'animate' # when the div is clicked, "animate" is called

  initialize: ({@model}) =>
    console.log "initializing hand view with model = #{@model}"
    @render()
    @model.on 'change:cards', @render
    

  render: =>
    @$el.empty()
    cards = @model.get('cards')
    for cardModel in cards
      console.log "making card view with model: #{cardModel}"
      cardView = new root.CardView
        model: cardModel
      @$el.append cardView.$el
    # @set 'width', 

  animate: =>
    console.log('animating.')
    @$el.children().each (index) -> #skinny arrow magic: @ refers to a child (an html-div-object)
      $(@).attr('hidden', true) # $(@) gives a jquery object (a wrapper around the html object)
      _.delay () =>
        $(@).attr('hidden', false)  # the jquery object let's me call .attr
        # @hidden = false # this is how i would do it without jquery
      , 50 * index + 500