#!/bin/bash

# Query if firefox is full-screen
# We do this by checking the dimensions of the firefox window:
# - If fullscreen, will be screen dimensions (for now, we assume 1920x1080)
# - If not fullscreen, will be smaller (must leave space for bar at top and side)
# Notice: if firefox is closed, will output false
is_ff_fullscreen() {
    dims="$(DISPLAY=:0 xdotool search --onlyvisible --name firefox getwindowgeometry | grep 'Geometry' | grep -o '[0-9]*x[0-9]*')"
    [ "$dims" = "1920x1080" ]
}

# If youtube is full-screen, do nothing. If youtube is open and not full-screen,
# put it in full-screen mode.
make_yt_fullscreen() {
    is_ff_fullscreen || (k f; sleep 0.5)
}

# If youtube is windowed, do nothing. If youtube is open and full-screen, put it
# in windowed mode.
make_yt_windowed() {
    is_ff_fullscreen && (k f; sleep 0.5)
}

getsinkname() {
    pacmd list-sinks | sed '3q;d' | sed 's/^\tname: <\(.*\)>$/\1/'
}

# Print the given text, wrapping it to the width specified in the
# environment variable $width (which defaults to whichever is lower
# of 80 and the terminal width)
width="$(tput cols)"
width="$((width<80 ? width : 80))"
wprint() {
  echo "$@" | fold -w "$width" -s
}
