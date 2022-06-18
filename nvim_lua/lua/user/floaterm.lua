vim.cmd([[
" default let g:floaterm_shell            = get(g:, 'floaterm_shell', &shell)
" default let g:floaterm_title            = get(g:, 'floaterm_title', 'floaterm($1/$2)')
" default let g:floaterm_width            = get(g:, 'floaterm_width', 0.6)
" default let g:floaterm_height           = get(g:, 'floaterm_height', 0.6)
" default let g:floaterm_wintype          = get(g:, 'floaterm_wintype', 'float')
" default let g:floaterm_autoclose        = get(g:, 'floaterm_autoclose', 1)
" default let g:floaterm_autoinsert       = get(g:, 'floaterm_autoinsert', v:true)
" default let g:floaterm_autohide         = get(g:, 'floaterm_autohide', 1)
" default let g:floaterm_position         = get(g:, 'floaterm_position', 'center')
" default let g:floaterm_borderchars      = get(g:, 'floaterm_borderchars', '─│─│┌┐┘└')
" default let g:floaterm_rootmarkers      = get(g:, 'floaterm_rootmarkers', ['.project', '.git', '.hg', '.svn', '.root'])
" default let g:floaterm_opener           = get(g:, 'floaterm_opener', 'split')

"let g:floaterm_shell
"let g:floaterm_title
let g:floaterm_width=90
"let g:floaterm_height
let g:floaterm_wintype="vsplit"
"let g:floaterm_autoclose
"let g:floaterm_autoinsert
"let g:floaterm_autohide
let g:floaterm_position="right"
"let g:floaterm_borderchars
"let g:floaterm_rootmarkers
"let g:floaterm_opener


tnoremap <silent> <localleader>m <C-\><C-n>:FloatermToggle<CR>
"""nnoremap <silent> <localleader>m :FloatermToggle --position=right --width=90 --wintype=vsplit<CR>
"command! FZF FloatermNew --width=0.6 --wintype=float --position=center fzf
"command! Rg FloatermNew --width=0.8 --height=0.8 --wintype=float --position=center rg
command! Lg FloatermNew --width=0.8 --height=0.8 --wintype=float --position=center lazygit

]])
local whichkey = require "which-key"

--whichkey.register({
--  m = {"<C\\><Cn>:FloatermToggle", "Term toggle"},
--}, {
--  mode = "t",
--  prefix = "<localleader>",
--  buffer = nil,
--  silent = true,
--  noremap = true,
--  nowait = false,
--})

whichkey.register({
  m = {":FloatermToggle<cr>", "Term toggle"},
}, {
  mode = "n",
  prefix = "<localleader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
