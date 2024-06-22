#!/bin/bash

# Check if GNOME Terminal is running
if pgrep -x gnome-terminal > /dev/null; then
    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)

    # Check if the focused window is GNOME Terminal
    if [[ $focused_window == *"Terminal"* ]]; then
        # Find all visible GNOME Terminal windows
        terminal_windows=$(xdotool search --onlyvisible --class "gnome-terminal")

        # Iterate through the GNOME Terminal windows
        for window in $terminal_windows; do
            # Skip the currently focused window
            if [[ $window != $(xdotool getactivewindow) ]]; then
                # Focus on the next GNOME Terminal window
                xdotool windowactivate $window
                exit 0
            fi
        done

        # If no other GNOME Terminal window is found, start a new instance
        gnome-terminal &
    else
        # If GNOME Terminal is not focused, focus on the first visible GNOME Terminal window
        xdotool search --onlyvisible --class "gnome-terminal" windowactivate
    fi
else
    # If GNOME Terminal is not running, start a new instance
    gnome-terminal &
fi
