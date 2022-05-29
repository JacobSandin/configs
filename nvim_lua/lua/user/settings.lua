local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
--local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options_info

g.syntax_on = true
--g:filetype = 1

opt.undodir = os.getenv( "HOME" ) .. '/.config/nvim/undodir' -- Does not seem to use ~
opt.undofile = true
opt.termguicolors = true
opt.completeopt = {'menuone', 'noselect', 'noinsert' }  -- Completion options (for deoplete)
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.softtabstop = 2
opt.termguicolors = true            -- True color support
opt.wildmode = {'full'}  -- Command-line completion mode
--opt.wildchar = '<Tab>'
opt.wrap = false                    -- Disable line wrap

opt.modifiable = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.timeoutlen = 500
opt.ttimeoutlen = 120
opt.mouse = "a"
opt.cursorline = true
opt.swapfile = false
opt.backup = false

opt.spelllang = "en,sv"
opt.spell = true
opt.updatetime = 300
opt.cmdheight = 2
opt.pastetoggle="<leader>p"
opt.colorcolumn = "81"
--
vim.cmd [[
"set undodir=~/.config/nvim/undodir
" ======================================
"    Keymappings
" ======================================
" Remove newbie crutches in Command Mode
"cnoremap <Down> <Nop>
"cnoremap <Left> <Nop>
"cnoremap <Right> <Nop>
"cnoremap <Up> <Nop>
"
" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>

nnoremap <leader>s <C-W>s
nnoremap <leader>v <C-W>v
nnoremap <C-J> <C-W>+
nnoremap <C-K> <C-W>-
nnoremap <C-L> <C-W>>
nnoremap <C-H> <C-W><

nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>t+ :tabnew %<CR>
nnoremap <leader>tc :tabclose<CR>

" goto code navigation.
nnoremap <silent> gi <plug>(coc-implementation)
nnoremap <silent> gr <plug>(coc-references)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gr <plug>(coc-references)

"Switching buffer
nnoremap <silent> <Left> :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Up> :tabnext<CR>
nnoremap <silent> <Down> :tabprev<CR>
nnoremap <silent> <leader>tt :tabnew<CR>

inoremap jj <esc><esc>

nmap <localleader>l $
nmap <localleader>h 0
"nnoremap <S-h> 30<C-w><
"nnoremap <S-l> 30<C-w>>

nmap <localleader>c :RustDebuggables<CR>
nmap <localleader>o :lua require'dap'.step_over()<CR>
nmap <localleader>i :lua require'dap'.step_into()<CR>
nmap <localleader>b :lua require'dap'.toggle_breakpoint()<CR>

" <leader><leader> toggles between buffers
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> ¤ $
nmap <silent> <leader>m :History<CR>
nnoremap <silent> <leader>r :FloatermNew --autoclose=2 ranger<cr>
nnoremap <silent> <leader>z :FZF<cr>
nnoremap <silent> <leader>Z :FZF /<cr>
nnoremap <silent> <localleader>z :FZF ~<cr>
nnoremap <silent> <localleader>s :syntax on<cr>
nnoremap <silent> <leader>g :Rg<cr>
if has('win32')
    nnoremap <silent> <leader>cs :source ~/.config/nvim/init.vim<cr>
    nnoremap <silent> <leader>cc :e ~/.config/nvim/init.vim<cr>
    command! SV execute "source ~/.config/nvim/init.vim"
elseif has('unix')
    nnoremap <silent> <leader>cs :source ~/.config/nvim/init.vim<cr>
    nnoremap <silent> <leader>cc :e ~/.config/nvim/init.vim<cr>
    command! SV execute "source ~/.config/nvim/init.vim"
endif
nnoremap <silent> <leader><tab> :call ShowWhiteSpaces()<cr>
"nnoremap <leader>t :bo terminal<cr>

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <Leader>di <Plug>VimspectorBalloonEval
"let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB' ]
" ======================================
"   Tagbar
" ======================================
"
nmap <silent> <leader>n :TagbarToggle<CR>

"nmap <leader>t :FloatermToggle!<CR>
"nmap <F11> :FloatermNew! cd %:p:h&clear<CR>
nmap <silent> <leader>f :FloatermToggle!<CR>
nmap <silent> <F12> :FloatermToggle!<CR>
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_opener = 'edit'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Rebind so to not have x and X interfere with clipboard
"noremap x "_x"
"noremap X "_X"
"
" "Aliase" for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Q         quit<bang>
"



" ======================================
"    My functions
" ======================================
"

let g:show_spaces_set=1
function! ShowWhiteSpaces()
    if g:show_spaces_set
        set lcs=space:·
        set list
        let g:show_spaces_set=0
    else
        set lcs=
        set list!
        let g:show_spaces_set=1
    endif
endfunction
                
" ======================================
"    Plugins
" ======================================
"

"if has('nvim')
"set  termguicolors
set fileencoding=utf-8
]]
