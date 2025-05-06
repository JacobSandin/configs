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

echo "Updating .zshrc"
# Download the zshrc file
curl -s https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc > ~/.zshrc.temp

# Replace all hardcoded username references with $HOME variable
sed -i "s|/home/jacsan|\$HOME|g" ~/.zshrc.temp

# Move the modified file to .zshrc
mv ~/.zshrc.temp ~/.zshrc

# Create local directories if they don't exist
mkdir -p ~/bin

echo "Installing neovim using AppImage extraction method"

# Download neovim AppImage
cd ~/bin

# Remove old files to avoid 'text file busy' errors
rm -f ~/bin/nvim
rm -f ~/bin/nvim.appimage
rm -rf ~/bin/squashfs-root

# Download Neovim 0.9.5 which has better compatibility with older systems
wget -O nvim.appimage.new https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
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

# Add ~/bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo "" >> ~/.zshrc
    echo "# Add ~/bin to PATH" >> ~/.zshrc
    echo "export PATH=\"$HOME/bin:$PATH\"" >> ~/.zshrc
    echo "Added ~/bin to PATH in .zshrc"
fi

echo "Neovim installed successfully in ~/bin using AppImage extraction method."
echo "Verifying neovim installation..."
~/bin/nvim --version | head -n 1

if [ -d ~/utv/git/configs ]; then
    echo "utv/git/configs dir exists. Updating.."
    cd ~/utv/git/configs
    git pull
else
    echo "Cloning configs and updating nvim link"
    rm -rf ~/.config/nvim; rm -rf ~/.local/share/nvim
    mkdir -p ~/utv/git; cd ~/utv/git
    git clone https://github.com/JacobSandin/configs
    # Use your home directory instead of hardcoded path
    ln -s ~/utv/git/configs/nvim_lua ~/.config/nvim
fi
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
