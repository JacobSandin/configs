local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

------------
-- Modes  --
------------
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------
-- Normal --
------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope frecency
vim.api.nvim_set_keymap("n", "<leader>tf", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
--" Using Lua functionst
keymap("n", "<leader>tf","<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true, silent = true})
keymap("n", "<leader>tg","<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true, silent = true})
keymap("n", "<leader>tb","<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true})
keymap("n", "<leader>th","<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true, silent = true})
-- Naviagate buffers
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Left>", ":bprevious<CR>", opts)

------------
-- Insert --
------------

------------
-- Visual --
------------
------------------
-- Visual Block --
------------------

--------------
-- Terminal --
--------------
--------------
-- Custom   --
--------------
