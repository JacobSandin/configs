local g = vim.g

g.mapleader = ","
g.maplocalleader = " "
g.shell="/bin/zsh"

local opt = vim.opt
-- https://github.com/lukas-reineke/indent-blankline.nvim
opt.list = true
opt.listchars = ""
opt.timeoutlen = 120
opt.ttimeoutlen = 120
-- vim.opt.listchars:append "space:."
-- vim.opt.listchars:append "eol:↴"
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
