function fish_user_key_bindings
  fish_vi_key_bindings
  set fish_escape_delay_ms=2
  bind -M insert -m default jj backward-char force-repaint
end

#function fish_user_key_bindings
#fzf_key_bindings             
#end                            
