local set = vim.opt

-- VIM general settings ------------------------------------------------------{{{
-- + Interface ---------------------------------------------------------------{{{
vim.cmd[[
   syntax on
   highlight ColorColumn ctermbg=0 guibg=lightgrey
]]

set.showmatch = false
set.hidden = true
set.errorbells = false                -- Stop sound effects
set.number = true                      -- Line numbers
set.relativenumber = true
set.wrap = false                      -- If a line goes our of screen it will not go line below
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
set.updatetime=50
-- + }}}

-- + Text editor -------------------------------------------------------------{{{
set.tabstop = 8
set.softtabstop = 4
set.shiftwidth = 3
set.expandtab = true                   -- Convert tab character to spaces
set.smartindent = true                 -- Best job to indent for you
-- + }}}

-- + Search ------------------------------------------------------------------{{{
set.smartcase = true                   -- Case sensitive searching
set.hlsearch = false
set.incsearch = true                   -- By the time start searching it highlight results before press enter
-- + }}}

-- + File manipulation and versioning ----------------------------------------{{{
set.swapfile = false                  -- Dont create vim.swp files
set.backup = false                    -- Dont make a backup
set.undodir= vim.fn.expand('~/.vim/undodir')      -- Store a backup in undo directory
set.undofile = true                    -- Store modified file per file in undo directory
--set.autoread
-- + }}}

-- + GUI settings ------------------------------------------------------------{{{
set.mouse = 'a'                     -- Yes... but only for some special cases
set.scrolloff = 8
--set.guicursor=''
set.termguicolors = true
set.showmode = false                  -- Dont show Vim mode status => replaced by vim-airline

-- Give more space for displaying messages.
set.cmdheight = 2

-- Don't pass messages to |ins-completion-menu|.
-- Avoid showing message extra message when using completion
set.shortmess:append{c = true}

-- Column mark
set.colorcolumn = '80'
-- + }}}

-- Spelling
set.spelllang = 'en,es'
set.spell = true

-- }}}
