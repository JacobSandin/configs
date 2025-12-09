#!/usr/bin/env bash
#
# Modified version of install-basic.zsh without elevated privileges
#
export ZSH_CUSTOM=~/.config/zsh/oh-my-zsh
export ZSH=~/.config/zsh/oh-my-zsh

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "zsh is not installed. Please install zsh before running this script."
    echo "You can install it with your package manager, e.g., 'apt install zsh' on Debian/Ubuntu."
    exit 1
fi

if [ -d ~/.config/zsh/oh-my-zsh ]; then
    echo "Oh my exists"
else
    echo "No oh my, installing"
    # Run Oh My Zsh installer with flags to prevent it from changing the shell (which would use sudo)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --skip-chsh
fi

# This script should now work in bash, so we don't need to switch to zsh

if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    echo "Oh-my plugin syntax-highlight exists"
else
    echo "Oh-my plugin syntax-highlight installing"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    echo "Oh-my plugin zsh-autosuggestions exists"
else
    echo "Oh-my plugin zsh-autosuggestions installing"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Create local directories if they don't exist
mkdir -p ~/bin

# Clone or update configs repo first (needed for symlinks)
if [ -d ~/utv/git/configs ]; then
    echo "utv/git/configs dir exists. Updating.."
    cd ~/utv/git/configs
    git pull
else
    echo "Cloning configs..."
    mkdir -p ~/utv/git; cd ~/utv/git
    git clone https://github.com/JacobSandin/configs
fi

# Create symlinks for zsh config files (uppdateras via git pull)
echo "Creating symlinks for .zshrc and .zshenv..."
rm -f ~/.zshrc
rm -f ~/.zshenv
ln -sf ~/utv/git/configs/minimal/zshrc ~/.zshrc
ln -sf ~/utv/git/configs/minimal/zshenv ~/.zshenv

echo "====================================="
echo "  Neovim Installation"
echo "====================================="
echo ""
echo "Välj version:"
echo "  1) v0.9.5"
echo "  2) v0.10.4"
echo "  3) v0.11.5"
echo "  4) nightly"
echo "  5) Annan version (ange själv)"
echo "  0) Hoppa över nvim-installation"
echo ""
read -p "Välj version (0-5): " version_choice </dev/tty

if [[ -z "$version_choice" ]] || [[ "$version_choice" == "0" ]]; then
    echo "Hoppar över nvim-installation."
else
    case $version_choice in
        1) VERSION="v0.9.5" ;;
        2) VERSION="v0.10.4" ;;
        3) VERSION="v0.11.5" ;;
        4) VERSION="nightly" ;;
        5)
            read -p "Ange version (t.ex. v0.10.0): " VERSION </dev/tty
            if [[ -z "$VERSION" ]]; then
                echo "Ingen version angiven. Hoppar över."
                VERSION=""
            fi
            ;;
        *)
            echo "Ogiltigt val. Hoppar över nvim-installation."
            VERSION=""
            ;;
    esac

    if [[ -n "$VERSION" ]]; then
        echo ""
        echo "Välj repo:"
        echo "  1) neovim/neovim (standard)"
        echo "  2) neovim-releases (GLIB-kompatibel för äldre system)"
        echo ""
        read -p "Välj repo (1-2): " repo_choice </dev/tty

        case $repo_choice in
            1)
                if [[ "$VERSION" == "nightly" ]]; then
                    URL="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
                elif [[ "$VERSION" == "v0.9.5" ]]; then
                    URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim.appimage"
                else
                    URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.appimage"
                fi
                ;;
            2)
                if [[ "$VERSION" == "nightly" ]]; then
                    echo "Nightly finns inte i neovim-releases. Använder neovim/neovim."
                    URL="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
                else
                    URL="https://github.com/neovim/neovim-releases/releases/download/${VERSION}/nvim-linux-x86_64.appimage"
                fi
                ;;
            *)
                echo "Ogiltigt val. Använder neovim/neovim."
                if [[ "$VERSION" == "v0.9.5" ]]; then
                    URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim.appimage"
                else
                    URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.appimage"
                fi
                ;;
        esac

        echo ""
        echo "Installerar Neovim $VERSION..."
        echo "URL: $URL"
        
        cd ~/bin
        
        # Remove old files to avoid 'text file busy' errors
        rm -f ~/bin/nvim
        rm -f ~/bin/nvim.appimage
        rm -rf ~/bin/squashfs-root
        
        wget -O nvim.appimage.new "$URL"
        chmod +x nvim.appimage.new
        
        # Extract the AppImage contents (works without FUSE)
        echo "Extracting AppImage contents..."
        ./nvim.appimage.new --appimage-extract >/dev/null
        
        # Move the new AppImage into place after extraction
        mv nvim.appimage.new nvim.appimage
        
        # Create a wrapper script to run neovim from the extracted files
        echo '#!/bin/bash

# Path to the extracted AppImage contents
EXTRACTED_DIR="$HOME/bin/squashfs-root"

# Run the extracted neovim binary
"$EXTRACTED_DIR/usr/bin/nvim" "$@"' > ~/bin/nvim
        
        chmod +x ~/bin/nvim
        
        echo ""
        echo "✓ Neovim $VERSION installerat!"
        ~/bin/nvim --version | head -n 1
    fi
fi

# Setup NvChad with custom config
echo ""
echo "====================================="
echo "  NvChad Setup"
echo "====================================="

if [ -d ~/.config/nvim ]; then
    echo "NvChad config finns redan i ~/.config/nvim"
    echo ""
    echo "Vill du:"
    echo "  1) Resetta NvChad (tar bort allt och installerar om)"
    echo "  2) Bara uppdatera symlinks (behåller plugins etc)"
    echo "  0) Hoppa över"
    echo ""
    read -p "Välj (0-2): " nvchad_choice </dev/tty
else
    echo "Ingen NvChad-config hittad. Installerar..."
    nvchad_choice="1"
fi

case $nvchad_choice in
    1)
        echo "Resettar NvChad..."
        rm -rf ~/.config/nvim
        rm -rf ~/.local/state/nvim
        rm -rf ~/.local/share/nvim
        
        git clone https://github.com/NvChad/starter ~/.config/nvim
        
        ln -sf ~/utv/git/configs/nvchad_config/init.lua ~/.config/nvim/init.lua
        ln -sf ~/utv/git/configs/nvchad_config/lua/mappings.lua ~/.config/nvim/lua/mappings.lua
        ln -sf ~/utv/git/configs/nvchad_config/lua/chadrc.lua ~/.config/nvim/lua/chadrc.lua
        ln -sf ~/utv/git/configs/nvchad_config/lua/options.lua ~/.config/nvim/lua/options.lua
        echo "✓ NvChad resettat och konfigurerat!"
        ;;
    2)
        echo "Uppdaterar symlinks..."
        ln -sf ~/utv/git/configs/nvchad_config/init.lua ~/.config/nvim/init.lua
        ln -sf ~/utv/git/configs/nvchad_config/lua/mappings.lua ~/.config/nvim/lua/mappings.lua
        ln -sf ~/utv/git/configs/nvchad_config/lua/chadrc.lua ~/.config/nvim/lua/chadrc.lua
        ln -sf ~/utv/git/configs/nvchad_config/lua/options.lua ~/.config/nvim/lua/options.lua
        echo "✓ Symlinks uppdaterade!"
        ;;
    *)
        echo "Hoppar över NvChad-setup."
        ;;
esac

cd ~/

# Install lazygit without sudo
echo "Installing lazygit without sudo..."
cd ~/bin

# Download and extract lazygit
wget https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
tar -xzvf lazygit_0.40.2_Linux_x86_64.tar.gz lazygit

# Create a symlink as 'lg' for convenience
cp lazygit lg
chmod +x lazygit lg

# Clean up
rm lazygit_0.40.2_Linux_x86_64.tar.gz

echo "Lazygit installed successfully in ~/bin"

echo "\nInstallation complete! You may need to restart your terminal or run 'source ~/.zshrc' for changes to take effect."
echo "To use neovim and lazygit, make sure ~/bin is in your PATH."
