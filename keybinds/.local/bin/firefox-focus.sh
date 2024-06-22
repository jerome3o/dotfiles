#!/bin/bash

# Check if Firefox is running
if pgrep -x firefox > /dev/null; then
    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)

    # Check if the focused window is Firefox
    if [[ $focused_window == *"Mozilla Firefox"* ]]; then
        # Find all visible Firefox windows
        firefox_windows=$(xdotool search --onlyvisible --class "firefox")

        # Iterate through the Firefox windows
        for window in $firefox_windows; do
            # Skip the currently focused window
            if [[ $window != $(xdotool getactivewindow) ]]; then
                # Focus on the next Firefox window
                xdotool windowactivate $window
                exit 0
            fi
        done

        # If no other Firefox window is found, start a new instance
        firefox &
    else
        # If Firefox is not focused, focus on the first visible Firefox window
        xdotool search --onlyvisible --class "firefox" windowactivate
    fi
else
    # If Firefox is not running, start a new instance
    firefox &
fi
