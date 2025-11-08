#!/bin/bash

# get sink id
SINK_INPUT_ID=$(pactl list sink-inputs | awk '/^Sink Input #/{id=$3} /application.name = "Tidal HiFi"/{print id; exit}' | tr -d '#')
VOLUME=$(pactl list sink-inputs | awk -v id="$SINK_INPUT_ID" ' $0 ~ "^Sink Input #" id "$" {found=1} found && /Volume:/ {print $5; exit}')

increase_volume() {
  pactl set-sink-input-volume $SINK_INPUT_ID +5%
  dunstify -a Tidal -r 2 -t 500 -i /usr/share/icons/Tela-circle-black/scalable/apps/tidal-hifi.svg "Volume increased" "$VOLUME"
}

decrease_volume() {
  pactl set-sink-input-volume $SINK_INPUT_ID -5%
  dunstify -a Tidal -r 2 -t 500 -i /usr/share/icons/Tela-circle-black/scalable/apps/tidal-hifi.svg "Volume decreased" "$VOLUME"
}

case "$1" in
    "up")
        increase_volume
        ;;
    "down")
        decrease_volume
        ;;
    *)
        exit 1
        ;;
esac
