local map = vim.keymap.set
local cmd = vim.keymap.cmd

-- General

-- Go to  beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

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
map("n", "<C-c>", "<Esc>", { silent = true, desc = "nil" })
map("n", "<Esc>", "<Esc>:noh<CR>", { silent = true, desc = "nil" })

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

-- Visual Line macros: apply a macro to multiple lines by:
map("n", ",p", '"0p', { desc = "Paste from 0 register easily" })

-- TODO review
-- map({"n", "v"}, "<leader>y", [["+y]])
-- map("x", "<leader>pp", [["_dP]])

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

-- Terminal
map("t", "<C-l>", "<C-\\><C-n><C-W>l", { desc = "" })
map("t", "<C-k>", "<C-\\><C-n><C-W>k", { desc = "" })
map("t", "<C-j>", "<C-\\><C-n><C-W>j", { desc = "" })
map("t", "<esc>", "<C-\\><C-n>", { desc = "" })
map("t", "<C-h>", "<C-\\><C-n><C-W>h", { desc = "" })

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

-- Harpoon

map("n", "<leader>e", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Open harpoon menu" })
map("n", "<leader>a", "<cmd> lua require('harpoon.mark').add_file()<CR>", { desc = "Add harpoon file" })

-- Harpoon nav files
map("n", "<A-a>", function() require("harpoon.ui").nav_file(1) end, { desc = "Navigate to file 1"})
map("n", "<A-o>", function() require("harpoon.ui").nav_file(2) end, { desc = "Navigate to file 2"})
map("n", "<A-e>", function() require("harpoon.ui").nav_file(3) end, { desc = "Navigate to file 3"})
map("n", "<A-u>", function() require("harpoon.ui").nav_file(4) end, { desc = "Navigate to file 4"})
map("n", "<A-i>", function() require("harpoon.ui").nav_file(5) end, { desc = "Navigate to file 5"})

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
require("gitsigns").setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "<leader>h.", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Go to next git hunk" })


    map("n", "<leader>h,", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Go to prev git hunk" })

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
    map("v", "<leader>hs", function()
      gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, { desc = "Stage hunk" })
    map("v", "<leader>hr", function()
      gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, { desc = "Reset hunk" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Stage undo" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
    map("n", "<leader>hb", function()
      gs.blame_line { full = true }
    end, { desc = "Blame line" })
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
    map("n", "<leader>hd", gs.diffthis, { desc = "Diffthis" })
    map("n", "<leader>hD", function()
      gs.diffthis "~"
    end, { desc = "Diffthis ~" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
  end,
}

-- Undotreeshow

map("n", "<leader>u", "<cmd> UndotreeShow<CR>", { desc = "Open UndotreeShow" })

-- Refactoring

map("v", "<leader>rf", function()
  require("telescope").extensions.refactoring.refactors()
end, { desc = " Treesitter refactoring" })

-- Conform
map("n", "<leader>fo", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format Files" })

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
