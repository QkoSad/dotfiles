#!/usr/bin/env bash

# Mapping as a stringified JSON
class_map_json='{
  "footclient": "Terminal",
  "Mullvad Browser": "Mullvad",
  "librewolf": "Librewolf",
  "firefox": "Firefox"
}'

print_clients() {
    current_ws=$(hyprctl activeworkspace -j | jq '.id')
    focused_addr=$(hyprctl activewindow -j | jq -r '.address')

    hyprctl clients -j | jq \
        --argjson ws "$current_ws" \
        --arg focused "$focused_addr" \
        --arg class_map "$class_map_json" \
        -c '
        ($class_map | fromjson) as $map |
        [.[] 
         | select(.workspace.id == $ws)
         | .displayName = ($map[.initialClass] // .initialClass)
        ]
        | sort_by(.initialClass, .address)
        | [
            .[] |
            if .address == $focused then
              {text: "<span color=\"#bb9af7\">" + (.displayName | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;")) + "</span>"}
            else
              {text: (.displayName | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;"))}
            end
        ]
        | {text: (map(.text) | join(" | "))}
    '
}


# Initial print
print_clients

# Socket path
SOCKET_PATH="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"

# Listen with socat
socat - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
    if echo "$line" | grep -Eq "^(workspace|createwindow|destroywindow|movewindow|activewindow)"; then
        print_clients
    fi
done

