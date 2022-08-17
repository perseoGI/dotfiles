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
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["williamboman/mason.nvim"] = override.mason,
   },
   remove = {
      "windwp/nvim-autopairs",
      "folke/which-key.nvim"
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
   theme_toggle = { "gruvchad", "gruvbox_light" },
}

return M
