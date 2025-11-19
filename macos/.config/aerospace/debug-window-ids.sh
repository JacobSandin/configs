#!/bin/bash

# Debug script to show all window app-ids
echo "🔍 Current windows and their app-ids:"
echo "======================================"
aerospace list-windows --all --format '%{app-bundle-id}|%{app-name}|%{workspace}' | while IFS='|' read -r app_id app_name workspace; do
    [[ -z "$app_id" ]] && continue
    printf "%-40s %-20s → Workspace: %s\n" "$app_id" "$app_name" "$workspace"
done
echo "======================================"
echo ""
echo "💡 If Kitty shows a different app-id, update .aerospace.toml"
