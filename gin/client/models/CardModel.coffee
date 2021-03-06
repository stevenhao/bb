root = exports ? this

class root.CardModel extends Backbone.Model
  defaults:
     rank: null
     suit: null
     selected: false
     inDiscardPile: false

  rankNames:
    1: 'A'
    2: '2'
    3: '3'
    4: '4'
    5: '5'
    6: '6'
    7: '7'
    8: '8'
    9: '9'
    10: 'T'
    11: 'J'
    12: 'Q'
    13: 'K'

  suitNames: # 0 spades, 1 hearts, 2 clubs, 3 diamonds
    0: 'S'
    1: 'H'
    2: 'C'
    3: 'D'

  getName: =>
    return @_getRankName() + @_getSuitName()

  _getRankName: =>
    return @rankNames[@get 'rank']

  _getSuitName: =>
    return @suitNames[@get 'suit']

  getSortingIndex: =>
    return (@get 'rank') * 4 + (@get 'suit')

  toggleSelected: =>
    if not @get 'inDiscardPile'
      if @get 'selected'
        @set 'selected', false
      else
        @set 'selected', true
    console.log('clicked')

  inDiscard: =>
    @set 'selected', false
    @set 'inDiscardPile', true