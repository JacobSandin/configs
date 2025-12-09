-- Custom NeoVim options
-- These override NvChad defaults

local opt = vim.opt

-- Clipboard configuration for OSC52
-- This enables yank/paste to work through SSH and tmux using OSC52 escape sequences
-- Works with Kitty terminal and modern terminals that support OSC52

-- Enable unnamedplus to use system clipboard by default
opt.clipboard = "unnamedplus"

-- Local cache for clipboard content (since OSC52 can't read back)
local clipboard_cache = {}

-- OSC52 clipboard provider with local cache
local function copy_osc52(lines, _)
  clipboard_cache = lines
  local text = table.concat(lines, '\n')
  local encoded = vim.base64.encode(text)
  -- Send OSC52 sequence: ESC]52;c;BASE64\BEL
  io.stdout:write(string.format('\027]52;c;%s\007', encoded))
end

local function paste_osc52()
  return clipboard_cache
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
