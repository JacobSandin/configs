#!/bin/bash

# Add aerospace_workspace_change event
sketchybar --add event aerospace_workspace_change

# Create items for all AeroSpace workspaces
for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
             --subscribe space.$sid aerospace_workspace_change \
             --set space.$sid \
                   background.color=$ACCENT_COLOR \
                   background.corner_radius=5 \
                   background.height=24 \
                   background.drawing=off \
                   icon="$sid" \
                   icon.font="SF Pro:Bold:15.0" \
                   icon.padding_left=10 \
                   icon.padding_right=4 \
                   icon.drawing=on \
                   label.font="sketchybar-app-font:Regular:16.0" \
                   label.padding_left=0 \
                   label.padding_right=10 \
                   update_freq=2 \
                   click_script="aerospace workspace $sid" \
                   script="$PLUGIN_DIR/aerospace.sh $sid"
done                           
