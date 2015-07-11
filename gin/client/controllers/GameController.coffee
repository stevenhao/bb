root = exports ? this

class root.GameController
  initialize: =>
    console.log('initializing game.')

    @playerModel = new root.PlayerModel
    @discardModel = new root.DiscardModel
    @_createPlayerView()
    @_createDiscardView()
    @_addListeners()

    console.log('connecting to server.')
    @_connectToServer( (player_num) =>
      console.log "player_num = #{player_num}"
      @player_num = player_num
      @_refresh()
    )


  _addListeners: => 
    # $('.drawDeck-button').on('click', @gameModel.onDrawDeck)
    # $('.drawDiscard-button').on('click', @gameModel.onDrawDiscard)
    # $('.discard-button').on('click', @gameModel.onDiscard)
    # $('.knock-button').on('click', @gameModel.onKnock)
    # $('.restart-button').on('click', @gameModel.restart)
    #put in click discard pile --> onPickUp

  _createPlayerView: =>
    player1View = new root.PlayerView
      model: @playerModel
    $('.player-1-hand').html(player1View.$el)
    # $('.player-2-hand').html(player2View.$el)

  _createDiscardView: =>
    discardView = new root.DiscardView
      model: @discardModel
    $('.discard-pile').html(discardView.$el)

  _refresh: =>
    console.log 'refreshing game state.'
    Meteor.call 'getPlayerState', @player_num, (err, data) =>
      data = JSON.parse(data)
      console.log "received [#{JSON.stringify(data)}] from server."
      console.log "setting hand to #{data.player.hand}"
      (@playerModel.get 'hand').set 'cards', data.player.hand.cards
      @playerModel.rerender()

  _connectToServer: (callback) =>
    Meteor.call 'connect', (err, data) =>
      if data >= 0
        console.log 'connected to server'
        callback(data)
      else
        console.log 'game full'