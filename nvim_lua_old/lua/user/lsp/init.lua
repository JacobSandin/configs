local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.lsp-installer")
--require("user.lsp.settings.sumneko_lua")
--require("user.lsp.settings.pyright")
--require("user.lsp.settings.psalm")
----require("user.lsp.settings.phpactor")
--require("user.lsp.settings.jsonls")
require("user.lsp.handlers").setup()
vim.lsp.set_log_level("debug")
