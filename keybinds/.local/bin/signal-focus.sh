#!/bin/bash

# Check if Signal is running
if pgrep -x signal-desktop > /dev/null; then
    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)

    # Find Signal window matching either "Signal" or "Signal (*)"
    signal_window=$(xdotool search --onlyvisible --name "^Signal( \([0-9]+\))?$")

    # If Signal is focused, minimize it
    if [[ "$focused_window" =~ ^Signal(\s\([0-9]+\))?$ ]]; then
        xdotool windowminimize $signal_window
    else
        # If Signal exists but isn't focused, focus it
        xdotool windowactivate $signal_window
    fi
else
    # If Signal isn't running, start it
    /usr/bin/signal-desktop &
fi
