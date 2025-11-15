#!/usr/bin/env bash
# Move letter workspaces (except A) to secondary monitor

for ws in Q W E R T Y S; do
  /opt/homebrew/bin/aerospace workspace $ws
  /opt/homebrew/bin/aerospace move-workspace-to-monitor secondary
done

# Return to workspace A
/opt/homebrew/bin/aerospace workspace A
