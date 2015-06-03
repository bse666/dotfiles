#!/bin/bash

case $1 in
    down)
        amixer -q set Master 2%- unmute
        amixer -q set Headphone unmute
        amixer -q set Speaker unmute
        herbstclient emit_hook volume
        ;;
    up)
        amixer -q set Master 2%+ unmute
        amixer -q set Headphone unmute
        amixer -q set Speaker unmute
        herbstclient emit_hook volume
        ;;
    mute)
        amixer -q set Master toggle 
        #amixer -q set Headphone toggle;
        herbstclient emit_hook volume_toggle
        ;;
esac

amixer get Master | grep '%' | dzen2 -p 1
