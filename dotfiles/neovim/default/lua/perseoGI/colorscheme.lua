

-- Gruvbox settings
vim.g.gruvbox_contrast_dark = 'hard'
-- Disable invert selection, you are welcome eyes!
vim.g.gruvbox_invert_selection = 0
vim.o.background = 'dark'
vim.o.termguicolors = true

-- remove the file encoding with Github account
vim.g.airline_section_y='@PerseoGI'
-- remove separators for empty sections
--let g:airline_skip_empty_sections = 1

vim.cmd([[
   colorscheme gruvbox
]])
