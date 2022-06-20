local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("kyazdani42/nvim-tree.lua")
  use("rcarriga/nvim-notify")
  use("ggandor/lightspeed.nvim")

  use("EdenEast/nightfox.nvim")
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use("lunarvim/darkplus.nvim")

  --use "SirVer/ultisnips"
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  use("honza/vim-snippets")
  -- LSPj
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  --use("jose-elias-alvarez/null-ls.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")

  -- Floaterm
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf.vim'
  use 'junegunn/fzf'
  --use 'voldikss/fzf-floaterm'

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-frecency.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "tami5/sqlite.lua" })
  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/playground")
  --use("Pocco81/dap-buddy.nvim")
  -- Debugging
  use({
    "puremourning/vimspector",
    config = function()
      vim.cmd[[
        " basedir does not work it seem
        "let g:vimspector_base_dir=expand( '$HOME/utv/git/config/nvim_lua/vimspector' )
        let g:vimspector_enable_mappings = 'HUMAN'
      ]]
    end,
  })

--  use({
--    "mfussenegger/nvim-dap",
--    opt = true,
--    event = "BufReadPre",
--    module = { "dap" },
--    wants = { "nvim-dap-virtual-text", "dap-buddy.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
--    requires = {
--      { "Pocco81/dap-buddy.nvim", branch = "dev" },
--      "theHamsta/nvim-dap-virtual-text",
--      "rcarriga/nvim-dap-ui",
--      "mfussenegger/nvim-dap-python",
--      "nvim-telescope/telescope-dap.nvim",
--      { "leoluz/nvim-dap-go", module = "dap-go" },
--      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
--    },
--    config = function()
--      require("user.dap").setup()
--    end,
--  })
  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
