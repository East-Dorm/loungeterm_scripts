#!/bin/bash

source ./scripts.sh

sinkname=$(getsinkname)

if [[ -n "$1" ]]; then
    pactl set-sink-mute "$sinkname" 0
    pactl set-sink-volume "$sinkname" "$1%"
fi

NOW=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )

echo "Volume: $NOW%"
