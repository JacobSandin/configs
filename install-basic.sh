#!/bin/zsh
#
#
export ZSH_CUSTOM=~/.config/zsh/oh-my-zsh
export ZSH=~/.config/zsh/oh-my-zsh

if [ -d .config/zsh/oh-my-zsh ]; then
	echo "Oh my exists"
else
	echo "No oh my, installing"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

_shell="$(ps -p $$ --no-headers -o comm=)"
if [[ $_shell != "zsh" ]]; then                                                                                                                  
	    #zsh
fi

if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
	echo "Oh-my plugin syntax-highlight exists"
else
	echo "Oh-my plugin syntax-highlight installing"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
	echo "Oh-my plugin zsh-autosuggestions exists"
else
	echo "Oh-my plugin zsh-autosuggestions installing"
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
#
echo "Updaing .zshrc"
curl -s https://raw.githubusercontent.com/JacobSandin/configs/master/minimal/zshrc > .zshrc
#
#
echo "Updating neovim"
wget -q -nv https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
sudo chmod 755 /usr/bin/nvim
#
if [ -d ~/utv/git/configs ]; then
	echo "utv/git/configs dir exists. Updating.."
	cd ~/utv/git/configs
	git pull
else
	echo "Cloning configs and updating nvim link"
	rm -rf ~/.config/nvim; rm -rf ~/.local/share/nvim
	mkdir -p ~/utv/git;cd ~/utv/git
	git clone https://github.com/JacobSandin/configs
	ln -s /home/jacsan/utv/git/configs/nvim_lua /home/jacsan/.config/nvim
fi
cd ~/

