-- Default options
require('nightfox').setup({})
-- require('nightfox').setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--     compile_file_suffix = "_compiled", -- Compiled file suffix
--     transparent = false,    -- Disable setting background
--     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false,   -- Non focused panes set to alternative background
--     styles = {              -- Style to be applied to different syntax groups
--       comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
--       conditionals = "NONE",
--       constants = "NONE",
--       functions = "NONE",
--       keywords = "NONE",
--       numbers = "NONE",
--       operators = "NONE",
--       strings = "NONE",
--       types = "NONE",
--       variables = "NONE",
--     },
--     inverse = {             -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--     modules = {             -- List of various plugins and additional options
--       -- ...
--     },
--   }
-- })

-- setup must be called before loading
--vim.cmd("colorscheme dawnfox")
--vim.cmd("colorscheme terafox")
--vim.cmd("colorscheme duskfox")
--vim.cmd("colorscheme nightfox")
--vim.cmd("colorscheme dayfox")
vim.cmd("colorscheme nordfox")
vim.cmd("hi Visual  guifg=#c0c6cf guibg=#556173 gui=none")
if vim.opt.diff:get() then
  vim.cmd([[
    set cursorline
    map ] ]c
    map [ [c
  colorscheme evening
"    hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=bold guifg=White guibg=#E08F4C
"    hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=bold guifg=Yellow guibg=#F54D20
"    hi DiffDelete   gui=bold    guifg=#ff8080       guibg=Gray
"    hi DiffAdd      gui=none    guifg=Gray         guibg=#ff8080

  ]])
end
