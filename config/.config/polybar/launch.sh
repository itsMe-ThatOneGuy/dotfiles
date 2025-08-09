#!/bin/bash
#
# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#polybar bar1 2>&1 | tee -a /tmp/polybar.log & disown

polybar bar1
sleep 1

echo "Polybar launched..."
