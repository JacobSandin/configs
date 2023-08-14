---@type MappingsTable
local M = {}
-- In order to disable a default keymap, use
--M.disabled = {
--  n = {
--      ["<leader>h"] = "",
--      ["<C-a>"] = ""
--  }
--}
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
    ["<leader>ss"] = { "<cmd> source ~/.config/nvim/lua/custom/init.lua<CR>", "Reload nvim" },
    ["<c-H>"] = { "<cmd>TmuxNavigateLeft<cr>", "TmuxNavigateLeft" },
    ["<c-J>"] = { "<cmd>TmuxNavigateDown<cr>", "TmuxNavigateDown" },
    ["<c-K>"] = { "<cmd>TmuxNavigateUp<cr>", "TmuxNavigateUp" },
    ["<c-L>"] = { "<cmd>TmuxNavigateRight<cr>", "TmuxNavigateRight" },
    --["<c-\>"] = { "<cmd>TmuxNavigatePrevious<cr>", "TmuxNavigatePrevious" },
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

M.gitsigns = {
  n = {
    -- Navigation through hunks
    ["]"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["["] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
  },
}

return M
