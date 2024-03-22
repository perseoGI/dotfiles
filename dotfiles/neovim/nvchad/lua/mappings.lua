local map = vim.keymap.set

-- General

-- Go to  beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

map("i", "<C-c>", "<esc>", { desc = "" })

-- Navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })

-- Move lines up/down while on insert mode
map("i", "<C-u>", "<esc>viw~ea", { desc = "Capitalize or lower case current word" })
map("i", "<c-j>", "<esc>:m .+1<CR>==a", { desc = "Move line down while insert mode" })
map("i", "<c-k>", "<esc>:m .-2<CR>==a", { desc = "Move line up while insert mode" })

-- Make Y as it should be!
map("n", "Y", "y$", { desc = "yank to end of line" })

-- Remap convenient change between windows commands
map("n", "<leader>h", "<C-w>h", { desc = "Window left" })
map("n", "<leader>k", "<C-w>k", { desc = "Window up" })
map("n", "<leader>l", "<C-w>l", { desc = "Window right" })
map("n", "<leader>j", "<C-w>j", { desc = "Window down" })

map("n", "<leader>s", "<cmd> w <CR>", { desc = "Save file" })

-- Remove help message "Type :qa ..."
map("n", "<C-c>", "<silent> <C-c>", { desc = "nil" })

-- Buffer resizing
map("n", "<Leader>+", "<cmd> vertical resize +5<CR>", { desc = "Resize window" })
map("n", "<Leader>-", "<cmd> vertical resize -5<CR>", { desc = "Resize window" })
map("n", "<Leader>rp", "<cmd> resize 100<CR>", { desc = "Resize 100 window" })

-- Keep movements centered
map("n", "n", "nzzzv", { desc = "Next match centered" })
map("n", "N", "Nzzzv", { desc = "Prev match centered" })
map("n", "J", "mzJ`zmz", { desc = "Center J" })

-- Automatically save movements larger than 5 lines to the jumplist (useful for
-- relativenumber)
-- TODO fix "
-- map("n", "<expr>k", "v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'", { desc = "Relative jump save to jumplist" })
-- map("n", "<expr>j", "v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'", { desc = "Relative jump save to jumplist" })

-- From justinmk
map("n", "gj", "i<c-j><esc>k$", { desc = "Un-join (split) the current line at the cursor position " })
map("n", "gV", "`[v`]", { desc = "Select last inserted text" })

map("n", ",p", '"0p', { desc = "Paste from 0 registre easily" })
map("n", "<Leader>i", "gg=G<C-o>", { desc = "Auto indent all file" })

-- Quick fix list

-- TIP: <c-q> inside Telescope search and it will load all results on quickfix list
-- TIP: <a-a> or <Tab>/<S-Tab> inside Rg search to select files and <Enter> to
-- load all results on quickfix list
--
-- :cfdo <command>
-- Example: :cfdo s/pattern/replacePattern/gc | update
map("n", "<c-j>", "<cmd> call QFList(1)<CR>", { desc = "QFix next" })
map("n", "<c-k>", "<cmd> call QFList(0)<CR>", { desc = "QFix prev" })

map("n", "<leader>gth", "<cmd> ClangdSwitchSourceHeader<CR>", { desc = "Switch source header" })

-- Diff
map("n", "<leader>dt", "<cmd>diffthis<CR>", { desc = "Diff current buffer" })
map("n", "<leader>dg", "<cmd>diffget<CR>", { desc = "Diff get differences" })

-- X as a i<backspace>
map("v", "X", '"_d', { desc = "i<backspace>" })

-- Visual-Line move lines up or down
map("v", "J", "<cmd> m '>+1<CR>gv=gv", { desc = "Visual movement line up" })
map("v", "K", "<cmd> m '<-2<CR>gv=gv", { desc = "Visual movement line down" })

map("v", ">", ">gv", { desc = "Visual selection after shifting" })
map("v", "<", "<gv", { desc = "Visual selection after shifting" })

map("x", ".", "<cmd> normal .<CR>", { desc = "Repeat last command for each line of a visual selection" })
-- Visual Line macros: apply a macro to multiple lines by:
--   1. Recording a macro
--   2. Selecting multiple lines with V-Line mode
--   3. Applying macro to those lines
map("x", "@", "<cmd> <C-u>call ExecuteMacroOverVisualRange()<CR>", { desc = "" })

-- Operator pending mappings
-- Same as Xi(  shorted to Xp
map("o", "p", "i(", { desc = "" })
map("o", "l", "i{", { desc = "" })
map("o", "r", "/return<cr>", { desc = "" })
map("o", "in(", "<cmd> <c-u>normal! f(vi(<cr>", { desc = "" })
map("o", "il(", "<cmd> <c-u>normal! F)vi(<cr>", { desc = "" })
map("o", "in{", "<cmd> <c-u>normal! f{vi{<cr>", { desc = "" })
map("o", "il{", "<cmd> <c-u>normal! F}vi{<cr>", { desc = "" })

-- Terminal TODO
-- map("t", "<C-l>", "<C-\><C-n><C-W>l", { desc = "" })
-- map("t", "<C-k>", "<C-\><C-n><C-W>k", { desc = "" })
-- map("t", "<C-j>", "<C-\><C-n><C-W>j", { desc = "" })
-- map("t", "<esc>", "<C-\><C-n>", { desc = "" })
-- map("t", "<C-h>", "<C-\><C-n><C-W>h", { desc = "" })

-- Bufferline

map("n", "<C-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<C-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

-- LSP config

map("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = " LSP declaration" })
map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = " LSP definition" })
map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = " LSP hover" })
map("n", "<leader>gi", function()
  vim.lsp.buf.implementation()
end, { desc = " LSP implementation" })
map("n", "<leader>D", function()
  vim.lsp.buf.type_definition()
end, { desc = " LSP definition type" })
map("n", "<leader>rr", function()
  vim.lsp.buf.rename()
end, { desc = " LSP rename" })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = " LSP code_action" })
map("n", "<leader>gr", function()
  vim.lsp.buf.references()
end, { desc = " LSP references" })
map("n", "<leader>f", function()
  vim.diagnostic.open_float()
end, { desc = " Floating diagnostic" })
map("n", "<leader>[", function()
  vim.diagnostic.goto_prev()
end, { desc = " Goto prev" })
map("n", "<leader>]", function()
  vim.diagnostic.goto_next()
end, { desc = " Goto next" })
map("n", "<leader>q", function()
  vim.diagnostic.setloclist()
end, { desc = " Diagnostic setloclist" })
-- map("n", "<leader>fo", function() vim.lsp.buf.formatting() end, { desc = "   lsp formatting" })
map("n", "<leader>wa", function()
  vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })
map("n", "<leader>wr", function()
  vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })
map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- hlslens

map(
  "n",
  "n",
  "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
  { desc = "hlslens next" }
)
map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", { desc = "hlnlens g#" })
map(
  "n",
  "N",
  "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
  { desc = "hlslens prev" }
)
map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", { desc = "hlnlens g*" })
map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", { desc = "hlnlens *" })
map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", { desc = "hlnlens #" })

-- harpoon

map("n", "<leader>e", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Open harpoon menu" })
map("n", "<leader>a", "<cmd> lua require('harpoon.mark').add_file()<CR>", { desc = "Add harpoon file" })

-- Nvimtree

map("n", "<leader>pv", "<cmd> NvimTreeToggle <CR>", { desc = " Toggle nvimtree" })

-- Gitworktree

map(
  "n",
  "<leader>gc",
  "<Cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  { desc = "Create git-worktree" }
)
map(
  "n",
  "<leader>gw",
  "<Cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  { desc = "Switch git-worktree" }
)

-- Gitsigns

map("n", "]h", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Next git sign" })
map("n", "[h", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Prev git sign" })

map("x", "ih", "<cmd>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })

map("o", "ih", "<cmd>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })

-- Trouble

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")

-- Undotreeshow

map("n", "<leader>u", "<cmd> UndotreeShow<CR>", { desc = "Open UndotreeShow" })

-- Refactoring

map("v", "<leader>rf", function()
  require("telescope").extensions.refactoring.refactors()
end, { desc = " Treesitter refactoring" })

-- Neoformat

map("n", "<leader>fo", "<cmd>Neoformat<cr>", { desc = " LSP formatting" })

-- Nvterm

map("n", "<leader>t", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = " Toggle horizontal term" })
map("n", "<leader>T", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = " Toggle vertical term" })

-- Maximizer

map("n", "<leader>m", "<cmd> MaximizerToggle!<CR>", { desc = "Toggle buffer maximizer" })

-- Telescope

map("n", "<leader>pt", "<cmd> Telescope terms <CR>", { desc = " Pick hidden term" })
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = " Nvchad themes" })
map("n", "<C-p>", "<cmd> Telescope git_files <CR>", { desc = " Git files" })
map("n", "<leader>pm", "<cmd> Telescope media_files <CR>", { desc = " Find media" })
map(
  "n",
  "<leader>ps",
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
  { desc = "" }
)
map("n", "<leader>pk", "<cmd> Telescope keymaps <CR>", { desc = " Show keys" })
map(
  "n",
  "<leader>pw",
  "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>",
  { desc = "Grep" }
)
map("n", "<leader>gl", "<cmd> Telescope git_commits <CR>", { desc = " Git commits" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = " Live grep" })
map("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = " Git status" })
map("n", "<leader>pb", "<cmd> Telescope buffers <CR>", { desc = " Find buffers" })
map("n", "<leader>pf", "<cmd> Telescope find_files<CR>", { desc = " Find all" })
