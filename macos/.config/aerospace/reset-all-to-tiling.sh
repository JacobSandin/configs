#!/usr/bin/env bash
# Force all windows in current workspace to tiling layout

# Get all window IDs in focused workspace
tmp_file=$(mktemp)
/opt/homebrew/bin/aerospace list-windows --workspace focused --format '%{window-id}' > "$tmp_file"

# Set each window to tiling - use fd 3 to prevent aerospace from stealing stdin
exec 3< "$tmp_file"
while IFS= read -r wid <&3; do
  if [[ -n "$wid" ]]; then
    /opt/homebrew/bin/aerospace layout --window-id "$wid" tiling 2>/dev/null
  fi
done
exec 3<&-

rm -f "$tmp_file"

# Flatten and reset the layout
/opt/homebrew/bin/aerospace flatten-workspace-tree
/opt/homebrew/bin/aerospace layout tiles horizontal vertical
