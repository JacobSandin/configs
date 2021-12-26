" ======================================
"    Settings
" ======================================
syntax on
filetype plugin indent on
let maplocalleader = "\<Space>"
let mapleader = ","

if !has('gui_running')
  set t_Co=256
endif

"set completeopt=menu,menuone,preview,noselect,noinsert
"set  termguicolors
set nohlsearch
set mouse=a
"set clipboard=unnamedplus
"set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf8
set cursorline
set timeout ttimeout         " separate mapping and keycode timeouts
set timeoutlen=500             " mapping timeout 250ms  (adjust for preference)
set ttimeoutlen=120           " keycode timeout 20ms
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set spelllang=en
set spelllang+=sv
set updatetime=400
set shortmess+=c
set cmdheight=2
set pastetoggle=<leader>v
set laststatus=2 "for status bar
set colorcolumn=81
set autochdir
set lazyredraw
set scrolloff=5
set sidescrolloff=8
set backspace=indent,eol,start
set history=1000
set hidden
highlight ColorColumn ctermbg=60

" ======================================
"    Check if file have changed after 
"    cursor has moved autoread wont 
"    work witout checktime
" ======================================
set autoread
au CursorHold,CursorHoldI * checktime

" ======================================
"    Keymappings
" ======================================
" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"inoremap <C-k> <up>
"inoremap <C-j> <down>
"inoremap <C-h> <left>
"inoremap <C-l> <right>

"Switching buffer
nnoremap <M-h> :bp<CR>
nnoremap <M-l> :bn<CR>
"nnoremap <up> :Buffers<CR>
"nnoremap <down> :Buffers<CR>

inoremap jj <esc><esc>

nmap <localleader>l $
nmap <localleader>h 0
"nnoremap <S-h> 30<C-w><
"nnoremap <S-l> 30<C-w>>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
nnoremap <leader>b :Buffers<cr>
nnoremap ¤ $

nnoremap <leader>f :FloatermNew --autoclose=2 ranger<cr>
nnoremap <leader>z :FZF<cr>
nnoremap <leader>Z :FZF /<cr>
nnoremap <localleader>z :FZF ~<cr>
nnoremap <leader>g :Rg<cr>
nnoremap <leader>c :e ~/.config/nvim/init.vim<cr>
nnoremap <leader><tab> :call ShowWhiteSpaces()<cr>
"nnoremap <leader>t :bo terminal<cr>
command! SV execute "source ~/.config/nvim/init.vim"

" ======================================
"   Tagbar
" ======================================
"
nmap <leader>n :TagbarToggle<CR>


"nmap <leader>t :FloatermToggle!<CR>
"nmap <F11> :FloatermNew! cd %:p:h&clear<CR>
nmap <leader>t :FloatermToggle!<CR>
nmap <F12> :FloatermToggle!<CR>
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_opener = 'edit'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Rebind so to not have x and X interfere with clipboard
noremap x "_x"
noremap X "_X"
"
" "Aliase" for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Q         quit<bang>
"


let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

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

if has('nvim')
set  termguicolors
set fileencoding=utf-8
" Exit terminal with Escape
tnoremap <Esc> <C-\><C-n>

 if empty(glob('~/.config/nvim/plugged'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif
endif

call plug#begin()
    Plug 'chriskempson/base16-vim'
    " Search with s or S + two chars
    "Plug 'justinmk/vim-sneak'

    "Fuzzy finder mappings needed
    "Files, GFiles, GFiles?, Buffers, Colors, Rg
    "^music .mp3$ sbtrkt !inte 'behövs | eller
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    
    " Powertool for searching f,F,t,T
    Plug 'unblevable/quick-scope'
    
    " Chages dir depending on project
    Plug 'airblade/vim-rooter'

    " Powerline for vim
    Plug 'itchyny/lightline.vim'

    Plug 'majutsushi/tagbar' " Not working with rust without https://github.com/universal-ctags/ctags first remove ctags and etags (exuberant-ctags)
    Plug 'frazrepo/vim-rainbow'
    Plug 'voldikss/vim-floaterm'
    Plug 'liuchengxu/vim-which-key'

if !empty(glob("~/.config/nvim/local-plugin.vim"))
    source ~/.config/nvim/local-plugin.vim 
endif
if !empty(glob("~/.config/nvim/dev-plugin.vim"))
    source ~/.config/nvim/dev-plugin.vim 
endif
call plug#end()

let g:rainbow_active = 1

if has('nvim')
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
" ======================================
"   Base16 color
" ======================================
"
let base16colorspace=256
"colorscheme base16-default-dark
"colorscheme base16-classic-dark
"colorscheme base16-eighties
"colorscheme base16-circus  " Good, not so much wite
"colorscheme base16-chalk
colorscheme base16-atelier-savanna     "A little bright but else good
"colorscheme base16-atelier-plateau  "This one I like
"colorscheme base16-atelier-heath   "good
"colorscheme base16-atelier-forest   "good
"colorscheme base16-atelier-dune     "good
"colorscheme base16-woodland         "good
"colorscheme base16-twilight         "good
"colorscheme base16-tomorrow-night
endif

" ======================================
"   LightLine
" ======================================
"
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component_function': {
      \   'filename': 'FullFileName',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ }

function! FullFileName()
    return expand('%:p')
endfunction
" ======================================
"   vim.sneak
" ======================================
"
let g:sneak#label = 1
"noremap s <Plug>Sneak_s
"noremap S <Plug>Sneak_S
"map f <Plug>Sneak_f
"map F <Plug>Sneak_F
"map t <Plug>Sneak_t
"map T <Plug>Sneak_T


" ======================================
"   FZF Config
" ======================================
" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }
"
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>  "I want escape to close FZF
"command! Rg FloatermNew --width=0.8 --height=0.8 rg

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right / window
let g:fzf_layout = { 'down': '60%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"
"" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }
"
"" Customize fzf colors to match your color scheme
"" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ======================================
"    Quick-scope config
" ======================================
"
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


if !empty(glob("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim 
endif
if !empty(glob("~/.config/nvim/dev.vim"))
    source ~/.config/nvim/dev.vim 
endif
