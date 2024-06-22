#!/bin/bash

# Check if Visual Studio Code is running
if pgrep -x code > /dev/null; then
    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)

    # Check if the focused window is Visual Studio Code
    if [[ $focused_window == *"Visual Studio Code"* ]]; then
        # Find all visible Visual Studio Code windows
        vscode_windows=$(xdotool search --onlyvisible --class "code")

        # Iterate through the Visual Studio Code windows
        for window in $vscode_windows; do
            # Skip the currently focused window
            if [[ $window != $(xdotool getactivewindow) ]]; then
                # Focus on the next Visual Studio Code window
                xdotool windowactivate $window
                exit 0
            fi
        done

        # If no other Visual Studio Code window is found, start a new instance
        code &
    else
        # If Visual Studio Code is not focused, focus on the first visible Visual Studio Code window
        xdotool search --onlyvisible --class "code" windowactivate
    fi
else
    # If Visual Studio Code is not running, start a new instance
    code &
fi
