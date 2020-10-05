ZDOTDIR=$HOME/.config/zsh

export PATH="$HOME/.cargo/bin:$HOME/.config/nvim/plugged/fzf/bin:$HOME/bin:$PATH"
setopt histignorealldups sharehistory

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e
# Use vim keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history

PROMPT='%F{green}%n@%m:%B%F{blue}%~%f%b%# '

ZSH_CUSTOM=~/.config/zsh

#Change the keypress rate works with Xwin
#xset r rate 180 20

# Remove warnings after sudo
ZSH_DISABLE_COMPFIX=true

# You may need to manually set your language environment
#export LC_ALL=se_SV.UTF-8
export LANG=se_SV.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias vim=nvim
alias vi=nvim
alias vc="nvim ~/.config/nvim/init.vim"
alias zc='nvim ~/.zshrc'
alias ch='cd ~/'
alias ce='ce /etc'
alias svim='/bin/sudo vim'

# Replace sudo too keep variables and go to zsh
esudo() {
    command sudo -E zsh
}

# Use ripgrep with fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

source /home/jacsan/.config/zsh/oh-my-zsh/oh-my-zsh.sh

source ~/.config/nvim/plugged/fzf/shell/key-bindings.zsh
source ~/.config/nvim/plugged/fzf/shell/completion.zsh

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

