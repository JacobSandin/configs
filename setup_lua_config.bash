#!/bin/bash
#
# Variabler
vim_min_version="0.7"
lg_min_version="0.34"
node_min_version="16.00"
rg_min_version="13"
ripgrep_file="ripgrep_13.0.0_amd64.deb"
#
#
if [ "$EUID" -eq 0 ]; then
#  echo "Please do not run as root"
  exit
fi
#
#
# Update etckeeper if it exists so it does not interfere
if [ `command -v etckeeper` ]; then
  sudo etckeeper commit -c "nvim lua install" >/dev/null
fi
#
#
## Check ripgrep version and update if too old or missing
rg_version=$(rg --version | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
rg_version_compare=$(echo "$rg_version < $rg_min_version" | bc -l)
echo "ripgrep: curr=$rg_version > min=$rg_min_version = $rg_version_compare"
if [[ ! `command -v rg` || "$rg_version_compare" -eq "1" ]]; then
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/$ripgrep_file
  sudo dpkg -i $ripgrep_file
  rm $ripgrep_file*

fi
#
#
# Check lazygit version and update if too old or missing
lg_version=$(lazygit --version | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
lg_version_compare=$(echo "$lg_version < $lg_min_version" | bc -l)
echo "lazygit: curr=$lg_version > min=$lg_min_version = $lg_version_compare"
if [[ ! `command -v lazygit` || "$lg_version_compare" -eq "1" ]]; then
  sudo apt-get install xdg-utils
  wget https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Linux_x86_64.tar.gz
  tar -xzvf lazygit_0.34_Linux_x86_64.tar.gz lazygit
  sudo cp lazygit /usr/bin
  sudo mv lazygit /usr/bin/lg
  rm lazygit_0.34_Linux_x86_64.tar.gz
fi
#
#
#
# Check nvim version and update if too old
vim_version=$(vim --version | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
vim_version_compare=$(echo "$vim_version < $vim_min_version" | bc -l)
echo "nvim: curr=$vim_version > min=$vim_min_version = $vim_version_compare"
if [[ ! `command -v nvim` || "$vim_version_compare" -eq "1" ]]; then
  sudo apt update
  sudo apt remove -y neovim neovim-runtime
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
  sudo apt remove -y ./nvim-linux64.deb
  sudo apt install -y ./nvim-linux64.deb build-essential
  rm nvim-linux64.deb*
fi
#
#
#
# Check node version and update if too old
node_version=$(node --version| head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
node_version_compare=$(echo "$node_version < $node_min_version" | bc -l)
echo "node: curr=$node_version > min=$node_min_version = $node_version_compare"
if [[ ! `command -v node` ||  "$node_version_compare" -eq "1" ]]; then
  curl -sL https://deb.nodesource.com/setup_17.x | sudo bash -
  sudo apt-get install -y nodejs
fi
#
#
#
# If init.vim exists then config is old, delete
if [[ -f ~/.config/nvim/init.vim ]]; then
  rm -fR ~/.config/nvim/*
fi
if [[ ! -d ~/.config/nvim ]]; then
  mkdir -p ~/.config/nvim
fi
if [[ ! -d ~/utv/git/config ]]; then
  mkdir -p ~/utv/git
  git clone https://github.com/JacobSandin/configs ~/utv/git/config >/dev/null
  git config --global user.email "jacob@imcode.com"
  git config --global user.name "Jacob Sandin"
else
 cd ~/utv/git/config/
 git pull >/dev/null
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

