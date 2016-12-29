command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #fdf6e3
  font: 12px Roboto Mono
  font-weight: bold
  right: 10px
  top: 3px
"""
