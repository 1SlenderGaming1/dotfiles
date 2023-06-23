---@type ChadrcConfig 
local M = {}
local highlights = require "custom.highlights"

M.ui = {
  theme = 'tokyonight',
  hl_override = highlights.override,
  -- h1_add = highlights.add,
}

M.plugins = "custom.plugins"

-- M.mappings = require "custom.mappings"

return M