class Dashing.Count extends Dashing.Widget
  when: null

  ready: ->
    @defaultTimeleft()
    setInterval(@startCount, 500)

  defaultTimeleft: =>
     @set('timesince', '?')

  startCount: =>
    if not @get('when')?
      return
    current_timestamp = Math.round(new Date().getTime() / 1000)
    start_timestamp = Math.round(@get('when').getTime() / 1000)
    seconds_since_start= current_timestamp - start_timestamp
    if seconds_since_start < 0
      in_name = 'in '
      ago_name = ''
      seconds_since_start = -1 * seconds_since_start 
    else
      in_name = ''
      ago_name = ''

    d = Math.floor(seconds_since_start / 86400)
    h = Math.floor((seconds_since_start-(d*86400)) / 3600)
    m = Math.floor((seconds_since_start-(d*86400)-(h*3600)) / 60)
    s = seconds_since_start-(d*86400)-(h*3600)-(m*60)
    if d > 0
      dayname = 'day'
      if d > 1
        dayname = 'days'
      @set('timesince', in_name + d + " "+dayname+" " + @formatTime(h) + ":" + @formatTime(m) + ":" + @formatTime(s) + ago_name)
    else
      @set('timesince', in_name + @formatTime(h) + ":" + @formatTime(m) + ":" + @formatTime(s) + ago_name)

  formatTime: (i) ->
    if i < 10 then "0" + i else i

  onData: (data) ->
    console.log(data)
    t = new Date(data.ux_time*1000)
    @set('when', t)