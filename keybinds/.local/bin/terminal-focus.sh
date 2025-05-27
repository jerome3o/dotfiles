#!/bin/bash

echo "Debug: Starting script"

# Check if GNOME Terminal is running using wmctrl -l -p -x for reliable detection
if wmctrl -l -p -x | grep -q "gnome-terminal-server.Gnome-terminal"; then
    echo "Debug: GNOME Terminal is running"

    # Get the currently focused window ID
    focused_window_id=$(printf "0x%08x" $(xdotool getactivewindow))
    echo "Debug: Focused window ID: $focused_window_id"

    # Check if the focused window is GNOME Terminal using wmctrl -l -p -x
    if wmctrl -l -p -x | grep "$focused_window_id" | grep -q "gnome-terminal-server.Gnome-terminal"; then
        echo "Debug: Focused window is GNOME Terminal"

        # Find all visible GNOME Terminal windows
        terminal_windows=($(wmctrl -l -p -x | grep "gnome-terminal-server.Gnome-terminal" | awk '{print $1}'))
        echo "Debug: Visible GNOME Terminal windows: ${terminal_windows[@]}"

        # Get the index of the currently focused GNOME Terminal window
        focused_index=-1
        for i in "${!terminal_windows[@]}"; do
            if [[ "${terminal_windows[$i]}" == "$focused_window_id" ]]; then
                focused_index=$i
                break
            fi
        done
        echo "Debug: Focused terminal index: $focused_index"

        # Calculate the index of the next terminal window
        if [[ $focused_index -ge 0 ]]; then
            next_index=$((($focused_index + 1) % ${#terminal_windows[@]}))
            echo "Debug: Next terminal index: $next_index"

            # Focus on the next GNOME Terminal window
            wmctrl -i -a "${terminal_windows[$next_index]}"
        else
            echo "Debug: Could not find focused terminal in list, focusing first terminal"
            wmctrl -i -a "${terminal_windows[0]}"
        fi
    else
        echo "Debug: Focused window is not GNOME Terminal"
        # If GNOME Terminal is not focused, focus on the first visible GNOME Terminal window
        window_id=$(wmctrl -l -p -x | grep "gnome-terminal-server.Gnome-terminal" | awk '{print $1; exit}')
        wmctrl -i -a $window_id
    fi
else
    echo "Debug: GNOME Terminal is not running, starting a new instance"
    # If GNOME Terminal is not running, start a new instance
    gnome-terminal &
fi

echo "Debug: Script execution completed"
