#!/usr/bin/env bash
# Force all windows in current workspace to tiling layout

# Get all window IDs in focused workspace
window_ids=$(/opt/homebrew/bin/aerospace list-windows --workspace focused --format '%{window-id}')

# Set each window to tiling
echo "$window_ids" | while IFS= read -r wid; do
  if [[ -n "$wid" ]]; then
    /opt/homebrew/bin/aerospace layout --window-id "$wid" tiling 2>/dev/null
  fi
done

# Flatten and reset the layout
/opt/homebrew/bin/aerospace flatten-workspace-tree
/opt/homebrew/bin/aerospace layout tiles horizontal vertical
