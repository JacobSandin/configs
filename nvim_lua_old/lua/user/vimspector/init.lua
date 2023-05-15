    vim.cmd[[
    let g:vimspector_adapters = #{
    \   php-actor: #{ extends: 'vscode-php-debug' }
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
  \    },
  \    "breakpoints":{
  \        "exception": {
  \           "Notice": "N",
  \           "Warning": "N",
  \           "Error": "Y",
  \           "Exception": "Y",
  \           "*": "N",
  \        }
  \     }
  \  }
  \}
        " basedir does not work it seem l e t g:vimspector_base_dir=expand( '$HOME/utv/git/config/nvim_lua/vimspector' )
        let g:vimspector_enable_mappings = 'HUMAN'
      ]]


--{
--  "configurations": {
--    "Listen for XDebug": {
--      "adapter": "vscode-php-debug",
--      "filetypes": [ "php" ], // optional
--      "configuration": {
--        "name": "Listen for XDebug",
--        "type": "php",
--        "request": "launch",
--        "port": 9000,
--        "stopOnEntry": false
--      }
--    }
--  }
--}
