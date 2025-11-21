#!/bin/bash

# Reassign all windows to their correct workspaces based on app-id
# Usage: reassign-all-windows.sh [--quiet]
#   --quiet: Run silently (for startup), default: verbose with feedback

QUIET=false
if [[ "$1" == "--quiet" ]]; then
    QUIET=true
    # Wait for AeroSpace and apps to fully start when running at startup
    sleep 5
fi

if [[ "$QUIET" == false ]]; then
    echo "🔄 Reassigning all windows to correct workspaces..."
fi

# Use temp file to avoid pipe subshell issues
tmp_file=$(mktemp)
aerospace list-windows --all --format '%{window-id}|%{app-bundle-id}|%{app-name}' > "$tmp_file"

count=0
# Process each window - use fd 3 to prevent aerospace from stealing stdin
exec 3< "$tmp_file"
while IFS='|' read -r window_id app_id app_name <&3; do
    # Skip empty lines
    [[ -z "$window_id" ]] && continue
    
    ((count++))
    
    case "$app_id" in
        "com.brave.Browser")
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace W"
            aerospace move-node-to-workspace --window-id "$window_id" W > /dev/null 2>&1
            ;;
        "com.exafunction.windsurf"|"com.sublimetext.4")
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace E"
            aerospace move-node-to-workspace --window-id "$window_id" E > /dev/null 2>&1
            ;;
        "net.kovidgoyal.kitty")
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace T"
            aerospace move-node-to-workspace --window-id "$window_id" T > /dev/null 2>&1
            ;;
        "com.sequel-ace.sequel-ace")
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace Q"
            aerospace move-node-to-workspace --window-id "$window_id" Q > /dev/null 2>&1
            ;;
        "com.tinyspeck.slackmacgap")
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace S"
            aerospace move-node-to-workspace --window-id "$window_id" S > /dev/null 2>&1
            ;;
        "com.apple.mail"|"com.apple.MobileSMS")
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace R"
            aerospace move-node-to-workspace --window-id "$window_id" R > /dev/null 2>&1
            ;;
        *)
            [[ "$QUIET" == false ]] && echo "  → Moving $app_name (ID: $window_id) to workspace A (fallback)"
            aerospace move-node-to-workspace --window-id "$window_id" A > /dev/null 2>&1
            ;;
    esac
done
exec 3<&-

rm -f "$tmp_file"
if [[ "$QUIET" == false ]]; then
    echo "✅ Done! Processed $count windows."
fi
