#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# Get list of apps in this workspace
apps=$(aerospace list-windows --workspace "$1" --format '%{app-name}' 2>/dev/null | sort -u)

# Build icon strip
icon_strip=""
if [ -n "$apps" ]; then
    while IFS= read -r app; do
        icon_strip+="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "$apps"
fi

# Set highlighting based on focused workspace
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                         background.color=$ACCENT_COLOR \
                         icon.color=$BAR_COLOR \
                         label="$icon_strip" \
                         label.color=$BAR_COLOR
else
    sketchybar --set $NAME background.drawing=off \
                         icon.color=$ACCENT_COLOR \
                         label="$icon_strip" \
                         label.color=$ACCENT_COLOR
fi
