local M = {}

function M.setup(_)
local dap = require "dap"
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/utv/git/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
    log = true,
    --localSourceRoot = '/usr/local/vufind/',
  }
}
end

return M

