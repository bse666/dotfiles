#!/bin/bash
HOUR=`date +"%H"`


function sold { 
    xrdb -DSOLARIZED_DARK -merge $HOME/.Xdefaults 
}
function soll { 
    xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xdefaults
}

if [ $HOUR -lt "20" -a $HOUR -gt "8" ]
then
    soll
    urxvtc
elif [ $HOUR -gt "20" ]
then
    sold 
    urxvtc
elif [ $HOUR -gt "0" -a $HOUR -lt "8" ]
then
    sold
    urxvtc
fi
