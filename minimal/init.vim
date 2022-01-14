" ======================================
"    Settings
" ======================================
syntax on
filetype plugin on
filetype plugin indent on
let maplocalleader = "\<Space>"
let mapleader = "."


if !has('gui_running')
    set t_Co=256
endif

"set completeopt=menu,menuone,preview,noselect,noinsert
set  termguicolors
set nohlsearch
set mouse=a
"set clipboard=unnamedplus
"set fileencoding=utf-8
set nocompatible    "To add syntax highlight to xml without :syntax on
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
set updatetime=300
set shortmess+=c
set cmdheight=2
set pastetoggle=<leader>p
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
"au CursorHold,CursorHoldI * checktime


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

nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

nnoremap <leader>s <C-W>s
nnoremap <leader>v <C-W>v
nnoremap <C-J> <C-W>+
nnoremap <C-K> <C-W>-
nnoremap <C-L> <C-W>>
nnoremap <C-H> <C-W><


nnoremap <leader>tn :tabnew %<CR>
nnoremap <leader>tc :tabclose<CR>


" goto code navigation.
nnoremap <silent> gi <plug>(coc-implementation)
nnoremap <silent> gr <plug>(coc-references)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gr <plug>(coc-references)

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
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> ¤ $

nnoremap <silent> <leader>f :FloatermNew --autoclose=2 ranger<cr>
nnoremap <silent> <leader>z :FZF<cr>
nnoremap <silent> <leader>Z :FZF /<cr>
nnoremap <silent> <localleader>z :FZF ~<cr>
nnoremap <silent> <localleader>s :syntax on<cr>
nnoremap <silent> <leader>g :Rg<cr>
nnoremap <silent> <leader>cs :source ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>cc :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader><tab> :call ShowWhiteSpaces()<cr>
"nnoremap <leader>t :bo terminal<cr>
command! SV execute "source ~/.config/nvim/init.vim"

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB' ]
" ======================================
"   Tagbar
" ======================================
"
nmap <silent> <leader>n :TagbarToggle<CR>

"nmap <leader>t :FloatermToggle!<CR>
"nmap <F11> :FloatermNew! cd %:p:h&clear<CR>
nmap <silent> <leader>tt :FloatermToggle!<CR>
nmap <silent> <F12> :FloatermToggle!<CR>
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
"set  termguicolors
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
    Plug 'vim-scripts/ZoomWin'  " To maximize a pane and then toggle back C-0
    " Powertool for searching f,F,t,T
    Plug 'unblevable/quick-scope'
    
    " Chages dir depending on project
    "Plug 'airblade/vim-rooter'

    " Powerline for vim
    Plug 'itchyny/lightline.vim'

    Plug 'majutsushi/tagbar' " Not working with rust without https://github.com/universal-ctags/ctags first remove ctags and etags (exuberant-ctags)
    Plug 'frazrepo/vim-rainbow'
    Plug 'voldikss/vim-floaterm'
    Plug 'liuchengxu/vim-which-key' "Shows a quickhelp for leader and localleader

if !empty(glob("~/.config/nvim/local-plugin.vim"))
    source ~/.config/nvim/local-plugin.vim 
endif
if !empty(glob("~/.config/nvim/dev-plugin.vim"))
    source ~/.config/nvim/dev-plugin.vim 
endif
call plug#end()

" For Whichkey
let g:mapleader = "\<Space>"
let g:maplocalleader = '.'
call which_key#register('.', "g:which_key_map")
call which_key#register('<Space>', "g:which_key_map_local")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '.'<CR>
let g:which_key_map = {}
let g:which_key_map_local = {}
"            \'<tab>' : [':call ShowWhiteSpaces()','Toggle white spaces']
"            \}
"let g:which_key_map.d = 'Vimspector'
"let g:which_key_map.t = 'File tabs'
"let g:which_key_map.c = 'Vim config'
let g:which_key_map.z = 'FZF home'
let g:which_key_map.Z = 'FZF root'
let g:which_key_map.n = 'Tagbar'
let g:which_key_map.g = 'Ripgrep'
let g:which_key_map.s = 'Split pane horizontal'
let g:which_key_map.v = 'Split pane vertical'
let g:which_key_map.f = 'Ranger'



let g:rainbow_active = 1
let g:tagbar_width = 30
if has('nvim')
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
" ======================================
"   Base16 color
" ======================================
"
"let base16colorspace=256
let g:impact_transbg=1
"colorscheme base16-default-dark
"colorscheme base16-classic-dark
"colorscheme base16-eighties
"colorscheme base16-circus  " Good not so much wite
"colorscheme base16-chalk
"colorscheme base16-atelier-savanna     "A little bright but else good
colorscheme base16-atelier-plateau  "This one I like
"colorscheme base16-atelier-heath   "good
"colorscheme base16-atelier-forest   "good
"colorscheme base16-atelier-dune     "good
"colorscheme base16-woodland         "good
"colorscheme base16-twilight         "good
"colorscheme base16-tomorrow-night
set t_Co=256
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



