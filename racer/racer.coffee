root = exports ? this

if Meteor.isClient
  console.log 'starting.'

  $(document).ready ->
    # game model
    barModel = new root.BarModel()
    passageModel = new root.PassageModel()
    timerModel = new root.TimerModel()

    barModel.on 'change:text', (e) =>
      text = barModel.get 'text'
      target = passageModel.currentWord()
      passageModel.set('correct', target.startsWith(text))

    # game view
    barView = new root.BarView
      model: barModel

    barView.on 'typed', (e) =>
      if not timerModel.get('started')
        timerModel.startClock()
      text = barView.$el.val()
      barModel.set 'text', text
      timerModel.set 'curChars', text.length
      timerModel.trigger 'update'

    barView.on 'spacebar', (e) =>
      text = barModel.get 'text'
      target = passageModel.currentWord()
      if target.length and $.trim(text) == target
        passageModel.nextWord()
        barModel.nextWord()
        timerModel.nextWord(target)

    passageView = new root.PassageView
      model: passageModel

    passageView2 = new root.PassageView
      model: passageModel

    timerView = new root.TimerView
      model: timerModel

    # html endpoint
    $('.passageContainer').html(passageView.$el)
    $('.inputbarContainer').html(barView.$el)

