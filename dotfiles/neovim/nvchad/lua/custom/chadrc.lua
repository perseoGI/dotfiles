local M = {}
local userPlugins = require "custom.plugins"

M.plugins = userPlugins
M.mappings = require "custom.mappings"

M.ui = {
   theme = "gruvchad",
   -- theme = "tokyodark",
   -- theme = "gruvbox",
   theme_toggle = { "gruvchad", "gruvbox_light" },
}

return M
