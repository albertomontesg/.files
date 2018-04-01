commands =
  focus: "echo $(/usr/local/bin/chunkc tiling::query --window name)"

command: "echo " +
         "$(#{ commands.focus}):::"

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
  window = output.split( /:::/g )[ 0 ]
  window = window.split( /–/g )[ 0 ]
  if window is "?" then window = ""
  $( "#window-output" ).text(window)

