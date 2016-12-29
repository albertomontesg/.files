command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #fdf6e3
  font: 12px Roboto Mono
  height: 15px
  left: 10px
  overflow: hidden
  text-overflow: ellipsis
  top: 3px
  width: 500px
"""
