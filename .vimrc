syntax on
let mapleader = "\<Space>"
set shell=/bin/bash
if !has('gui_running')
  set t_Co=256
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'chriskempson/base16-vim'
    Plug 'airblade/vim-rooter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'cespare/vim-toml'
    Plug 'stephpy/vim-yaml'
    Plug 'rust-lang/rust.vim'
    Plug 'rhysd/vim-clang-format'     
    Plug 'racer-rust/vim-racer'        
    Plug 'itchyny/lightline.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'majutsushi/tagbar'
    Plug 'daviesjamie/vim-base16-lightline'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"    Plug 'dense-analysis/ale'
    Plug 'andrewradev/splitjoin.vim'
call plug#end()
colorscheme base16-darktooth 
let g:rustfmt_autosave = 1

set timeout ttimeout         " separate mapping and keycode timeouts
set timeoutlen=250           " mapping timeout 250ms  (adjust for preference)
set ttimeoutlen=40           " keycode timeout 20ms
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set spelllang=en
set spelllang+=sv
set updatetime=50
set cmdheight=2
set pastetoggle=<leader>v
set laststatus=2 "For status bar
set colorcolumn=80

highlight ColorColumn ctermbg=60

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

"Remap hjkl to work in insert with Ctrl
"inoremap <c-k> <up>
"inoremap <c-j> <down>
"inoremap <c-h> <left>
"inoremap <c-l> <right>

" Removed as per default alt-jklh works just fine to exit with
"nnoremap <C-c> <Esc>
"inoremap <C-c> <Esc>
"vnoremap <C-c> <Esc>
"snoremap <C-c> <Esc>
"xnoremap <C-c> <Esc>
"cnoremap <C-c> <Esc>
"onoremap <C-c> <Esc>
"lnoremap <C-c> <Esc>
"tnoremap <C-c> <Esc>
imap jj <Esc><Esc>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Makes dubble enter  insert aline
nmap <CR><CR> o<ESC>

map <C-n> :NERDTreeToggle<CR>
nmap <A-Enter> o<Esc>

"Switching buffer
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Open hotkeys
map <C-p> :Files<CR>
 
   
nmap ä  :
nmap qä q:
cmap ä <BS>
nmap <leader>; :Buffers<CR>

nmap <leader>n :TagbarToggle<CR>
nnoremap <leader>q :call QuickfixToggle()<cr>
" Quick-save
"nmap <leader>w :w<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>q shows stats
"nnoremap <leader>q g<c-g>
nnoremap <leader>f :Files<cr>

nnoremap <leader><tab> :call ShowWhiteSpaces()<cr>
nnoremap <leader>p :call ToggleSpell()<cr>
nnoremap <leader>t :bo terminal<cr>


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


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
let g:toggle_spell=0
function! ToggleSpell() 
    if g:toggle_spell 
        set spell
        g:toggle_spell=0
    else
        set spell!
        g:toggle_spell=1
    endif
endfunction

augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    set winwidth=85
    wincmd =
endfunction

function ShowMouseMode()
    if (&mouse == 'a')
        echo "mouse-vim"
    else
        echo "mouse-xterm"
    endif
endfunction

function SetupLightlineColors() abort
    " transparent background in statusbar
  let l:palette = lightline#palette()
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle
  call lightline#colorscheme()
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

autocmd VimEnter * call SetupLightlineColors()
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set hidden
let g:racer_cmd = "/home/jacsan/.cargo/bin/racer"
let $RUST_SRC_PATH="/home/jacsan/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END

let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction




