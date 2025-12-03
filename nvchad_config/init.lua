vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = ","

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Förbättrad diff-kontrast och visual selection
local function setup_custom_highlights()
  -- Diff-färger
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#d0f0d0", fg = "#005500", bold = true })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#e0e8ff", fg = "#000080" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#ffd0d0", fg = "#880000", bold = true })
  vim.api.nvim_set_hl(0, "DiffText", { bg = "#b0c8ff", fg = "#000080", bold = true })
  -- Markerad text (visual selection)
  vim.api.nvim_set_hl(0, "Visual", { bg = "#b0d0ff", fg = "#000000" })
end

-- Kör vid uppstart (efter att NvChad laddat temat)
vim.defer_fn(setup_custom_highlights, 0)

-- Kör även vid temaändringar
vim.api.nvim_create_autocmd("ColorScheme", { callback = setup_custom_highlights })
