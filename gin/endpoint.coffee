root = exports ? this

if (Meteor.isClient)
  $(document).ready ->
    controller = new root.GameController()
    controller.initialize()

if (Meteor.isServer)
  console.log 'starting server'
  playerCount = 0
  game = new root.GameModel()
  game.startGame()
  Meteor.methods(
    #TODO: http://stackoverflow.com/questions/10257958/server-cleanup-after-a-client-disconnects
    connect: =>
      playerCount += 1
      console.log('connected to client')
      return playerCount

    getPlayerState: (player_id) =>
      # console.log JSON.stringify(game.get 'player1')
      # game_id = 0
      ret = 
        m_name: 'stevie'
        o_name: 'caffwin'
        player: game.get 'player1'
      return JSON.stringify(ret)

  )

  console.log 'started server'