root = exports ? this

class root.DeckModel extends Backbone.Model
  defaults:
    cards: []

  initialize: =>
    console.log('deck initialized')
    cards = @get('cards')
    for suit in _.range(4) # 0 spades, 1 hearts, 2 clubs, 3 diamonds
    	for rank in _.range(1, 14)
    		cards.push new root.CardModel
    			rank: rank
    			suit: suit
    @shuffle()

  shuffle: =>
    console.log('shuffle')
    cards = @get('cards')
    for index in _.range(52)
      newIndex = Math.floor(Math.random() * (index + 1))
      tempCard = cards[newIndex]
      cards[newIndex] = cards[index]
      cards[index] = tempCard
      
  getTen: =>
    console.log('getting first ten cards of deck')
    return @get('cards')[0:10]