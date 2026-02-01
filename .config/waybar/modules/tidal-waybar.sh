#!/bin/bash

###
VOLUME_STEP="5"
###

# playback control
CURRENT_TITLE=$(playerctl --player=tidal-hifi metadata --format {{title}})
CURRENT_ARTIST=$(playerctl --player=tidal-hifi metadata --format {{artist}})
PLAYBACK_STATUS=$(playerctl --player=tidal-hifi status | tr '[:upper:]' '[:lower:]')

# volume control
SINK_INPUT_ID=$(pactl list sink-inputs | awk '/^Sink Input #/{id=$3} /application.process.binary = "tidal-hifi"/{print id; exit}' | tr -d '#')
VOLUME=$(pactl list sink-inputs | awk -v id="$SINK_INPUT_ID" ' $0 ~ "^Sink Input #" id "$" {found=1} found && /Volume:/ {print $5; exit}')

increase_volume() {
  pactl set-sink-input-volume $SINK_INPUT_ID +"$VOLUME_STEP"%
  dunstify -a Tidal -r 2 -t 500 -i /usr/share/icons/Tela-circle-black/scalable/apps/tidal-hifi.svg "Volume increased" "$VOLUME"
}

decrease_volume() {
  pactl set-sink-input-volume $SINK_INPUT_ID -"$VOLUME_STEP"%
  dunstify -a Tidal -r 2 -t 500 -i /usr/share/icons/Tela-circle-black/scalable/apps/tidal-hifi.svg "Volume decreased" "$VOLUME"

}
case "$1" in
  # playback
  "next")
    playerctl --player=tidal-hifi next
  ;;
  "play-pause")
    playerctl --player=tidal-hifi play-pause
  ;;
  "previous")
    playerctl --player=tidal-hifi previous
  ;;
  # volume
  "volume-up")
      increase_volume
      ;;
  "volume-down")
      decrease_volume
      ;;
  # currently playing
  *)
    if [[ $PLAYBACK_STATUS = "playing" ]]; then
      ICON=""
      echo "$ICON $CURRENT_TITLE - $CURRENT_ARTIST"
    elif [[ $PLAYBACK_STATUS = "paused" ]]; then
      ICON=""
      echo "$ICON $CURRENT_TITLE - $CURRENT_ARTIST"
    else
      echo ""
    fi
esac

