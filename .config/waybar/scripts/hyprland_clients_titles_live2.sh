#!/usr/bin/env bash

print_clients() {
    current_ws=$(hyprctl activeworkspace -j | jq '.id')
    focused_addr=$(hyprctl activewindow -j | jq -r '.address')

    hyprctl clients -j | jq --argjson ws "$current_ws" --arg focused "$focused_addr" -c '
        [.[] 
         | select(.workspace.id == $ws)
         | if .address == $focused then
             {text: "<span color=\"#bb9af7\">" + (.initialClass | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;")) + "</span>"}
           else
             {text: (.initialClass | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;"))}
           end
        ] | 
        {text: (map(.text) | join(" | "))}
    '
}

print_clients

# Get Hyprland socket path
SOCKET_PATH="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"

# Use socat to listen for events
socat - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
    if echo "$line" | grep -Eq "^(workspace|createwindow|destroywindow|movewindow|activewindow)"; then
        print_clients
    fi
done

