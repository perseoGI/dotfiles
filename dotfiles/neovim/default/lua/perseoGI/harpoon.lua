
-- no funciona
vim.api.nvim_set_keymap('n', '<Leader>a', [[<cmd>lua require("harpoon.mark").add_file() ]], { noremap = true, silent = true })
