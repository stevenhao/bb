root = exports ? this
    
class root.TimerModel extends Backbone.Model
  defaults:
    doneChars: 0
    curChars: 0

  nextWord: (word) =>
    @set('curChars', 0)
    @set('doneChars', @get('doneChars') + word.length + 1)
  
  getTime: =>
    # TODO syscall, get # minutes (float)?
    millis = new Date().getTime()
    console.log "time: #{millis}"
    return millis / 60000.0
 
  getWpm: =>
    round = (num) ->
      ~~num
    if @get('started')
      curTime = if @get('stopped') then @get('stopTime') else @getTime()
      time = curTime - @get('startTime')
      # time = 1 # mock for checking wpm computation
      chars = @get('curChars') + @get('doneChars')
      console.log "chars: #{chars}, time: #{time}"
      cpm = chars / time
      wpm = cpm / 5
      return round(wpm)
    else
      0

  startClock: =>
    @set('startTime', @getTime())
    @set('started', true)

  stopClock: =>
    @set('stopTime', @getTime())
    @set('stopped', true)