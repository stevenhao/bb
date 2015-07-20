root = exports ? this
defaultPassage = "It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire. During the battle, Rebel spies managed to steal secret plans to the Empire's ultimate weapon."
    
class root.PassageModel extends Backbone.Model

  initialize: =>
    @set('passage', defaultPassage)
    @set('words', @get('passage').split(' '))
    @set('position', 0)
    @set('correct', true)

  currentWord: =>
    (@get 'words')[@get 'position']

  nextWord: =>
    @set 'position', (@get 'position') + 1
    @trigger 'nextword'
