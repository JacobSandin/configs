require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Line numbers
map("n", "<leader>nn", "<cmd> set nu! <CR>", { desc = "Toggle line number" })
map("n", "<leader>nr", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })

-- Code completion popup toggles
map("n", "<leader>ncx", "<cmd> lua require('cmp').setup.buffer { enabled = false }<CR>", { desc = "Code complete popup off" })
map("n", "<leader>ncc", "<cmd> lua require('cmp').setup.buffer { enabled = true }<CR>", { desc = "Code complete popup on" })

-- Mouse toggles
map("n", "<leader>nmy", "<cmd> set mouse=a <CR>", { desc = "Mouse on" })
map("n", "<leader>nmn", "<cmd> set mouse= <CR>", { desc = "Mouse off" })

-- Reload config
map("n", "<leader>ss", "<cmd> source ~/.config/nvim/init.lua<CR>", { desc = "Reload nvim" })

-- Telescope
map("n", "<leader>tF", "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/') })<cr>", { desc = "Files ~" })
map("n", "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Files" })
map("n", "<leader>tG", "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", { desc = "Ripgrep ~" })
map("n", "<leader>tg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Ripgrep" })
map("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Buffers" })
map("n", "<leader>tH", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "Help" })
map("n", "<leader>tm", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "Keymaps" })

-- Ripgrep in specific directories
map("n", "<leader>gs", "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/srv') })<cr>", { desc = "Ripgrep /srv" })
map("n", "<leader>ge", "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/etc') })<cr>", { desc = "Ripgrep /etc" })
map("n", "<leader>gr", "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/') })<cr>", { desc = "Ripgrep /" })
map("n", "<leader>gh", "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", { desc = "Ripgrep ~/" })
map("n", "<leader>gg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Ripgrep" })

-- GitSigns navigation (Swedish keyboard: ä/å for next/prev hunk)
map("n", "ä", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { expr = true, desc = "Jump to next hunk" })

map("n", "å", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { expr = true, desc = "Jump to prev hunk" })
