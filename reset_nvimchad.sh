rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
                                                                                    
git clone https://github.com/NvChad/starter ~/.config/nvim  

ln -sf ~/utv/git/configs/nvchad_config/init.lua ~/.config/nvim/init.lua
ln -sf ~/utv/git/configs/nvchad_config/lua/mappings.lua ~/.config/nvim/lua/mappings.lua
ln -sf ~/utv/git/configs/nvchad_config/lua/chadrc.lua ~/.config/nvim/lua/chadrc.lua
#ln -sf ~/utv/git/configs/nvchad_config/lua/plugins/init.lua ~/.config/nvim/lua/plugins/init.lua