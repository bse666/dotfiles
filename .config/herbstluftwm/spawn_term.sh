#!/bin/bash
HOUR=`date +"%H"`


function sold { 
    xrdb -DSOLARIZED_DARK -merge $HOME/.Xdefaults 
}
function soll { 
    xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xdefaults
}

if [ $HOUR -gt "7" -a $HOUR -lt "20" ]
then
    soll
    urxvtc
else
    sold
    urxvtc
fi
