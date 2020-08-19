#Base16 Shell
#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#    source "$BASE16_SHELL/profile_helper.fish"
#end

set TERM screen-256color
#set TERM xterm
alias l='ls -lah'
alias lk='cat /home/jacsan/git/configs/koha_list.txt'

alias lj='cat /home/jacsan/git/configs/imcms_list.txt'
alias li='cat /home/jacsan/git/configs/imcms_list.txt|grep'
alias s='ssh -p2022'
alias sU='ssh -p2022 -i ~/.ssh/ub_key.pem -l ubuntu'

alias f=vifm
alias e=nvim

set PATH "$HOME/.cargo/bin:$PATH"
set EDITOR nv
set RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src/

# config.fish
#eval (ssh-agent -c)
#ssh-add ~/.ssh/jskey.pem


#set fish_key_bindings fish_vi_key_bindings
set fish_key_bindings fish_user_key_bindings
set fish_bind_mode normal
set fish_term24bit 1

#~/git/configs/fish/functions/fish_user_key_bindings.fish



