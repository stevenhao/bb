root = exports ? this

class root.HandModel extends Backbone.Model
  defaults:
    cards: []

  sort: =>
    console.log('sort')
    cards = @get('cards')
    for i in _.range(1, 10)
      tempCard = cards[i]
      j = i - 1
      while j >= 0 and @before(tempCard, cards[j])
        cards[j + 1] = cards[j]
        j -= 1
      cards[j + 1] = tempCard

  before: (card1, card2) =>
    if card1.get('rank') < card2.get('rank')
      return true
    if card1.get('rank') == card2.get('rank') and card1.get('suit') > card2.get('suit')
      return true
    return false

  add: (card) =>
    cards = @get('cards')
    cards.push card
    @sort()

  discard: (card) =>
    cards = @get('cards')
    index = cards.indexOf(card)
    cards.splice(index, 1)