local M = {}
-- local userPlugins = require "custom.plugins"

-- M.plugins = userPlugins.plugins
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
  theme = "gruvchad",
  -- theme = "tokyodark",
  -- theme = "gruvbox",
  theme_toggle = { "gruvchad", "gruvbox_light" },
  nvdash = { load_on_startup = true },
}

return M
