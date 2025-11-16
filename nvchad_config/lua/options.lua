-- Custom NeoVim options
-- These override NvChad defaults

local opt = vim.opt

-- Clipboard configuration for OSC52
-- This enables yank/paste to work through SSH and tmux using OSC52 escape sequences
-- Works with Kitty terminal and modern terminals that support OSC52

-- Use system clipboard via OSC52
-- NeoVim 0.10+ has built-in OSC52 support
if vim.fn.has('nvim-0.10') == 1 then
  -- Modern NeoVim with native OSC52 support
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
else
  -- Fallback for older NeoVim versions
  -- Use tmux's set-clipboard which will handle OSC52
  vim.g.clipboard = {
    name = 'tmux',
    copy = {
      ['+'] = 'tmux load-buffer -',
      ['*'] = 'tmux load-buffer -',
    },
    paste = {
      ['+'] = 'tmux save-buffer -',
      ['*'] = 'tmux save-buffer -',
    },
    cache_enabled = 1,
  }
end

-- Enable clipboard
opt.clipboard = "unnamedplus"
