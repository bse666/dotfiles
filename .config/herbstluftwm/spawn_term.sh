#!/bin/bash
HOUR=`date +"%H"`


function sold { 
    xrdb -DSOLARIZED_DARK -merge $HOME/.Xdefaults 
}
function soll { 
    xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xdefaults
}

if [ $HOUR -lt "20" -a $HOUR -gt "10" ]
then
    soll
    urxvtc
elif [ $HOUR -gt "20" ]
then
    sold 
    urxvtc
elif [ $HOUR -gt "0" -a $HOUR -lt "10" ]
then
    sold
    urxvtc
fi
