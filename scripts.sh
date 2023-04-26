#!/bin/bash

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
