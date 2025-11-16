-- Custom NeoVim options
-- These override NvChad defaults

local opt = vim.opt

-- Clipboard configuration for OSC52
-- This enables yank/paste to work through SSH and tmux using OSC52 escape sequences
-- Works with Kitty terminal and modern terminals that support OSC52

-- Enable unnamedplus to use system clipboard
opt.clipboard = "unnamedplus"

-- OSC52 clipboard provider
-- This function sends OSC52 escape sequences to copy text
local function copy_osc52(lines, _)
  local text = table.concat(lines, '\n')
  local encoded = vim.base64.encode(text)
  -- Send OSC52 sequence: ESC]52;c;BASE64\BEL
  io.stdout:write(string.format('\027]52;c;%s\007', encoded))
end

local function paste_osc52()
  return {}  -- Paste not supported via OSC52, use tmux buffer
end

-- Set up custom clipboard provider
vim.g.clipboard = {
  name = 'OSC52',
  copy = {
    ['+'] = copy_osc52,
    ['*'] = copy_osc52,
  },
  paste = {
    ['+'] = paste_osc52,
    ['*'] = paste_osc52,
  },
}
