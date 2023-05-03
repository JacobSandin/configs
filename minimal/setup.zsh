#!/bin/bash
#
#
# zsh -c "$(curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/setup.zsh)"
#

for i in ranger zsh ripgrep xclip fuse bc unzip ranger ripgrep $(check-language-support -l sv); do
  sudo apt-get install -y $i
done


sudo update-locale LC_ALL=C.UTF-8 LANG=en_US.UTF-8
# Change default shell to zsh
sudo chsh -s $(which zsh) $(whoami)
sudo su $(whoami)
# Create dirs
#
mkdir -p ~/.config/nvim
mkdir -p ~/.config/zsh
mkdir -p ~/.config/ranger

rm -f ~/.z*

# Using wget to get no-cashe curl did not handle this well.
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshenv -O ~/.zshenv  
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc -O ~/.zshrc  
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/init.vim -O ~/.config/nvim/init.vim 
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/ranger_rc.conf -O ~/.config/ranger/rc.conf

touch ~/.config/nvim/local-plugins.vim
touch ~/.config/nvim/local.vim

# Oh my zsh setup
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
#git clone https://github.com/softmoth/zsh-vim-mode.git .config/zsh/plugins/zsh-vim-mode

#nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall

wget --quiet -O - --no-cache --no-cookies https://raw.githubusercontent.com/JacobSandin/configs/master/setup_lua_config.bash|bash

zsh source ~/.zshrc
 
