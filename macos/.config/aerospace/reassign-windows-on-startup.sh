#!/bin/bash

# Wait for AeroSpace and apps to fully start
# Increased from 2 to 5 seconds to ensure all startup apps have launched
sleep 5

# Get all window IDs and reassign them based on app-id
tmp_file=$(mktemp)
aerospace list-windows --all --format '%{window-id}|%{app-bundle-id}' > "$tmp_file"

# Use fd 3 to prevent aerospace from stealing stdin
exec 3< "$tmp_file"
while IFS='|' read -r window_id app_id <&3; do
    [[ -z "$window_id" ]] && continue
    
    case "$app_id" in
        "com.brave.Browser")
            aerospace move-node-to-workspace --window-id "$window_id" W > /dev/null 2>&1
            ;;
        "com.exafunction.windsurf"|"com.sublimetext.4")
            aerospace move-node-to-workspace --window-id "$window_id" E > /dev/null 2>&1
            ;;
        "net.kovidgoyal.kitty")
            aerospace move-node-to-workspace --window-id "$window_id" T > /dev/null 2>&1
            ;;
        "com.sequel-ace.sequel-ace")
            aerospace move-node-to-workspace --window-id "$window_id" Q > /dev/null 2>&1
            ;;
        "com.tinyspeck.slackmacgap")
            aerospace move-node-to-workspace --window-id "$window_id" S > /dev/null 2>&1
            ;;
        "com.apple.mail"|"com.apple.MobileSMS")
            aerospace move-node-to-workspace --window-id "$window_id" R > /dev/null 2>&1
            ;;
        *)
            # Unknown apps stay in their current workspace
            ;;
    esac
done
exec 3<&-

rm -f "$tmp_file"
