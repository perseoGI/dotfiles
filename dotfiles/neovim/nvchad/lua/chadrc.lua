local M = {}

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "gruvbox_light" },
  nvdash = { load_on_startup = true },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
