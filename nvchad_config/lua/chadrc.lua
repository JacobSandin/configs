-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "ayu_light",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
		
		-- Förbättrad kontrast för diff-läge
		DiffAdd = { bg = "#d0f0d0", fg = "#005500", bold = true },
		DiffChange = { bg = "#e0e8ff", fg = "#000080" },
		DiffDelete = { bg = "#ffd0d0", fg = "#880000", bold = true },
		DiffText = { bg = "#b0c8ff", fg = "#000080", bold = true },
		
		-- För bättre synlighet av ändringar
		DiffAdded = { fg = "#006600", bold = true },
		DiffRemoved = { fg = "#990000", bold = true },
		DiffChanged = { fg = "#000099", bold = true },
	},
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
