#!/bin/zsh
#
# /bin/sudo apt -y install zsh neovim  $(check-language-support -l sv)
#
# zsh -c "$(curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/setup.zsh)"
#
# Change default shell to zsh
#chsh -s $(which zsh)
# Create dirs
#
mkdir -p ~/.config/nvim
mkdir -p ~/.config/zsh

/bin/sudo apt -y install zsh neovim  $(check-language-support -l sv)
/bin/sudo update-locale LC_ALL=C.UTF-8 LANG=en_US.UTF-8
rm -f ~/.z*

# Using wget to get no-cashe curl did not handle this well.
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc -O ~/.zshrc  
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/init.vim -O ~/.config/nvim/init.vim 
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/tmux.conf -O ~/.tmux.conf

# Oh my zsh setup
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting


nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall

source /home/jacsan/.zshrc
 
# Set git to use the credential memory cache
git config --global credential.helper cache
# Set the cache to timeout after 1 hour (setting is in seconds)
git config --global credential.helper 'cache --timeout=3600'

git config --global user.email "jacob@js.se"
git config --global user.name "Jacob Sandin"
