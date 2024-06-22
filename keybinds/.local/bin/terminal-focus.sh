#!/bin/bash

echo "Debug: Starting script"

# Check if GNOME Terminal is running
if wmctrl -l | grep -q "@.*:"; then
    echo "Debug: GNOME Terminal is running"

    # Get the currently focused window
    focused_window=$(xdotool getactivewindow getwindowname)
    echo "Debug: Focused window: $focused_window"

    # Check if the focused window is GNOME Terminal
    if [[ $focused_window =~ @.*: ]]; then
        echo "Debug: Focused window is GNOME Terminal"

        # Find all visible GNOME Terminal windows
        terminal_windows=($(wmctrl -l | awk '/@.*:/ {print $1}'))
        echo "Debug: Visible GNOME Terminal windows: ${terminal_windows[@]}"

        # Get the index of the currently focused GNOME Terminal window
        focused_index=$(wmctrl -l | awk -v focused="$(xdotool getactivewindow)" '/@.*:/ {if ($1 == focused) {print NR-1; exit}}')
        echo "Debug: Focused terminal index: $focused_index"

        # Calculate the index of the next terminal window
        next_index=$((($focused_index + 1) % ${#terminal_windows[@]}))
        echo "Debug: Next terminal index: $next_index"

        # Focus on the next GNOME Terminal window
        wmctrl -i -a "${terminal_windows[$next_index]}"
    else
        echo "Debug: Focused window is not GNOME Terminal"
        # If GNOME Terminal is not focused, focus on the first visible GNOME Terminal window
        window_id=$(wmctrl -l | awk '/@.*:/ {print $1; exit}')
        wmctrl -i -a $window_id
    fi
else
    echo "Debug: GNOME Terminal is not running, starting a new instance"
    # If GNOME Terminal is not running, start a new instance
    gnome-terminal &
fi

echo "Debug: Script execution completed"
