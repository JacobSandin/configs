# Base16 Shell
#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#    source "$BASE16_SHELL/profile_helper.fish"
#end
#
set TERM putty-256color
#set TERM xterm
alias nv='nvim'
alias l='ls -lah'
alias lk='cat /home/jacsan/git/configs/koha_list.txt'

alias lj='cat /home/jacsan/git/configs/imcms_list.txt'
alias li='cat /home/jacsan/git/configs/imcms_list.txt|grep'

set PATH "$HOME/.cargo/bin:$PATH"
set EDITOR nv

# config.fish
eval (ssh-agent -c)
ssh-add ~/.ssh/jskey.pem


#set fish_key_bindings fish_vi_key_bindings
set fish_key_bindings fish_user_key_bindings
set fish_bind_mode insert

#~/git/configs/fish/functions/fish_user_key_bindings.fish



