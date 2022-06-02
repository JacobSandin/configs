#!/bin/bash
full="$1"
#export SLUA=""
echo "$full"
if [[ "$SLUA" != "" && "$full" == "" ]]; then
  exit
fi

if [ "$EUID" == 0 ]; then
  #  echo "Please do not run as root"
  exit
fi
if [[ -f ~/.full_setup ]]; then
    full="full"
fi

if [[ "$full" == "full" ]]; then
  touch ~/.full_setup
elif [[ ! -f ~/.minimum_setup && ! -f ~/.full_setup ]]; then
  read -p "Do you want to run full setup? (yes/no) " yn

  case $yn in
  yes)
    echo ok, we will proceed
    touch ~/.full_setup
    full="full"
    ;;
  no)
    echo Running minimal setup!
    touch ~/.minimum_setup
    full=""
    ;;
  *)
    echo invalid response
    exit 1
    ;;
  esac
fi
#
#
# Variabler
vim_min_version="0.7"
lg_min_version="0.34"
node_min_version="16.00"
rg_min_version="13"
ripgrep_file="ripgrep_13.0.0_amd64.deb"
#
#OLDPATH=$PATH
if [[ ! "$PATH" == *"$HOME"* ]]; then
  export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/nvim/plugged/fzf/bin:$HOME/bin:$PATH"
fi
#
#
# Update etckeeper if it exists so it does not interfere
if [ $(command -v etckeeper) ]; then
  sudo etckeeper commit -c "nvim lua install"
fi

sudo chown -R $EUID.$EUID $HOME
#
#
## Check ripgrep version and update if too old or missing
rg_version=$(rg --version | tail -n +1 | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
rg_version_compare=$(echo "$rg_version < $rg_min_version" | bc -l)
echo "ripgrep: curr=$rg_version > min=$rg_min_version = $rg_version_compare"
if [[ ! $(command -v rg) || "$rg_version_compare" == "1" ]]; then
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/$ripgrep_file
  sudo dpkg -i $ripgrep_file
  rm $ripgrep_file*
fi
#
#
# Check lazygit version and update if too old or missing
lg_version=$(lazygit --version | tail -n +1 | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
lg_version_compare=$(echo "$lg_version < $lg_min_version" | bc -l)
echo "lazygit: curr=$lg_version > min=$lg_min_version = $lg_version_compare"
if [[ ! $(command -v lazygit) || "$lg_version_compare" == "1" ]]; then
  sudo apt-get install -y xdg-utils
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
vim_version=$(nvim --version | tail -n +1 | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
vim_version_compare=$(echo "$vim_version < $vim_min_version" | bc -l)
echo "nvim: curr=$vim_version > min=$vim_min_version = $vim_version_compare"
if [[ ! $(command -v nvim) || "$vim_version_compare" == "1" ]]; then
  #https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  sudo apt update -y
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
if [[ "$full" == "full" ]]; then
  node_version=$(node --version | tail -n +1 | head -1 | egrep -o '[0-9]{1,2}\.[0-9]{1,2}')
  node_version_compare=$(echo "$node_version < $node_min_version" | bc -l)
  echo "node: curr=$node_version > min=$node_min_version = $node_version_compare"
  if [[ ! $(command -v node) || "$node_version_compare" == "1" ]]; then
    curl -sL https://deb.nodesource.com/setup_17.x | sudo bash -
    sudo apt-get install -y nodejs
  fi
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
if [[ -d /srv/github/tools ]]; then
  echo "updating /srv/github/tools/\n"
  cd /srv/github/tools/
  sudo -u root git pull
  cd ~/
fi
if [[ -d /srv/github/vufind ]]; then
  echo "Updating /srv/github/vufind\n"
  cd /srv/github/vufind/
  sudo git -u root pull
  cd ~/
fi
if [[ ! -d ~/utv/git/config ]]; then
  mkdir -p ~/utv/git
  git clone https://github.com/JacobSandin/configs ~/utv/git/config >/dev/null
  git config --global user.email "jacob@imcode.com"
  git config --global user.name "Jacob Sandin"
  source ~/utv/git/configs/fzf/key-bindings.zsh
  source ~/utv/git/configs/fzf/completion.zsh
else
  cd ~/utv/git/config/
  git pull >/dev/null
  cd ~/
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

if [[ ! $(command -v stylua) ]]; then
  wget --quiet --no-cache --no-cookies https://github.com/JohnnyMorganz/StyLua/releases/download/v0.13.1/stylua-linux.zip
  unzip stylua-linux.zip
  sudo cp -f stylua /usr/bin/
  rm stylua*
  sudo chmod 755 /usr/bin/stylua
fi

if [[ "$full" == "full" ]]; then
  #Python
  if [[ ! $(command -v pip) ]]; then
    sudo apt install -y pip
  fi
  #Python
  if [[ ! $(command -v flake8) ]]; then
    pip install flake8
  fi
  #Python
  if [[ ! $(command -v black) ]]; then
    pip install git+https://github.com/psf/black
  fi
fi
#Bash format
if [[ ! $(command -v shfmt) ]]; then
  sudo snap install shfmt
fi

#sudo curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o /usr/bin/php-cs-fixer
#chmod 755 /usr/bin/php-cs-fixer
#
#
#cpan install -y Perl::Tidy
#sudo perl -I /usr/lib/perl5 -MCPAN

#OLDPATH="$PATH"
#export PATH="$OLDPATH"
#if [[ ! -d ~/.local/share/fonts/NerdFonts ]]; then
#  mkdir -p ~/.local/share/fonts/NerdFonts
#  unzip nerdfonts.zip -d ~/.local/share/fonts/NerdFonts
#  rm nerdfonts.zip
#fi

# install plugins in vim
if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim ]]; then
  errorout=$(nvim -c PackerSync -c 'sleep 5' -c qa --headless 2>&1)

  while [[ "$errorout" != "" ]]; do
    echo "$errorout"
    errorout=$(nvim -c PackerSync -c 'sleep 5' -c qa --headless 2>&1)
    if [[ -d ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim && ! -d ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim/build ]]; then
      cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
      make
      cd ~/
      break
    fi
  done
fi

if [[ -d ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim && ! -f ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim/build/libfzf.so ]]; then
  cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
  make
  cd ~/
fi
