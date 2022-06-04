local M = {}

function M.setup(_)
local dap = require('dap')
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '~/utv/git/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000
  }
}
end

return M

