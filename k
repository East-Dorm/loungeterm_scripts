#! /bin/bash
get_code() {
    eval "k=\$$1"
    case "${k^^}" in
        RETURN) eval "$1='enter'" ;;
        CTRL) eval "$1='leftctrl'" ;;
        SHIFT) eval "$1='leftshift'" ;;
        ALT) eval "$1='leftalt'" ;;
        XF86AUDIORAISEVOLUME) eval "$1='VOLUMEUP'" ;;
        XF86AUDIOLOWERVOLUME) eval "$1='VOLUMEDOWN'" ;;
    esac
}

for arg in "$@"; do
    get_code arg
    ydotool key $(grep -Pi "KEY_$arg\t" /usr/include/linux/input-event-codes.h | grep -oP "(0x)?\d+"):1
done
for arg in "$@"; do
    get_code arg
    ydotool key $(grep -Pi "KEY_$arg\t" /usr/include/linux/input-event-codes.h | grep -oP "(0x)?\d+"):0
done
