#!/bin/zsh
#
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/setup.zsh)"
#
# Change default shell to zsh
#chsh -s $(which zsh)
# Create dirs
mkdir -p ~/.config/nvim
mkdir -p ~/.config/zsh

# Oh my zsh setup
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/init.vim > ~/.config/nvim/init.vim
curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc > ~/.zshrc

