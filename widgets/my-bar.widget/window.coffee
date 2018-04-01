commands =
  focus: "echo $(/usr/local/bin/chunkc tiling::query --window tag)"

command: "echo $(#{ commands.focus })"

refreshFrequency: 1000

render: ( ) ->
  """
     <div class="container" id="window">
      <div class="widg" id="window">
        <span class="output" id="window-output"></span>
      </div>
    </div>
  """

update: ( output, domEl ) ->
  window = output
  # In case there is no windows or chunkwm can not fetch its name
  if window[0] is "?" then window = ""
  $( "#window-output" ).text(window)
