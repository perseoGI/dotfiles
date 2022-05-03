local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local sopts = { noremap = true, silent = true }

-- Configure leader key to spacebar. Leader key allow enter custom user command mode
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reload vim.init file
keymap("n", "<Leader><CR>", ":so ~/.config/nvim/init.vim<CR>", opts)

keymap("n", "<Leader>s", ":w<CR>", opts)

-- + Buffer maps -------------------------------------------------------------{{{
-- Remap convenient change between windows commands
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)

-- Move among buffers with CTRL
keymap("n", "<C-L>", ":bnext<CR>", opts)
keymap("n", "<C-H>", ":bprev<CR>", opts)
--nnoremap <Left> :cprev<CR>zzzv
--nnoremap <Right> :cnext<CR>zzzv

-- Close current buffer
keymap("n", "<C-w>c", ":bd<CR>", opts)
-- Close all buffers but current
keymap("n", "<Leader><C-w>c", ":call CloseAllBuffersButCurrent()<CR>", opts)

-- Buffer resizing
keymap("n", "<Leader>+", ":vertical resize +5<CR>", opts)
keymap("n", "<Leader>=", ":vertical resize +5<CR>", opts)
keymap("n", "<Leader>-", ":vertical resize -5<CR>", opts)
keymap("n", "<Leader>rp", ":resize 100<CR>", opts)
-- + }}}

-- + Useful mappings ---------------------------------------------------------{{{

-- Make Y as it should be!
keymap("n", "Y", "y$", opts)
-- X as a i<backspace>
keymap("v", "X", '"_d', opts)

-- Keep movements centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`zmz", opts)

-- Undo break points
keymap("i", ".", ".<c-g>u", opts)
keymap("i", ",", ",<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)

-- Automatically save movements larger than 5 lines to the jumplist (useful for
-- relativenumber)
keymap("n", "<expr>j", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", opts)
keymap("n", "<expr>k", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", opts)
-- nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
-- nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

keymap("i", "<C-c>", "<esc>", opts)
keymap("n", "<C-c>", "<silent> <C-c>", opts) -- remove help message "Type :qa ..."

-- Visual-Line move lines up or down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move lines up/down while on insert mode
keymap("i", "<c-j>", "<esc>:m .+1<CR>==a", opts)
keymap("i", "<c-k>", "<esc>:m .-2<CR>==a", opts)

-- From justinmk
-- un-join (split) the current line at the cursor position
keymap("n", "gj", "i<c-j><esc>k$", opts)
-- select last inserted text
keymap("n", "gV", "`[v`]", opts)
-- repeat last command for each line of a visual selection
keymap("x", ".", ":normal .<CR>", opts)

-- Visual selection after shifting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste from 0 registre easily
keymap("n", ",p", '"0p', opts)

-- Auto indent all file
keymap("n", "<Leader>i", "gg=G<C-o>", opts)
keymap("n", "<Leader>fo", ":Neoformat<CR>", opts)

-- Capitalize or lower case current word
--inoremap <C-u> <esc>viw~ea

-- Operator pending mappings -------------------------------------------------{{{
-- Same as Xi(  shorted to Xp
keymap("o", "p", "i(", opts)
keymap("o", "l", "i{", opts)
keymap("o", "r", "/return<cr>", opts)
keymap("o", "in(", ":<c-u>normal! f(vi(<cr>", opts)
keymap("o", "il(", ":<c-u>normal! F)vi(<cr>", opts)
keymap("o", "in{", ":<c-u>normal! f{vi{<cr>", opts)
keymap("o", "il{", ":<c-u>normal! F}vi{<cr>", opts)
-- + }}}

-- Terminal
-- Horizontal term
keymap("n", "<leader>t", ":sp<CR><C-w>r:term<CR>:set nonumber<CR>:set norelativenumber<CR>", opts)
-- Vertical term
keymap("n", "<leader>T", ":vs<CR><C-w>r:term<CR>:set nonumber<CR>:set norelativenumber<CR>", opts)

keymap("t", "<esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
keymap("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
keymap("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

-- Visual Line macros: apply a macro to multiple lines by:
--   1. Recording a macro
--   2. Selecting multiple lines with V-Line mode
--   3. Applying macro to those lines
keymap("x", "@", ":<C-u>call ExecuteMacroOverVisualRange()<CR>", opts)

-- Quick fix list ------------------------------------------------------------{{{

-- TIP: <c-q> inside Telescope search and it will load all results on quickfix list
-- TIP: <a-a> or <Tab>/<S-Tab> inside Rg search to select files and <Enter> to
-- load all results on quickfix list
--
-- :cfdo <command>
-- Example: :cfdo s/pattern/replacePattern/gc | update

keymap("n", "<c-j>", ":call QFList(1)<CR>", opts)
keymap("n", "<c-k>", ":call QFList(0)<CR>", opts)

-- + }}}

-- + }}}

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

-- Undo tree
keymap("n", "<leader>u", ":UndotreeShow<CR>", opts)

-- File explorer: nvim-tree
keymap("n", "<leader>pv", ":NvimTreeToggle<CR>", opts)

-- Telescope
-- Find files if not in a git directory
keymap("n", "<C-p>", "<cmd>lua require('perseoGI.telescope').git_or_find_files()<CR>", opts)

keymap("n", "<leader>pf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>pb", ":Telescope buffers<CR>", opts)

keymap(
	"n",
	"<leader>ps",
	"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>",
	opts
)
keymap(
	"n",
	"<leader>pw",
	"<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>",
	opts
)
keymap("n", "<leader>pm", ":Telescope media_files<CR>", opts)
keymap("n", "<leader>pg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>vh", ":Telescope help_tags<CR>", opts)

-- Harpoon
keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>e", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Maximizer
keymap("n", "<leader>m", ":MaximizerToggle!<CR>", opts)

-- Coq
keymap("i", "<Esc>", "v:lua.cancelPum()", {expr = true, silent = true})
keymap("i", "<C-c>", "v:lua.cancelPum()", {expr = true, silent = true})
keymap("i", "<BS>", "v:lua.enterPum()", {expr = true, silent = true})
keymap("i", "<CR>", "v:lua.completeInfo()", {expr = true, noremap = true, silent = true})
-- keymap("i", "<Tab>", "<Tab>", {noremap = true, silent = true})
keymap('n', '<C-h>', '', {noremap = true, silent = true})

keymap('n', '<C-h>', ':bprev<CR>', {noremap = true, silent = true})
keymap("n", "<C-H>", ":bprev<CR>", opts)


-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", sopts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", sopts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", sopts)

keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", sopts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", sopts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", sopts)

keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", sopts)

-- Vimspector

--keymap("n", "<localleader>dg", ":call vimspector#Launch()<cr>", opts)
--keymap("n", "<localleader>dn", ":call vimspector#Continue()<cr>", opts)
----nnoremap <localleader>gs :call vimspector#Stop()<cr>
--keymap("n", "<localleader>dr", ":call vimspector#Reset()<cr>", opts)

--keymap("n", "<localleader>dR", ":call vimspector#Restart()<cr>", opts)
--keymap("n", "<localleader>dp", ":call vimspector#Pause()<cr>", opts)
--keymap("n", "<localleader>db", ":call vimspector#ToggleBreakpoint()<cr>", opts)
---- nnoremap <localleader>dB :call vimspector#ToggleConditionalBreakpoint()<cr>
---- nnoremap <localleader>dB <Plug>VimspectorToggleConditionalBreakpoint
--keymap("n", "<leader>dB", "<Plug>VimspectorToggleConditionalBreakpoint", opts)

--keymap("n", "<localleader>dj", ":call vimspector#StepOver()<cr>", opts)
--keymap("n", "<localleader>dl", ":call vimspector#StepInto()<cr>", opts)
--keymap("n", "<localleader>dk", ":call vimspector#StepOut()<cr>", opts)
--keymap("n", "<localleader>dh", ":call vimspector#RunToCursor()<cr>", opts)


-- Dap debugger

-- dap.defaults.fallback.terminal_win_cmd = '20split new'
-- vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

keymap = vim.keymap.set

keymap('n', '<leader>db', function() require"dap".toggle_breakpoint() end, opts)
keymap('n', '<leader>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap('n', '<leader>dk', function() require"dap".step_out() end, opts)
keymap('n', "<leader>dl", function() require"dap".step_into() end, opts)
keymap('n', '<leader>dj', function() require"dap".step_over() end, opts)
keymap('n', '<leader>dn', function() require"dap".continue() end, opts)
keymap('n', '<leader>dc', function() require"dap".run_to_cursor() end, opts)
keymap('n', '<leader>ds', function() require"dap".terminate() end, opts)
keymap('n', '<leader>dR', function() require"dap".clear_breakpoints() end, opts)
keymap('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end, opts)
keymap('n', '<leader>da', function() require"debugHelper".attach() end, opts)
keymap('n', '<leader>dA', function() require"debugHelper".attachToRemote() end, opts)
keymap('n', '<leader>di', function() require"dap.ui.widgets".hover() end, opts)
keymap('n', '<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, opts)
-- keymap('n', '<leader>dk', ':lua require"dap".up()<CR>zz', opts)
-- keymap('n', '<leader>dj', ':lua require"dap".down()<CR>zz', opts)
-- keymap('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', opts)
