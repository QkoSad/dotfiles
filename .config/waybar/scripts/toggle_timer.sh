#!/usr/bin/env bash

STATE_FILE="/tmp/timer_state"

if [ -f "$STATE_FILE" ]; then
    if grep -q "paused" "$STATE_FILE"; then
        echo "running" > "$STATE_FILE"
    else
        echo "paused" > "$STATE_FILE"
    fi
fi

