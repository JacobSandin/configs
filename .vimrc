syntax on 
let mapleader = "\<Space>"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'chriskempson/base16-vim'
    Plug 'airblade/vim-rooter'
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
    Plug 'vifm/vifm.vim'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'andrewradev/splitjoin.vim'
call plug#end()

" Rustfmt autoformats on save.
let g:rustfmt_autosave = 1

set cursorline
set nocompatible
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
set updatetime=80
set cmdheight=2
set pastetoggle=<leader>v
set laststatus=2 "For status bar
set colorcolumn=81
set autoread
set autochdir

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!


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

"Switching buffer
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

nmap <leader>l $
nmap <leader>h 0
nnoremap <S-h> 30<C-w><
nnoremap <S-l> 30<C-w>>

imap ää <Esc><Esc>   
nmap ä  :
nmap qä q:
cmap ä <CR>
nmap <leader>; :Buffers<CR>
nmap ö :VsplitVifm<CR>
nmap <leader>n :TagbarToggle<CR>
nnoremap <leader>q :call QuickfixToggle()<cr>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

nnoremap <leader>f :Files<cr>

nnoremap <leader><tab> :call ShowWhiteSpaces()<cr>
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


function SetupLightlineColors() abort
    " transparent background in statusbar
  let l:palette = lightline#palette()
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle
  call lightline#colorscheme()
endfunction


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

