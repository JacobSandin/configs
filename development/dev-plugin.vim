
call plug#begin()
    " Syntax files
    "Plug 'cespare/vim-toml'
    "Plug 'stephpy/vim-yaml'
    
    " Rust language works with syntastic,tagbar and (external) rustfmt
    Plug 'rust-lang/rust.vim'

    " Suports languages with clang format (java,c, etc) dont know what it is
    " http://clang.llvm.org/docs/ClangFormat.html
    "Plug 'rhysd/vim-clang-format'     

    " Conquer of Completion
    "Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " Splits single line to multiline gS gJ
    Plug 'andrewradev/splitjoin.vim'

    " 
    "Plug 'vimwiki/vimwiki'
call plug#end()


