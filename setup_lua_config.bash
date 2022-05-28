#!/bin/bash
#
# Variabler
vim_min_version="8.0"
#
#
#
#
#
if command -v etckeeper; then
  echo "etckeeper EEEEeeh"
  sudo etckeeper commit -c "nvim lua install"
fi

vim_version=$(vim --version | head -1 | grep -o '[0-9]\.[0-9]')
vim_version_compare=$(echo "$vim_version < $vim_min_version" | bc -l)
echo "version compare ($vim_version_compare)"
if [ "$vim_version_compare" -eq "1" ]; then
  echo "$vim_version"
  sudo apt update
  sudo apt remove -y neovim neovim-runtime
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
  sudo apt remove -y ./nvim-linux64.deb
  sudo apt install -y ./nvim-linux64.deb build-essential
  rm nvim-linux64.deb*
fi

if [[ -f ~/.config/nvim/init.vim ]]; then
  rm -fR ~/.config/nvim/*
fi
if [[ ! -d ~/utv/git/config ]]; then
  mkdir -p ~/utv/git
  git clone https://github.com/JacobSandin/configs ~/utv/git/config
else
 cd ~/utv/git/config/
 git pull
fi
if [[ ! -L ~/.config/nvim/lua ]] || [[ ! -e ~/.config/nvim/lua ]]; then
  echo "LUA dir verkar tokigt skapar länkar"
  rm -rf ~/.config/nvim/lua
  ln -s ~/utv/git/config/nvim_lua/lua ~/.config/nvim/lua
fi
if [[ ! -L ~/.config/nvim/init.lua ]] || [[ ! -e ~/.config/nvim/init.lua ]]; then
  rm -f ~/.config/nvim/init.lua
  ln -s ~/utv/git/config/nvim_lua/init.lua ~/.config/nvim/init.lua
  echo "init.lua verkar tokigt"
fi


