#!/bin/bash
# vim: set fileencoding=utf-8 ts=4 sts=4 sw=4 tw=80 expandtab :
# Florian Bruhin <me@the-compiler.org>

tray=trayer

if pkill -x $tray; then
    exit
fi

m=$(herbstclient list_monitors | grep FOCUS | cut -d : -f 1)
case $m in
    0|1) m=0 ;;
    2|3) m=1 ;;
esac

trayer --edge top --align right --widthtype request --heighttype pixel \
       --height 14 --expand true --tint 0x222222 --transparent true \
       --distance 152 --distancefrom right --alpha 0 --monitor $m
