command: "date +\"%a %d %b\""

refreshFrequency: 10000

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #fdf6e3
  font: 12px Roboto Mono
  font-weight: bold
  right: 60px
  top: 3px
"""
