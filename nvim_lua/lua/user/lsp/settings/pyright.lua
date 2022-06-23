-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
--require'lspconfig'.pyright.setup {
--  settings = {
--    python = {
--      analasis = {
--        --typeCheckingMode = "strict",
--      },
--    },
--  },
--}

return {
  settings = {
    python = {
      analasis = {
        --typeCheckingMode = "strict",
      },
    },
  },
}
