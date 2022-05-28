#!/bin/bash
#
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


