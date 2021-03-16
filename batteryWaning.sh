#!/usr/bin/env bash

synclient ClickFinger3=2
synclient TapButton3=2
synclient PalmDetect=1

while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    if on_ac_power; then
        if [ "$battery_percent" -gt 80 ]; then
            notify-send -i "$PWD/batteryfull.png" "Battery full." "Level: ${battery_percent}% "
        fi
    fi
    if [ "$battery_percent" -lt 20 ]; then
            notify-send -i "$PWD/batteryfull.png" "Battery low." "Level: ${battery_percent}% "
    fi

    sleep 300 # (5 minutes)
done
