#!/bin/zsh
#
# zsh -c "$(curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/setup.zsh)"
#
# Change default shell to zsh
#chsh -s $(which zsh)
# Create dirs
mkdir -p ~/.config/nvim
mkdir -p ~/.config/zsh


rm ~/.z*
curl -fs https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc > /home/jacsan/.zshrc

# Oh my zsh setup
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting

curl -fs https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/init.vim > ~/.config/nvim/init.vim

nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall

. /home/jacsan/.zshrc
