# macOS Dotfiles

My personal macOS configuration files for window management, terminal, and development setup.

## Structure

```
macos/
├── home/               # Dotfiles from home directory
│   ├── .zshrc         # Zsh shell configuration
│   ├── .bash_profile  # Bash configuration
│   ├── .gitconfig     # Git configuration
│   └── .aerospace.toml # Aerospace window manager config
└── .config/           # XDG config directory files
    ├── aerospace/     # Aerospace scripts
    ├── karabiner/     # Karabiner-Elements key remapping
    ├── kitty/         # Kitty terminal emulator
    ├── leaderkey/     # LeaderKey launcher
    ├── nvim/          # Neovim configuration
    ├── ranger/        # Ranger file manager
    ├── sketchybar/    # Sketchybar menu bar
    └── tmux.conf      # Tmux configuration
```

## Setup Tools

- **[Aerospace](https://github.com/nikitabobko/AeroSpace)** - Tiling window manager
- **[Karabiner-Elements](https://karabiner-elements.pqrs.org/)** - Key remapping (Windows-style shortcuts)
- **[LeaderKey](https://github.com/mikker/LeaderKey.app)** - Vim-style launcher
- **[Kitty](https://sw.kovidgoyal.net/kitty/)** - Terminal emulator
- **[Sketchybar](https://github.com/FelixKratz/SketchyBar)** - macOS menu bar replacement

## Installation

1. Clone this repository
2. Create symlinks to your home directory:

```bash
# Home directory files
ln -sf ~/utv/git/configs/macos/home/.zshrc ~/.zshrc
ln -sf ~/utv/git/configs/macos/home/.bash_profile ~/.bash_profile
ln -sf ~/utv/git/configs/macos/home/.gitconfig ~/.gitconfig
ln -sf ~/utv/git/configs/macos/home/.aerospace.toml ~/.aerospace.toml

# .config directory files
ln -sf ~/utv/git/configs/macos/.config/aerospace ~/.config/aerospace
ln -sf ~/utv/git/configs/macos/.config/karabiner ~/.config/karabiner
ln -sf ~/utv/git/configs/macos/.config/kitty ~/.config/kitty
ln -sf ~/utv/git/configs/macos/.config/leaderkey ~/.config/leaderkey
ln -sf ~/utv/git/configs/macos/.config/tmux.conf ~/.config/tmux.conf
ln -sf ~/utv/git/configs/macos/.config/sketchybar ~/.config/sketchybar
```

3. Install required tools via Homebrew:

```bash
brew install --cask aerospace karabiner-elements kitty leader-key
brew install sketchybar tmux
```

4. Reload configurations:
```bash
aerospace reload-config
# Restart Karabiner-Elements from menu bar
# Restart Kitty
```

## Key Features

### Aerospace Window Management
- **Hyper + 1-9**: Switch to workspace
- **Hyper + Shift + 1-9**: Move window to workspace
- **Hyper + H/J/K/L**: Navigate windows (Vim-style)
- **Hyper + F**: Toggle floating/tiling
- **Hyper + Enter**: Maximize toggle

### Karabiner Windows-Style Shortcuts
- **Ctrl+C/V/X/Z**: Copy/Paste/Cut/Undo
- **Ctrl+A**: Select all
- **Ctrl+F**: Find
- **Ctrl+Arrow**: Word navigation
- **Ctrl+Backspace/Delete**: Delete word

### LeaderKey Launcher
- **Cmd+Shift+L**: Activate LeaderKey
- **t/b/e/s/m**: Launch apps (Kitty/Brave/Windsurf/Slack/Mail)
- **a + w/e/t/q/r/s**: Switch to Aerospace workspace

## Notes

- CapsLock is remapped to Hyper (⌘⌥⌃⇧) in Karabiner for window management
- SSH configs and private keys are NOT included in this repository
- Personal email in .gitconfig is public domain (jacob@js.se)

## Author

Jacob Sandin
