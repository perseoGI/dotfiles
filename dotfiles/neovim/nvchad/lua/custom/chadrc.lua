local M = {}

local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"

M.options = {
   user = function()
       require("custom.options")
   end,
}

M.plugins = {
   override = {
      ["NvChad/nvterm"] = override.nvterm,
      ["nvim-telescope/telescope.nvim"] = override.telescope,
   },
   remove = {
      "windwp/nvim-autopairs"
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   user = userPlugins,
}

M.mappings = require "custom.mappings"

M.ui = {
   theme = "gruvchad",
   -- theme = "tokyodark",
   -- theme = "gruvbox",
}

return M
