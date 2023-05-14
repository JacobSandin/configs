---@type MappingsTable
local M = {}

--    F = { "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/') })<cr>", "Files ~" },
--    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
--    g = { "<cmd>lua require('telescsope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", "Ripgrep" },
--    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" }, h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" }, n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notify" },
--    m = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "Keymaps" },
--    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
--
M.general = {
  n = {
    -- line numbers
    ["<leader>n"] = {" Toggle"}, -- Funkar inte trotts att ovan A fungerar
    ["<leader>nn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>nr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
  },
}

M.telescope = {
  plugin = true,

  n = {
--    ["<leader>A"] = {" Telescope"},
--    ["<leader>AF"] = { "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/') })<cr>", "Files ~" },

    -- find
    ["<leader>t"] = {" Telescope"}, -- Funkar inte trotts att ovan A fungerar
    ["<leader>tF"] = { "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/') })<cr>", "Files ~" },
    ["<leader>tf"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
    ["<leader>tG"] = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", "Ripgrep" },
    ["<leader>tg"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Ripgrep" },
    ["<leader>tb"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    ["<leader>tH"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
    ["<leader>tn"] = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notify" },
    ["<leader>tm"] = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "Keymaps" },
    -- ripgrep 
    ["<leader>gs"] = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/srv') })<cr>", "Ripgrep /srv" },
    ["<leader>ge"] = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/etc') })<cr>", "Ripgrep /etc" },
    ["<leader>gr"] = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('/') })<cr>", "Ripgrep /" },
    ["<leader>gh"] = { "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('~/') })<cr>", "Ripgrep ~/" },
    ["<leader>gg"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Ripgrep" },
  },
}
-- more keybinds!

return M
