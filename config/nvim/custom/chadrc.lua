---@type ChadrcConfig
local M = {}

M.mappings = require 'custom.mappings'
M.plugins = 'custom.plugins'
M.ui = { 
  theme = 'catppuccin',
  cheatsheet = { theme = "simple"}
}

return M
