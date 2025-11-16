#!/bin/bash

# Reassign all windows to their correct workspaces based on app-id
echo "🔄 Reassigning all windows to correct workspaces..."

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
            echo "  → Moving $app_name (ID: $window_id) to workspace W"
            aerospace move-node-to-workspace --window-id "$window_id" W > /dev/null 2>&1
            ;;
        "com.exafunction.windsurf"|"com.sublimetext.4")
            echo "  → Moving $app_name (ID: $window_id) to workspace E"
            aerospace move-node-to-workspace --window-id "$window_id" E > /dev/null 2>&1
            ;;
        "net.kovidgoyal.kitty")
            echo "  → Moving $app_name (ID: $window_id) to workspace T"
            aerospace move-node-to-workspace --window-id "$window_id" T > /dev/null 2>&1
            ;;
        "com.sequel-ace.sequel-ace")
            echo "  → Moving $app_name (ID: $window_id) to workspace Q"
            aerospace move-node-to-workspace --window-id "$window_id" Q > /dev/null 2>&1
            ;;
        "com.tinyspeck.slackmacgap")
            echo "  → Moving $app_name (ID: $window_id) to workspace S"
            aerospace move-node-to-workspace --window-id "$window_id" S > /dev/null 2>&1
            ;;
        "com.apple.mail"|"com.apple.MobileSMS")
            echo "  → Moving $app_name (ID: $window_id) to workspace R"
            aerospace move-node-to-workspace --window-id "$window_id" R > /dev/null 2>&1
            ;;
        *)
            echo "  → Moving $app_name (ID: $window_id) to workspace A"
            aerospace move-node-to-workspace --window-id "$window_id" A > /dev/null 2>&1
            ;;
    esac
done
exec 3<&-

rm -f "$tmp_file"
echo "✅ Done! Processed $count windows."
