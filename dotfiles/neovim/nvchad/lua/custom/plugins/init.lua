return {
  ["goolord/alpha-nvim"] = {
    disable = true,
  },

  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },

  -- TODO
  ["gruvbox-community/gruvbox"] = {},
  ["sainnhe/gruvbox-material"] = {
    -- config = function()
    --    require("custom.plugins.gruvbox").setup ()
    -- end,
  },

  -- Harpoon
  ["ThePrimeagen/harpoon"] = {},
  ["ThePrimeagen/vim-be-good"] = {},

  -- Undo tree
  ["mbbill/undotree"] = {},
  -- Show marks
  ["kshenoy/vim-signature"] = {},
  -- Minimalist TODO list management
  ["vuciv/vim-bujo"] = {},

  -- Cool maximizer/minimizer plugin
  ["szw/vim-maximizer"] = {},

  -- Go-To-Finder / Go-To-Terminal (current buffer)
  ["justinmk/vim-gtfo"] = {},
  -- Git blames, logs...
  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-commentary"] = {},
  ["tpope/vim-repeat"] = {},
  -- Vim text objects
  -- -- Base for following plugins
  ["kana/vim-textobj-user"] = {},
  -- ae, ie
  ["kana/vim-textobj-entire"] = {},
  -- ai, aI, ii, iI
  ["kana/vim-textobj-indent"] = {},
  -- al, il
  ["kana/vim-textobj-line"] = {},
  -- af, if
  ["kana/vim-textobj-function"] = {},
  ["Matt-A-Bennett/vim-surround-funk"] = {},

  -- Markdown
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    -- config = function()
    -- require("config.markdown-preview").setup ()
    -- end,
  },

  -- Discord vimscene
  -- ["andweeb/presence.nvim"] = {
  --   config = function()
  --     require("custom.plugins.presence").setup ()
  --   end,
  -- },
  -- Show lsp errors on Telescope
  ["folke/trouble.nvim"] = {},

  -- Formater
  ["sbdchd/neoformat"] = {},

  -- Debugger
  -- ["mfussenegger/nvim-dap"] = {
  --   config = function()
  --     require("custom.plugins.nvim-dap").setup()
  --   end,
  -- },
  ["rcarriga/nvim-dap-ui"] = {
    -- opt = true,
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("custom.plugins.nvim-dap").setup()
      -- config = function()
      --   require("config.nvim-dap").setup()
      -- end,
    end,
  },

  -- Flutter development
  ["akinsho/flutter-tools.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    -- config = function()
    --   require("config.flutter-tools").setup {}
    -- end,
  },

  -----------------------------------------
  -- Tree-sitter & Telescope dependencies -
  -----------------------------------------
  ["nvim-telescope/telescope.nvim"] = {
    -- Enable telescope lazy loading at Cmds and now at modules!
    -- Refactoring, etc extensions to telescope will also load telescope
    -- plugin at start
    module = { "telescope", "git-worktree" },
    -- module = "telescope",
  },

  -- Colorize open and close symbols to distinguish them
  ["p00f/nvim-ts-rainbow"] = {},

  -- Auto generate documentation based on file type with `:Neogen`
  ["danymat/neogen"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup()
    end,
  },

  ["ThePrimeagen/refactoring.nvim"] = {
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup {}
    end,
  },

  -- TODO: check!
  -- ["ThePrimeagen/git-worktree.nvim"] = {
  --   config = function()
  --     require("git-worktree").setup {}
  --   end,
  -- }

  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = { "nvim-treesitter" },
    config = function()
      require("custom.plugins.neorg").setup()
    end,
    requires = "nvim-lua/plenary.nvim",
  },

  -- Show name of current function on the line when function is to long
  ["nvim-treesitter/nvim-treesitter-context"] = {},

  -- TODO: check!
  -- ["ray-x/navigator.lua"] = {
  --   requires = {
  --     { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  --     { "neovim/nvim-lspconfig" },
  --   },
  --   config = function()
  --     require("navigator").setup()
  --   end,
  -- },
}
