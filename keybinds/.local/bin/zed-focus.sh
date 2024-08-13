#!/bin/bash

# Check if Zed editor is running
if pgrep -x zed > /dev/null; then
    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)

    # Check if the focused window is Zed
    if [[ $focused_window == *"Zed"* ]]; then
        # Find all visible Zed windows
        zed_windows=$(xdotool search --onlyvisible --class "zed")

        # Iterate through the Zed windows
        for window in $zed_windows; do
            # Skip the currently focused window
            if [[ $window != $(xdotool getactivewindow) ]]; then
                # Focus on the next Zed window
                xdotool windowactivate $window
                exit 0
            fi
        done

        # If no other Zed window is found, start a new instance
        zed &
    else
        # If Zed is not focused, focus on the first visible Zed window
        xdotool search --onlyvisible --class "zed" windowactivate
    fi
else
    # If Zed is not running, start a new instance
    zed &
fi
