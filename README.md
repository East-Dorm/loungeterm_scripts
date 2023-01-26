I wrote some scripts using xdotool to control loungeterm remotely.
The scripts I wrote are mostly about controlling youtube videos. In order of
usefulness:

yt - Give a link to a youtube video; it opens the video and fullscreens it

vu - Volume Up

vd - Volume Down

vm - Toggle Mute

sound-in - Put sound on the TV

sound-out - Put sound on outdoor speakers (must turn on amp as well)

playpause - Play or pause the youtube video on the current tab

ff - Give a link, opens in firefox

closetab - Closes tab in firefox

maxyt - Maximize the current youtube video

maxff - Maximize firefox

nt - Next Tab

pt - Previous Tab

nextvid - Click on the next autoplay video

skipad - Clicks the box to skip an ad on a fullscreened youtube video (although
    the box disappears after a bit... wat... also why isn't adblock?)

k - Sends one or more keys directly to loungeterm. You can say stuff like
    "ctrl+F4 u super+Up" to send Control+F4, then u, then Windows+Up. Look at
    the xdotool man page for more info

c - click mouse. Optionally, give it a number for mouse button

mm - move mouse to pixel (x,y). e.g. "mm 1150 700"

I've also put in some special cases in the ff and yt commands if you want to
open some common links:
- bf1 - bearforce1 videoclip
- gostore - going to the store
- bfish - breadfish (the infinite website, not the youtube)
- zombocom
- hey - HEYAYAYAYYA
- boxcar

For those, just run "yt bf1" or "ff boxcar"

*** UPDATE 2018-02-02 (hcdeshong): As requested "yeet" is now an alias for "yt yee" ***

All the scripts are in the ~/bin directory. Feel free to add more that you may
find useful. If you want to add more of these special cases, they're in the ff
script (which yt calls)

xdotool is a really cool command line tool that lets you control the mouse and
keyboard from the command line.

Documentation is here:
https://www.semicomplete.com/projects/xdotool/xdotool.xhtml and some examples
are at http://tuxradar.com/content/xdotool-script-your-mouse (although the man
page is in general super helpful, and that example page has some mistakes on
it).
