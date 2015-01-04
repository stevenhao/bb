root = exports ? this

class root.CardView extends Backbone.View
  className: 'card'

  events:
    'click': '_onClick'

  initialize: ({@model}) => # the {@model} auto-assigns parameter to @model
    @$el.addClass('blocked')
    @model.on 'change:selected', @render
    @render()

  render: =>
    console.log('rendering.')
    # perhaps to give selected cards the "raised" feel, we will add a whitespace block element above the image for unselected cards
    # and put the block for selected cards below the image for selected cards

    card = @model.getName() # in the form AS or 4H...
    # @$el.style.background-image = "url(images/#{card}.jpg)"
    img = $('<img>').attr('src', "images/#{card}.jpg")
    block = $('<div>')
    block.addClass('buffer')

    @$el.html('')
    if @model.get('selected')
      @$el.append(img)
      @$el.append(block)
    else
      @$el.append(block)
      @$el.append(img)

  _onClick: =>
    @model.toggleSelected()