#!/bin/bash
#
#
# zsh -c "$(curl -fsSL https://raw.githubusercontent.com/JacobSandin/configs/master/tmux/setup.zsh)"
#
# Change default shell to zsh
# Create dirs
#
mkdir -p ~/.tmux/plugins

# Using wget to get no-cashe curl did not handle this well.
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/tmux/tmux.conf -O ~/.tmux.conf
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/tmux/.tmux_reload_clipboard.sh -O ~/.tmux_reload_clipboard.sh
# Oh my zsh setup

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
~/.tmux/plugins/tpm/scripts/update_plugin.sh



