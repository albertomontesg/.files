
commands =
  mode: "echo $(/usr/local/bin/chunkc tiling::query --desktop mode)"
  spaces: "echo $(/usr/local/bin/chunkc tiling::query --desktops-for-monitor $(/usr/local/bin/chunkc tiling::query --monitor id))"
  focused: "echo $(/usr/local/bin/chunkc tiling::query --desktop id)"

command: "echo " +
         "$(#{ commands.mode }):::" +
         "$(#{ commands.spaces }):::" +
         "$(#{ commands.focused })"

refreshFrequency: 1000

render: ( ) ->
  """
  <div class="container" id="window">
    <div class="space" id="window">
      <div class="widg">
        <div class="icon-container">
          <i class="icon fas fa-bars"></i>
        </div>
        [<span id="space-mode" class="output"></span>]
      </div>
      <div class="spaces-container output" id="space-spaces">

      </div>
    </div>
  </div>
  """

iconMapping:
  "0" : "fas fa-desktop"
  "1" : "fab fa-chrome"
  "2" : "fab fa-chrome"
  "3" : "fas fa-terminal"
  "4" : "fas fa-terminal"
  "5" : "fas fa-envelope"
  "6" : "fab fa-telegram-plane"
  "7" : "fas fa-music"

getIcon: (space) ->
  if space of @iconMapping
    @iconMapping[space]
  else
    @iconMapping["0"]

update: ( output, domEl ) ->
  output= output.split(/:::/g)
  mode = output[0]
  spaces = output[1]
  focused = output[2]

  spacesNumbers = spaces.split(/\ /g)
  spacesHtml = ""

  $( "#space-spaces").empty()
  for space in spacesNumbers
    spaceTemplate = """
      <div class="widg space" id=space-#{space}>
        <i class="icon #{ @getIcon(space) }"></i>
      </div>
    """
    $( "#space-spaces").append(spaceTemplate)

  $( "#space-#{focused}").addClass('space-focused')

  $( "#space-mode" ).text(mode)
