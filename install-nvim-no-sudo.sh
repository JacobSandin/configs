#!/usr/bin/env bash
#
# Modified version of install-basic.zsh without elevated privileges
#

set -e

echo "====================================="
echo "  Neovim Installation Script"
echo "====================================="
echo ""
echo "Välj version:"
echo "  1) v0.9.5"
echo "  2) v0.10.4"
echo "  3) v0.11.5"
echo "  4) nightly"
echo "  5) Annan version (ange själv)"
echo "  0) Avbryt"
echo ""
read -p "Välj version (0-5): " version_choice

if [[ -z "$version_choice" ]] || [[ "$version_choice" == "0" ]]; then
    echo "Installation avbruten."
    exit 0
fi

case $version_choice in
    1) VERSION="v0.9.5" ;;
    2) VERSION="v0.10.4" ;;
    3) VERSION="v0.11.5" ;;
    4) VERSION="nightly" ;;
    5)
        read -p "Ange version (t.ex. v0.10.0): " VERSION
        if [[ -z "$VERSION" ]]; then
            echo "Ingen version angiven. Installation avbruten."
            exit 1
        fi
        ;;
    *)
        echo "Ogiltigt val. Installation avbruten."
        exit 1
        ;;
esac

echo ""
echo "Välj repo:"
echo "  1) neovim/neovim (standard)"
echo "  2) neovim-releases (GLIB-kompatibel för äldre system)"
echo "  0) Avbryt"
echo ""
read -p "Välj repo (0-2): " repo_choice

if [[ -z "$repo_choice" ]] || [[ "$repo_choice" == "0" ]]; then
    echo "Installation avbruten."
    exit 0
fi

case $repo_choice in
    1)
        REPO="neovim/neovim"
        if [[ "$VERSION" == "nightly" ]]; then
            URL="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
        elif [[ "$VERSION" == "v0.9.5" ]]; then
            URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim.appimage"
        else
            URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.appimage"
        fi
        ;;
    2)
        REPO="neovim-releases"
        if [[ "$VERSION" == "nightly" ]]; then
            echo "Nightly finns inte i neovim-releases. Använd neovim/neovim istället."
            exit 1
        fi
        URL="https://github.com/neovim/neovim-releases/releases/download/${VERSION}/nvim-linux-x86_64.appimage"
        ;;
    *)
        echo "Ogiltigt val. Installation avbruten."
        exit 1
        ;;
esac

echo ""
echo "====================================="
echo "Version: $VERSION"
echo "Repo: $REPO"
echo "URL: $URL"
echo "====================================="
echo ""
read -p "Fortsätt installation? (y/n): " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Installation avbruten."
    exit 0
fi

mkdir -p ~/bin
cd ~/bin

echo "Rensar gamla filer..."
rm -f ~/bin/nvim
rm -f ~/bin/nvim.appimage
rm -rf ~/bin/squashfs-root

echo "Laddar ner Neovim $VERSION från $REPO..."
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
echo "====================================="
echo "✓ Neovim $VERSION installerat!"
echo "====================================="
echo ""
~/bin/nvim --version | head -1
echo ""

