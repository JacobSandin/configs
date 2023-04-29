local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

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

-- Nvim-tree
-- keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

------------
-- Diff --
------------
if vim.wo.diff then
--if vim.opt.diff:get() then
  keymap("n", "[", "[c", opts)
  keymap("n", "]", "]c", opts)
end
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
--------------
-- whichkey --
--------------

-- Naviagate buffers
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Left>", ":bprevious<CR>", opts)


local whichkey = require "which-key"
local keymapt = {
  t = {
    name = "Telescope",
    r = { "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>", "Frecency" },
    -- f = { "<cmd>lua require'telescope'.extensions.dap.frames{}<cr>", "Telescope frames" },
    F = { "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/') })<cr>", "Files ~" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", "Ripgrep" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
    n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notify" },
    m = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "Keymaps" },
  },
  f = {
    name = "FZF",
    s = { ":FZF /srv<cr>", "fzf /srv" },
    e = { ":FZF /etc<cr>", "fzf /etc" },
    r = { ":FZF /<cr>", "fzf root" },
    h = { ":FZF ~/<cr>", "fzf home" },
    f = { ":FZF<cr>", "fzf workdir" },
  },
  g = {
    name = "Live grep",
    s = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/srv') })<cr>", "Ripgrep /srv" },
    e = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/etc') })<cr>", "Ripgrep /etc" },
    r = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/') })<cr>", "Ripgrep /" },
    h = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", "Ripgrep ~/" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Ripgrep" },
  },
  l = { ":Lg<cr>", "Lazygit" },
  n = {
    a = { ":set invnumber invrelativenumber<cr>", "Toggle number" },
    n = { ":set invnumber <cr>", "Toggle number" },
    r = { ":set invrelativenumber <cr>", "Toggle relativenumber" },
  },
}

whichkey.register(keymapt, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
