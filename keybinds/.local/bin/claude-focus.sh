#!/bin/bash

# Check if Claude is running
if pgrep -x claude > /dev/null; then
    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)
    
    # Find Claude window with exact match
    claude_window=$(xdotool search --onlyvisible --name "^Claude$")
    
    # If Claude is focused, minimize it
    if [[ "$focused_window" == "Claude" ]]; then
        xdotool windowminimize $claude_window
    else
        # If Claude exists but isn't focused, focus it
        xdotool windowactivate $claude_window
    fi
else
    # If Claude isn't running, start it
    /usr/bin/claude &
fi