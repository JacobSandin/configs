    vim.cmd[[
    let g:vimspector_adapters = #{
    \   php-actor: #{ extends: 'phpactor' }
    \ }


    let g:vimspector_configurations = {
  \    "php_phpactor_config": {
  \    "adapter": "php-actor",
  \    "filetypes": [ "php" ],
  \    "configuration": {
  \      "name": "Listen for XDebug",
  \      "type": "php",
  \      "request": "launch",
  \      "port": 9000,
  \      "stopOnEntry": v:false
  \    }
  \  }
  \}
        " basedir does not work it seem
        "let g:vimspector_base_dir=expand( '$HOME/utv/git/config/nvim_lua/vimspector' )
        let g:vimspector_enable_mappings = 'HUMAN'
      ]]


