# stream capture for testing
# from http://stackoverflow.com/a/18543419/3826558

module.exports = (stream) ->
  if not console? then window.console = {}
  oldWrite = console[stream]
  buf = ''
  console[stream] = (chunk) ->
    # chunk is a string or buffer
    buf += chunk.toString()

  return {
    unhook: -> console[stream] = oldWrite
    captured: -> buf
  }
