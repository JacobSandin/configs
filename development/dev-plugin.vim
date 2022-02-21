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
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

    " Splits single line to multiline gS gJ
    Plug 'andrewradev/splitjoin.vim'
    
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'

    " Debugging
    "Plug 'nvim-lua/plenary.nvim'
    "Plug 'mfussenegger/nvim-dap' "Debugger, fugerar bara i nvim
    ""Plug 'rcarriga/nvim-dap-ui' "Inte testat ännu
    "Plug 'nvim-telescope/telescope.nvim'
    "Plug 'romgrk/fzy-lua-native'
    "Plug 'nvim-telescope/telescope-fzy-native.nvim'
    "Plug 'Pocco81/DAPInstall.nvim' "For dap debugger, to help install for languages.
    Plug 'puremourning/vimspector' " Debugger, lite väl tung.
    "Plug 'dense-analysis/ale'
    
    Plug 'majutsushi/tagbar' " Not working with rust without https://github.com/universal-ctags/ctags first remove ctags and etags (exuberant-ctags)

    Plug 'ryuta69/coc-perl', {'do': 'yarn install && yarn build'}
    " 
    "Plug 'vimwiki/vimwiki' "I local-plugin.vim
    "
    " To help write latex in vim
    Plug 'lervag/vimtex'

    Plug 'pearofducks/ansible-vim'
    
    Plug 'ludovicchabant/vim-gutentags' "To build ctags so that I can use goto in coc

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }

    Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
