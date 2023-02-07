#!/bin/bash
psgrep xcape | xargs kill
xkbcomp ~/.xkbmap $DISPLAY
xcape -e 'Shift_L=parenleft;Shift_R=parenright'
