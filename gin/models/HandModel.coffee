root = exports ? this

class root.HandModel extends Backbone.Model
  initialize: () =>
    @set 'cards', []

  add: (card) =>
    cards = @get 'cards'
    cards.push card
    card.on 'change:selected', () =>
      if card.get 'selected' 
        (@get 'selectedCard')?.set 'selected', false
        @set 'selectedCard', card
      else
        @set 'selectedCard', null
    @sortCards (@get 'cards')
    @trigger 'rerender'

  discard: =>
    cards = @get 'cards'
    sCard = @get 'selectedCard'
    if sCard 
      console.log "sCard exists"
      index = (cards).indexOf(sCard)
      cards.splice(index, 1)
      @trigger 'rerender'
      return sCard

  sortCards: (cards) =>
    console.log 'sorting cards'
    cards.sort (a, b) -> a.getSortingIndex() - b.getSortingIndex()
    @trigger 'rerender'

  calcDeadwood: =>
    cards = @get 'cards'
    count = 0
    tempCount = 0
    tempRank = 0
    for card in cards
      # console.log card.get 'rank'
      r = card.get 'rank'
      if r == tempRank
        tempCount++
      else
        if tempCount < 3
          count += (Math.min.apply @, [tempRank, 10]) * tempCount
        tempCount = 1
        tempRank = r
    if tempCount < 3
      count += (Math.min.apply @, [tempRank, 10]) * tempCount
    return count

