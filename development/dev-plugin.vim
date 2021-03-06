    " SyntaX files
    "Plug 'cespare/vim-toml'
    "Plug 'stephpy/vim-yaml'
    
    " Rust language works with syntastic,tagbar and (external) rustfmt
    Plug 'rust-lang/rust.vim'
    Plug 'josa42/vim-lightline-coc'
    " Suports languages with clang format (java,c, etc) dont know what it is
    " http://clang.llvm.org/docs/ClangFormat.html
    "Plug 'rhysd/vim-clang-format'     

    " Conquer of Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " Splits single line to multiline gS gJ
    Plug 'andrewradev/splitjoin.vim'


    "Plug 'dense-analysis/ale'


    Plug 'ryuta69/coc-perl', {'do': 'yarn install && yarn build'}
    " 
    "Plug 'vimwiki/vimwiki'
    "
    " To help write latex in vim
    Plug 'lervag/vimtex'

    Plug 'pearofducks/ansible-vim'

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
