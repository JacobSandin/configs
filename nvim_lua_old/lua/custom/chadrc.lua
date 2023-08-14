---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_egen",

  nvdash = {
    load_on_startup = true,
  },
--  changed_themes = {
--    github_light = {
--      base_16 = {
--          base0B = "#f06800", -- Strings, Inherited Class, Markup Code, Diff Inserted
--          base08 = "#df2800", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
--          base0A = "#df2800", -- Classes, Markup Bold, Search Text Background
--      },
--
--      base_30 = {
--        grey_fg = "green",
--      }
--    },
--  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
