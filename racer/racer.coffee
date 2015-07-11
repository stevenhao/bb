root = exports ? this

if Meteor.isClient
  console.log 'starting.'
  $(document).ready ->
    # game model
    barModel = new root.BarModel()
    passageModel = new root.PassageModel()

    barModel.on 'change:text', (e) =>
      text = barModel.get 'text'
      target = passageModel.currentWord()

    # game view
    barView = new root.BarView
      model: barModel

    barView.on 'typed', (e) =>
      barModel.set 'text', barView.$el.val()

    barView.on 'spacebar', (e) =>
      console.log 'spacebar'
      text = barModel.get 'text'
      target = passageModel.currentWord()
      if target.length and $.trim(text) == target
        passageModel.nextWord()
        barModel.nextWord()

    passageView = new root.PassageView
      model: passageModel

    # html endpoint
    $('.gameView').append(passageView.$el)
    $('.gameView').append(barView.$el)
