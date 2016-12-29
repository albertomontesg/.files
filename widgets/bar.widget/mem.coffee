command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 3000 # ms

render: (output) ->
  "mem <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #fdf6e3
  font: 12px Roboto Mono
  right: 220px
  top: 3px
  span
    color: #05d0f8
"""
