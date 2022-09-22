local opt = vim.opt

-- VIM general settings
--  Interface
vim.cmd[[
   syntax on
   highlight ColorColumn ctermbg=0 guibg=lightgrey
]]

opt.showmatch = false
opt.hidden = true
opt.errorbells = false                -- Stop sound effects
opt.number = true                      -- Line numbers
opt.relativenumber = true
opt.wrap = false                      -- If a line goes our of screen it will not go line below
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime=50

-- Text editor
opt.tabstop = 8
opt.softtabstop = 4
opt.shiftwidth = 3
opt.expandtab = true                   -- Convert tab character to spaces
opt.smartindent = true                 -- Best job to indent for you
opt.foldenable = false

-- Search
opt.smartcase = true                   -- Case sensitive searching
opt.hlsearch = false
opt.incsearch = true                   -- By the time start searching it highlight results before press enter

-- File manipulation and versioning
opt.swapfile = false                  -- Dont create vim.swp files
opt.backup = false                    -- Dont make a backup
opt.undodir= vim.fn.expand('~/.vim/undodir')      -- Store a backup in undo directory
opt.undofile = true                    -- Store modified file per file in undo directory
--opt.autoread

-- GUI opttings
opt.mouse = 'a'                     -- Yes... but only for some special cases
opt.scrolloff = 8
--opt.guicursor=''
opt.termguicolors = true
opt.showmode = false                  -- Dont show Vim mode status => replaced by vim-airline

-- Give more space for displaying messages.
opt.cmdheight = 2

-- Don't pass messages to |ins-completion-menu|.
-- Avoid showing message extra message when using completion
opt.shortmess:append{c = true}

-- Column mark
opt.colorcolumn = '120'

-- Spelling
opt.spelllang = 'en,es'
opt.spell = true

-- Clipboard config
opt.clipboard = "unnamedplus"

opt.completeopt = "menu,menuone,noselect"

