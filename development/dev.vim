lua <<EOF
    require'lspconfig'.pyright.setup{}
EOF

"let g:ale_rust_rls_config = {
"	\ 'rust': {
"		\ 'all_targets': 1,
"		\ 'build_on_save': 1,
"		\ 'clippy_preference': 'on'
"	\ }
"	\ }
"let g:ale_rust_rls_toolchain = ''
"let g:ale_rust_rls_executable = 'rust-analyzer'
"let g:ale_fixers = {'rust': ['rustfmt']}
"let g:ale_linters = {'rust': ['analyzer']}

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
let g:tex_flavor = 'latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
"let g:vimtex_compiler_method = "latexmk"
"
"let g:vimtex_compiler_latexmk = { 
"        \ 'executable' : 'latexmk',
"        \ 'options' : [ 
"        \   '-xelatex',
"        \   '-file-line-error',
"        \   '-synctex=1',
"        \   '-interaction=nonstopmode',
"        \ ],
"        \}
"let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rls'],
"    \ 'haskell': ['ghcide', '--lsp'],
"    \ }
"

"let g:lightline = {
"      \ 'colorscheme': 'jellybeans',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'filename', 'modified' ], [ 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ] ]
"      \ },
"\ }
" register compoments:
call lightline#coc#register()

lua <<EOF


-- Update this path
local extension_path = '/home/jacsan/.vscode-server/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    -- ... other configs
            args = {'--', 'adfadfadfa'},
    
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path),
            args = {'--', 'adfadfadfa'}
    }
}
require('rust-tools').setup(opts)
--require("dapui").setup()

-- Command:
-- RustSetInlayHints
-- RustDisableInlayHints 
-- RustToggleInlayHints 

-- set inlay hints
require('rust-tools.inlay_hints').set_inlay_hints()
require('rust-tools.runnables').runnables()

EOF


