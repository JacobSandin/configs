---@type ChadrcConfig
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
local M = {}

M.ui = {
  theme = "github_egen",

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
