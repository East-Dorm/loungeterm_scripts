#!/bin/bash

button="$1"

[[ -z $button ]] && button=1

WAYLAND_DISPLAY=wayland-0 ydotool click "$button"
