-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
return {
  settings = {
    python = {
      analasis = {
        typeCheckingMode = "off",
      },
    },
  },
}

