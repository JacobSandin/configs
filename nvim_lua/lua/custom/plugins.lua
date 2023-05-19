local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
     opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
    override = {
    ["nvim-telescope/telescope.nvim"] = {
      defaults = {
        opts = function()
          return require "plugins.configs.telescope"
        end,
        config = function(_, opts)
          dofile(vim.g.base46_cache .. "telescope")
          local telescope = require "telescope"
          telescope.setup(opts)
          -- load extensions
          for _, ext in ipairs(opts.extensions_list) do
            telescope.load_extension(ext)
          end
        end,
        mappings = {
          i = {
          },
        },
      },
    },
--    ["folke/which-key.nvim"] = {
--      defaults = {
--        keys = { "<leader>", '"', "'", "`", "c", "v" },
--        init = function()
--          --require("core.utils").load_mappings "whichkey"
--        end,
--        config = function(_, opts)
--          dofile(vim.g.base46_cache .. "whichkey")
--          require("which-key").setup(opts)
--          vim.o.timeout = true
--          vim.o.timeoutlen = 300
--          local wk = require("which-key")
--          wk.register({
--            n = {
--              Q = {
--                name = "File",
--                f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--              }
--            }
--          })
--        end,
--        mappings = {
--          Z = {
--            name = "KADFADSÖLFKA",
--              f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--          },
--        },
--      },
--    },
  },
  { 
    "p00f/nvim-ts-rainbow"
  },
  { 
    'ggandor/lightspeed.nvim',
    lazy = false,
  },
  {
--    "nvim-telescope/telescope.nvim",
--    cmd = "Telescope",
--    init = function()
--      require("core.utils").load_mappings "telescope"
--    end,
--    opts = function()
--      return require "plugins.configs.telescope"
--    end,
--    config = function(_, opts)
--      dofile(vim.g.base46_cache .. "telescope")
--      local telescope = require "telescope"
--      telescope.setup(opts)
--
--      -- load extensions
--      for _, ext in ipairs(opts.extensions_list) do
--        telescope.load_extension(ext)
--      end
--    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  
  -- Only load whichkey after all the gui
}

return plugins
