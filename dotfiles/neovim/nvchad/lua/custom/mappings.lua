local M = {}

M.disabled = {
  n = {
    -- General
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-s>"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",

    -- Remove wrapping jumping functionality
    ["j"] = "",
    ["k"] = "",

    -- Comment
    ["<leader>/"] = "",
    -- new buffer
    ["<S-b>"] = "",
    -- cycle through buffers
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",

    -- Lsp
    ["gi"] = "",
    ["<leader>ls"] = "",
    ["<leader>ra"] = "",
    ["[d"] = "",
    ["d]"] = "",
    ["<leader>fm"] = "",
    ["rr"] = "",
    ["gr"] = "",

    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- Telescope
    ["<leader>fo"] = "",
    ["<leader>tk"] = "",

    ["<leader>cm"] = "",
    ["<leader>gt"] = "",

    -- NvTree
    ["<C-n>"] = "",
    ["<leader>e"] = "",
  },

  v = {
    -- Comment
    ["<leader>/"] = "",
  },
}

M.general = {
  i = {

    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
    ["<C-e>"] = { "<End>", "壟 end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "  move left" },
    ["<C-l>"] = { "<Right>", " move right" },
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },

    ["<C-c>"] = { "<esc>", "" },

    -- Move lines up/down while on insert mode
    ["<c-j>"] = { "<esc>:m .+1<CR>==a", "  move line down while insert mode" },
    ["<c-k>"] = { "<esc>:m .-2<CR>==a", "  move line up while insert mode" },
    ["<C-u>"] = { "<esc>viw~ea", "  Capitalize or lower case current word" },
  },

  n = {
    -- Make Y as it should be!
    ["Y"] = { "y$", " yank to end of line" },
    -- Remap convenient change between windows commands
    ["<leader>h"] = { "<C-w>h", " window left" },
    ["<leader>l"] = { "<C-w>l", " window right" },
    ["<leader>j"] = { "<C-w>j", " window down" },
    ["<leader>k"] = { "<C-w>k", " window up" },

    ["<leader>s"] = { "<cmd> w <CR>", "﬚  save file" },

    -- remove help message "Type :qa ..."
    ["<C-c>"] = { "<silent> <C-c>" },

    -- Buffer resizing
    ["<Leader>+"] = { "<cmd> vertical resize +5<CR>", "" },
    ["<Leader>-"] = { "<cmd> vertical resize -5<CR>", "" },
    ["<Leader>rp"] = { "<cmd> resize 100<CR>", "" },

    -- Keep movements centered
    ["n"] = { "nzzzv", " next match centered" },
    ["N"] = { "Nzzzv", " prev match centered" },
    ["J"] = { "mzJ`zmz", " center J" },

    -- Automatically save movements larger than 5 lines to the jumplist (useful for
    -- relativenumber)
    ["<expr>j"] = {
      "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'",
      " relative jump save to jumplist",
    },
    ["<expr>k"] = {
      "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'",
      " relative jump save to jumplist",
    },

    -- From justinmk
    ["gj"] = { "i<c-j><esc>k$", "  un-join (split) the current line at the cursor position " },
    ["gV"] = { "`[v`]", "  select last inserted text" },

    [",p"] = { '"0p', "  Paste from 0 registre easily" },
    ["<Leader>i"] = { "gg=G<C-o>", "  auto indent all file" },

    -- Quick fix list

    -- TIP: <c-q> inside Telescope search and it will load all results on quickfix list
    -- TIP: <a-a> or <Tab>/<S-Tab> inside Rg search to select files and <Enter> to
    -- load all results on quickfix list
    --
    -- :cfdo <command>
    -- Example: :cfdo s/pattern/replacePattern/gc | update

    ["<c-j>"] = { "<cmd> call QFList(1)<CR>", "" },
    ["<c-k>"] = { "<cmd> call QFList(0)<CR>", "" },

    ["<leader>gth"] = { "<cmd> ClangdSwitchSourceHeader<CR>", "" },

    -- Harpoon nav files
    ["<A-a>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "",
    },
    ["<A-o>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "",
    },
    ["<A-e>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "",
    },
    ["<A-u>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "",
    },

    -- Diff
    ["<leader>dt"] = { "<cmd>diffthis<CR>", " diff current buffer" },
    ["<leader>dg"] = { "<cmd>diffget<CR>", " diff get differences" },
  },
  v = {
    -- X as a i<backspace>
    ["X"] = { '"_d', " i<backspace>" },

    -- Visual-Line move lines up or down
    ["J"] = { "<cmd> m '>+1<CR>gv=gv", " visual movement line up" },
    ["K"] = { "<cmd> m '<-2<CR>gv=gv", " visual movement line down" },

    ["<"] = { "<gv", "  visual selection after shifting" },
    [">"] = { ">gv", "  visual selection after shifting" },
  },
  x = {
    ["."] = { "<cmd> normal .<CR>", "  repeat last command for each line of a visual selection" },

    -- Visual Line macros: apply a macro to multiple lines by:
    --   1. Recording a macro
    --   2. Selecting multiple lines with V-Line mode
    --   3. Applying macro to those lines
    ["@"] = { "<cmd> <C-u>call ExecuteMacroOverVisualRange()<CR>", "" },
  },
  o = {
    -- Operator pending mappings
    -- Same as Xi(  shorted to Xp
    ["p"] = { "i(", "" },
    ["l"] = { "i{", "" },
    ["r"] = { "/return<cr>", "" },
    ["in("] = { "<cmd> <c-u>normal! f(vi(<cr>", "" },
    ["il("] = { "<cmd> <c-u>normal! F)vi(<cr>", "" },
    ["in{"] = { "<cmd> <c-u>normal! f{vi{<cr>", "" },
    ["il{"] = { "<cmd> <c-u>normal! F}vi{<cr>", "" },
  },
  t = {
    -- Terminal
    ["<esc>"] = { [[<C-\><C-n>]], "" },
    ["<C-h>"] = { [[<C-\><C-n><C-W>h]], "" },
    ["<C-j>"] = { [[<C-\><C-n><C-W>j]], "" },
    ["<C-k>"] = { [[<C-\><C-n><C-W>k]], "" },
    ["<C-l>"] = { [[<C-\><C-n><C-W>l]], "" },
  },
}

M.bufferline = {

  n = {
    -- cycle through buffers
    ["<C-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<C-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<leader>X"] = {
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "   close all buffers",
    },
  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "   lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "   lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "   lsp hover",
    },

    ["<leader>gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "   lsp implementation",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "   lsp definition type",
    },

    ["<leader>rr"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "   lsp rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "   lsp code_action",
    },

    ["<leader>gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "   lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "   floating diagnostic",
    },

    ["<leader>["] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["<leader>]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "   diagnostic setloclist",
    },

    -- ["<leader>fo"] = {
    --   function()
    --     vim.lsp.buf.formatting()
    --   end,
    --   "   lsp formatting",
    -- },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
    },
  },
}
--
M.nvimtree = {

  n = {
    -- toggle
    ["<leader>pv"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

M.nvterm = {
  n = {
    -- Disable core mappings
    ["<leader>t"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },

    ["<leader>T"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope git_files <CR>", " git files" },
    ["<leader>pf"] = { "<cmd> Telescope find_files<CR>", "  find all" },
    ["<leader>ps"] = {
      "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>",
      "",
    },
    ["<leader>pw"] = {
      "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>",
      " Grep",
    },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>pb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>pt"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>pm"] = { "<cmd> Telescope media_files <CR>", "  find media" },
    ["<leader>pk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
  },
}

-- Custom plugins

M.harpoon = {
  n = {
    ["<leader>a"] = { "<cmd> lua require('harpoon.mark').add_file()<CR>", "  add harpoon file" },
    ["<leader>e"] = { "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", "  open harpoon menu" },
  },
}

M.maximizer = {
  n = {
    ["<leader>m"] = { "<cmd> MaximizerToggle!<CR>", "  toggle buffer maximizer" },
  },
}

M.undotreeshow = {
  n = {
    ["<leader>u"] = { "<cmd> UndotreeShow<CR>", "  open UndotreeShow" },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "",
    },
    ["<leader>dB"] = { "<cmd> lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "" },
    ["<leader>dk"] = {
      function()
        require("dap").step_out()
      end,
      "",
    },
    ["<leader>dl"] = {
      function()
        require("dap").step_into()
      end,
      "",
    },
    ["<leader>dj"] = {
      function()
        require("dap").step_over()
      end,
      "",
    },
    ["<leader>dn"] = {
      function()
        require("dap").continue()
      end,
      "",
    },
    ["<leader>dc"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "",
    },
    ["<leader>ds"] = {
      function()
        require("dap").terminate()
      end,
      "",
    },
    ["<leader>dR"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "",
    },
    ["<leader>de"] = {
      function()
        require("dap").set_exception_breakpoints { "all" }
      end,
      "",
    },
    ["<leader>da"] = {
      function()
        require("debugHelper").attach()
      end,
      "",
    },
    ["<leader>dA"] = {
      function()
        require("debugHelper").attachToRemote()
      end,
      "",
    },
    ["<leader>di"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "",
    },
    ["<leader>d?"] = {
      function()
        local widgets = require "dap.ui.widgets"
        widgets.centered_float(widgets.scopes)
      end,
      "",
    },
    -- map('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
    -- map('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
    -- map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>Trouble<cr>", " " },
    ["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<cr>", " " },
    ["<leader>xd"] = { "<cmd>Trouble document_diagnostics<cr>", "" },

    ["<leader>xl"] = { "<cmd>Trouble loclist<cr>", "" },
    ["<leader>xq"] = { "<cmd>Trouble quickfix<cr>", "" },
    ["gR"] = { "<cmd>Trouble lsp_references<cr>", "" },
  },
}

M.neoformat = {
  n = {
    ["<leader>fo"] = { "<cmd>Neoformat<cr>", "   lsp formatting" },
  },
}

M.refactoring = {
  v = {
    -- ["<leader>rf"] = { "<cmd>lua require('refactoring').select_refactor()<CR>", "   Treesitter refactoring" },
    ["<leader>rf"] = {
      "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
      "   Treesitter refactoring",
    },
  },
}

M.gitsigns = {
  n = {
    ["]h"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "",
    },
    ["[h"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "",
    },
  },

  o = {
    ["ih"] = { "<cmd>Gitsigns select_hunk<CR>", "" },
  },
  x = {
    ["ih"] = { "<cmd>Gitsigns select_hunk<CR>", "" },
  },
}

M.hlslens = {
  n = {
    ["n"] = { "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", "" },
    ["N"] = { "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", "" },
    ["*"] = { "*<Cmd>lua require('hlslens').start()<CR>", "" },
    ["#"] = { "#<Cmd>lua require('hlslens').start()<CR>", "" },
    ["g*"] = { "g*<Cmd>lua require('hlslens').start()<CR>", "" },
    ["g#"] = { "g#<Cmd>lua require('hlslens').start()<CR>", "" },
  },
}

-- M.spider = {
--   n = {
--     ["w"] = { "<cmd>lua require('spider').motion('w')<CR>", "Spider-w" },
--     ["e"] = { "<cmd>lua require('spider').motion('e')<CR>", "Spider-e" },
--     ["b"] = { "<cmd>lua require('spider').motion('b')<CR>", "Spider-b" },
--     ["ge"] = { "<cmd>lua require('spider').motion('ge')<CR>", "Spider-ge" },
--   },
--   o = {
--     ["w"] = { "<cmd>lua require('spider').motion('w')<CR>", "Spider-w" },
--     ["e"] = { "<cmd>lua require('spider').motion('e')<CR>", "Spider-e" },
--     ["b"] = { "<cmd>lua require('spider').motion('b')<CR>", "Spider-b" },
--     ["ge"] = { "<cmd>lua require('spider').motion('ge')<CR>", "Spider-ge" },
--   },
--   x = {
--     ["w"] = { "<cmd>lua require('spider').motion('w')<CR>", "Spider-w" },
--     ["e"] = { "<cmd>lua require('spider').motion('e')<CR>", "Spider-e" },
--     ["b"] = { "<cmd>lua require('spider').motion('b')<CR>", "Spider-b" },
--     ["ge"] = { "<cmd>lua require('spider').motion('ge')<CR>", "Spider-ge" },
--   },
-- }

return M

-- OLD TODO STUFF
-- + Clipboard config --------------------------------------------------------{{{
-- set clipboard+=unnamedplus
-- Copy to clipboard
-- vnoremap  <leader>y  "+y
-- nnoremap  <leader>Y  "+yg_
-- nnoremap  <leader>y  "+y
-- nnoremap  <leader>yy  "+yy

-- Paste from clipboard
-- nnoremap <leader>p "+p
-- nnoremap <leader>P "+P
-- vnoremap <leader>p "+p
-- vnoremap <leader>P "+P

-- Only needed on macOS
-- This allows to use unnamedplus clipboard in combination of ^V block pasting
-- if has('mac') || has('maxunix')
--    map p <Plug>(miniyank-autoput)
--    map P <Plug>(miniyank-autoPut)
-- endif
-- + }}}
