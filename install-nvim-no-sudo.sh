#!/usr/bin/env bash
#
# Modified version of install-basic.zsh without elevated privileges
#
# Download neovim AppImage
cd ~/bin

# Remove old files to avoid 'text file busy' errors
rm -f ~/bin/nvim
rm -f ~/bin/nvim.appimage
rm -rf ~/bin/squashfs-root

# Download Neovim 0.9.5 which has better compatibility with older systems
#wget -O nvim.appimage.new https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
#wget -O nvim.appimage.new https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
#wget -O nvim.appimage.new https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.appimage
#Unsuported GLIB
wget -O nvim.appimage.new https://github.com/neovim/neovim-releases/releases/download/v0.11.5/nvim-linux-x86_64.appimage
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

