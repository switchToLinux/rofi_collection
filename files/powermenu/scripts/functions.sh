#!/usr/bin/env bash

# Author: Awkee
# Description: This script is used to powermenu,define common used functions
#

# CMDs
up_time="`uptime -p 2>/dev/null | sed -e 's/up //g'`"
[[ -n "${up_time}" ]] || up_time="`uptime | awk -F'[，,]' '{print $1 }'|awk '{ $1=""; print $0 }'`"
export uptime=${up_time}
export host=`hostname`


function lock_screen() {
    if [[ -x ~/.config/polybar_themes/scripts/i3lock_bar.sh ]] ; then
        sleep 1 && ~/.config/polybar_themes/scripts/i3lock_round.sh
    elif which i3lock >/dev/null 2>&1; then
       i3lock
    elif which i3lock-fancy >/dev/null 2>&1; then
        i3lock-fancy
    elif which betterlockscreen >/dev/null 2>&1; then 
        betterlockscreen -l
    fi
}