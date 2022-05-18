local M = {}

function M.setup()
  -- Gruvbox settings
  vim.g.gruvbox_contrast_dark = "hard"
  -- Disable invert selection, you are welcome eyes!
  vim.g.gruvbox_invert_selection = 0
  vim.o.background = "dark"
  vim.o.termguicolors = true


  vim.cmd [[
   colorscheme gruvbox
]]
end

return M

