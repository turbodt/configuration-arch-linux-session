#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit


# get info about monitors
function check_monitor () {
  xrandr --query | grep -qE "$1 connected"
}

monitor1="DP1-1"
monitor2="DP1-2"

if check_monitor $monitor1 && check_monitor $monitor2 ; then
  echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
  MONITOR="$monitor1" polybar default 2>&1 | tee -a /tmp/polybar1.log & disown
  MONITOR="$monitor2" polybar default-1280x720 2>&1 | tee -a /tmp/polybar2.log & disown
elif check_monitor $monitor1 ; then
  # Launch top-external
  echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
  polybar default 2>&1 | tee -a /tmp/polybar1.log & disown
else
  echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
  polybar default-1280x720 2>&1 | tee -a /tmp/polybar1.log & disown
fi
