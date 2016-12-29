command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  "cpu <span>#{output}%</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #fdf6e3
  font: 12px Roboto Mono
  right: 300px
  top: 3px
  span
    color: #05d0f8
"""
