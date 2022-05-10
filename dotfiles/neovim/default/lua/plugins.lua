local M = {}
local fn = vim.fn

local packer_bootstrap = false

local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

packer_init()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local ismacos = function()
  return true
end

function M.setup()
  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/plugin/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  local function plugins(use)
    use "wbthomason/packer.nvim"

    -- Theme
    -- Colorscheme
    use "gruvbox-community/gruvbox"
    use {
      "sainnhe/gruvbox-material",
      config = function()
        require("config.colorscheme").setup {}
      end,
    }
    use {
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("config.bufferline").setup {}
      end,
    }

    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("config.lualine").setup {}
      end,
    }

    -- Nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = function()
        require("config.nvim-tree").setup {}
      end,
    }

    -- Undo tree
    use "mbbill/undotree"

    use "kshenoy/vim-signature" -- Show marks

    -- ToDo list
    use "vuciv/vim-bujo" -- Minimalist TODO list management

    -- Cool maximizer/minimizer plugin
    use "szw/vim-maximizer"

    -- Go-To-Finder / Go-To-Terminal (current buffer)
    use "justinmk/vim-gtfo"

    use "tpope/vim-fugitive" -- Git blames, logs...
    use "tpope/vim-surround"
    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    -- Vim text objects
    use "kana/vim-textobj-user" -- Base for following plugins
    use "kana/vim-textobj-entire" -- ae, ie
    use "kana/vim-textobj-indent" -- ai, aI, ii, iI
    use "kana/vim-textobj-line" -- al, il
    use "kana/vim-textobj-function" -- af, if
    use "Matt-A-Bennett/vim-surround-funk"

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = { "markdown" },
      config = function()
        require("config.markdown-preview").setup ()
      end,
    }

    -- Apple support to V-Block copy-paste
    use {
      "bfredl/nvim-miniyank",
      -- cond = function() return vim.fn.has('macunix') == 1 or vim.fn.has('mac') == 1  end
      cond = { ismacos },
    }

    -- Discord vimscene
    use {
      "andweeb/presence.nvim",
      config = function()
        require("config.presence").setup ()
      end,
    }

    -- Get better at vim from the best streamer ever
    use {
      "ThePrimeagen/vim-be-good",
      run = "./install.sh",
      config = function()
        require("config.presence").setup()
      end,
    }

    -- Formater
    use "sbdchd/neoformat"

    -- Harpoon
    use "ThePrimeagen/harpoon"

    -- LSP, snippets, etc

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
    }

    -- LSP config

    use { "williamboman/nvim-lsp-installer" }
    -- use { "jose-elias-alvarez/null-ls.nvim" }
    use { "ray-x/lsp_signature.nvim" }
    use {
      "neovim/nvim-lspconfig",
      -- after = "nvim-treesitter",
      -- opt = true,
      config = function()
        require("config.lsp").setup()
      end,
    }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-cmdline",
        "ray-x/cmp-treesitter",
        "onsails/lspkind.nvim",
        "simrat39/symbols-outline.nvim",
      },
    }
    use {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
    }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }


    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      as = "telescope",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-telescope/telescope-symbols.nvim",
      },
      config = function()
        require("config.telescope").setup()
      end,
    }

    -- Show lsp errors on Telescope
    use "folke/trouble.nvim"

    -- Debugger
    use {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("config.nvim-dap").setup()
      end,
    }

    -- Flutter development
    use {
      "akinsho/flutter-tools.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.flutter-tools").setup {}
      end,
    }
  end
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)
end

return M
