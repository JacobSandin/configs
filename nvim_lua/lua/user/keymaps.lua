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

-- Nvim-tree
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap(
  "n",
  "<leader>tr",
  "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
  { noremap = true, silent = true }
)
keymap("n", "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>tg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>th", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>tn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", opts)

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
--
--------------
-- Gitsigns   --
--------------
local gs = package.loaded.gitsigns

local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

-- Navigation
map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    gs.next_hunk()
  end)
  return "<Ignore>"
end, { expr = true })

map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    gs.prev_hunk()
  end)
  return "<Ignore>"
end, { expr = true })

-- Actions
map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>hS", gs.stage_buffer)
map("n", "<leader>hu", gs.undo_stage_hunk)
map("n", "<leader>hR", gs.reset_buffer)
map("n", "<leader>hp", gs.preview_hunk)
map("n", "<leader>hb", function()
  gs.blame_line({ full = true })
end)
map("n", "<leader>tb", gs.toggle_current_line_blame)
map("n", "<leader>hd", gs.diffthis)
map("n", "<leader>hD", function()
  gs.diffthis("~")
end)
map("n", "<leader>td", gs.toggle_deleted)

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

local wk = require("which-key")
wk.register({
  a={
    name="testar",
    a = { gs.diffthis, "Diffthis"},
  },
}, {mode = "n",prefix = "<leader>"})
