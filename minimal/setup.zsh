#!/bin/zsh
#
# zsh -c "$(curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/setup.zsh)"
#
# Change default shell to zsh
#chsh -s $(which zsh)
# Create dirs
mkdir -p ~/.config/nvim
mkdir -p ~/.config/zsh


rm -f ~/.z*

wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc -O ~/.zshrc  
#curl -H 'Cache-Control: no-cache' -fs https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc > /home/jacsan/.zshrc

# Oh my zsh setup
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting

wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/init.vim -O ~/.config/nvim/init.vim 
#curl -H 'Cache-Control: no-cache' -fs https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/init.vim > ~/.config/nvim/init.vim

nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall

source /home/jacsan/.zshrc
 
# Set git to use the credential memory cache
git config --global credential.helper cache
# Set the cache to timeout after 1 hour (setting is in seconds)
git config --global credential.helper 'cache --timeout=3600'


