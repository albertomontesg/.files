command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 5000 # ms

render: (output) ->
  "<i>⚡</i>#{output}"

style: """
  -webkit-font-smoothing: antialiased
  font: 12px Roboto Mono
  top: 4px
  right: 145px
  color: #f7ed01
  span
    color: #9C9486
"""
