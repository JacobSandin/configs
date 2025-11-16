# Changelog

All notable changes to this project will be documented in this file.

## [2024-11-16] - Window Management Improvements

### Added
- **Automatic window reassignment on startup** - All windows are now automatically moved to their correct workspaces after AeroSpace starts
  - New script: `reassign-windows-on-startup.sh` runs 2 seconds after startup
  - Integrated into `.aerospace.toml` via `after-startup-command`
  
- **Manual window reassignment command** - `Hyper+G` → `Hyper+A` to manually reassign all windows to correct workspaces
  - New script: `reassign-all-windows.sh`
  - Useful after reboots or when windows end up in wrong workspaces

- **Sublime Text support** - Sublime Text now goes to workspace E (editors) alongside Windsurf
  - Added `com.sublimetext.4` to all workspace assignment rules

### Fixed
- **Mail app-id correction** - Fixed incorrect app-id for Apple Mail from `com.apple.w` to `com.apple.mail`
  - Windows now correctly route to workspace R

- **Critical bash loop bug** - Fixed stdin-stealing bug in all aerospace scripts
  - Issue: `aerospace` commands would consume stdin, causing while-loops to only process first item
  - Solution: Use file descriptor 3 (`<&3`) to isolate loop input from command execution
  - Affected scripts:
    - `reassign-all-windows.sh`
    - `reassign-windows-on-startup.sh`
    - `reset-all-to-tiling.sh`

### Technical Details

**Root Cause**: macOS reopens applications before AeroSpace fully starts, placing windows in random workspaces. The `on-window-detected` rules only trigger for new windows, not already-opened ones.

**Solution**: Force reassignment via startup script that iterates all windows and moves them based on app-id.

### Workspace Mappings

- **W** - Web (Brave Browser)
- **E** - Editors (Windsurf, Sublime Text)
- **T** - Terminal (kitty)
- **Q** - Database (Sequel Ace)
- **S** - Slack
- **R** - Mail & Messages
- **A** - Everything else (default/fallback)
