#!/bin/bash
# Install script for macOS dotfiles
# Creates symlinks from home directory to this repo

set -e  # Exit on error

DOTFILES_DIR="$HOME/utv/git/configs/macos"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🚀 Installing macOS dotfiles..."
echo "📁 Dotfiles location: $DOTFILES_DIR"
echo "💾 Backup location: $BACKUP_DIR"
echo ""

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to create symlink safely
create_symlink() {
    local source="$1"
    local target="$2"
    
    # If target exists and is not a symlink, back it up
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "  📦 Backing up: $target"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    # If target is a symlink, remove it
    if [ -L "$target" ]; then
        echo "  🔗 Removing old symlink: $target"
        rm "$target"
    fi
    
    # Create new symlink
    echo "  ✅ Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

echo "📝 Installing home directory files..."
create_symlink "$DOTFILES_DIR/home/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/home/.bash_profile" "$HOME/.bash_profile"
create_symlink "$DOTFILES_DIR/home/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/home/.aerospace.toml" "$HOME/.aerospace.toml"

echo ""
echo "⚙️  Installing .config directory files..."

# Ensure .config directory exists
mkdir -p "$HOME/.config"

create_symlink "$DOTFILES_DIR/.config/aerospace" "$HOME/.config/aerospace"
create_symlink "$DOTFILES_DIR/.config/karabiner" "$HOME/.config/karabiner"
create_symlink "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
create_symlink "$DOTFILES_DIR/.config/leaderkey" "$HOME/.config/leaderkey"
create_symlink "$DOTFILES_DIR/.config/sketchybar" "$HOME/.config/sketchybar"

echo ""
echo "🔄 Reloading configurations..."

# Reload Aerospace
if command -v aerospace &> /dev/null; then
    aerospace reload-config && echo "  ✅ Aerospace reloaded"
fi

# Reload Karabiner
if pgrep -x "karabiner_console" &> /dev/null; then
    pkill karabiner_console_user_server && sleep 1 && echo "  ✅ Karabiner reloaded"
fi

# Reload Sketchybar
if pgrep -x "sketchybar" &> /dev/null; then
    sketchybar --reload && echo "  ✅ Sketchybar reloaded"
fi

echo ""
echo "✨ Installation complete!"
echo ""
echo "📌 Next steps:"
echo "  1. Restart your terminal to load new .zshrc"
echo "  2. Restart Kitty if you have it open"
echo "  3. Restart LeaderKey from menu bar"
echo ""
echo "🔙 Backups saved to: $BACKUP_DIR"
echo "   (You can delete this folder if everything works)"
