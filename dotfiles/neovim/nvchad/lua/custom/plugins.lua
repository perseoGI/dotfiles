local overrides = require "custom.configs.override"

local plugins = {

  -- Remove default plugins
  { "windwp/nvim-autopairs", enabled = false },
  -- { "folke/which-key.nvim", enabled = false },

  -- Override default plugins
  { "NvChad/nvterm", opts = overrides.nvterm },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    -- Enable telescope lazy loading at Cmds and now at modules!
    -- Refactoring, etc extensions to telescope will also load telescope
    -- plugin at start
    module = { "telescope" },

    dependencies = {
      -- TODO: check!
      {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
          require("custom.configs.git-worktree").setup()
        end,
      },
    },
  },

  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

  { "williamboman/mason.nvim", opts = overrides.mason },

  { "numToStr/Comment.nvim", opts = overrides.comment },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Custom plugins
  {
    "nvim-telescope/telescope-media-files.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },

  -- Theme
  "gruvbox-community/gruvbox",
  "sainnhe/gruvbox-material",
  --   -- config = function()
  --   --    require("custom.configs.gruvbox").setup ()
  --   -- end,
  --
  -- -- ["shaunsingh/oxocarbon.nvim"] = { run = "./install.sh" },
  --
  -- Harpoon
  "ThePrimeagen/harpoon",
  "ThePrimeagen/vim-be-good",

  -- Undo tree
  { "mbbill/undotree", cmd = "UndotreeShow" },
  -- Show marks
  "kshenoy/vim-signature",
  -- Minimalist TODO list management
  "vuciv/vim-bujo",

  -- Cool maximizer/minimizer plugin
  "szw/vim-maximizer",

  -- Go-To-Finder / Go-To-Terminal (current buffer)
  "justinmk/vim-gtfo",
  -- Git blames, logs...
  { "tpope/vim-fugitive", lazy = false },
  "tpope/vim-surround",
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("custom.configs.nvim-surround").setup()
    end,
  },

  { "tpope/vim-repeat", keys = "." },
  -- :%S smart case find/replace
  { "tpope/vim-abolish", cmd = "Subvert" },

  -- Vim text objects
  -- -- Base for following plugins
  { "kana/vim-textobj-user", lazy = false },
  -- ae, ie
  { "kana/vim-textobj-entire", event = "VeryLazy" },
  -- ai, aI, ii, iI
  { "kana/vim-textobj-indent", event = "VeryLazy" },
  -- al, il
  { "kana/vim-textobj-line", event = "VeryLazy" },
  -- af, if
  { "kana/vim-textobj-function", event = "VeryLazy" },
  { "Matt-A-Bennett/vim-surround-funk", event = "VeryLazy" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      require("custom.configs.markdown-preview").setup()
    end,
  },

  -- Discord vimscene
  -- ["andweeb/presence.nvim"] = {
  --   config = function()
  --     require("custom.configs.presence").setup ()
  --   end,
  -- },
  -- Show lsp errors on Telescope
  "folke/trouble.nvim",

  -- Formater
  { "sbdchd/neoformat", cmd = "Neoformat" },

  -- Debugger
    { "mfussenegger/nvim-dap", lazy = false },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false, -- TODO
    -- opt = true,
    requires = { "mfussenegger/nvim-dap", lazy = false }, -- TODO
    config = function()
      require("custom.configs.nvim-dap").setup()
    end,
  },

  -- Flutter development
  {
    "akinsho/flutter-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    lazy = false,
    config = function()
      require("flutter-tools").setup {}
    end,
  },

  -----------------------------------------
  -- Tree-sitter & Telescope dependencies -
  -----------------------------------------

  -- Colorize open and close symbols to distinguish them
  { "p00f/nvim-ts-rainbow", lazy = false },

  -- Auto generate documentation based on file type with `:Neogen`
  {
    "danymat/neogen",
    cmd = "Neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup()
    end,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup {}
    end,
    cmd = "Refactor",
  },

  -- ["nvim-neorg/neorg"] = {
  --   ft = "norg",
  --   after = { "nvim-treesitter" },
  --   config = function()
  --     require("custom.configs.neorg").setup()
  --   end,
  --   requires = "nvim-lua/plenary.nvim",
  -- },

  {
    "nvim-neorg/neorg",
    tag = "0.0.12",
    ft = "norg",
    after = "nvim-treesitter",
    -- setup = function()
    --   require("custom.configs.neorg").autocmd()
    -- end,
    config = function()
      require("custom.configs.neorg").setup()
    end,
  },

  -- Show name of current function on the line when function is to long
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

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
  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
    config = function()
      require("eyeliner").setup {
        bold = true,
      }
    end,
  },

  -- ["Hrle97/nvim.diagnostic_virtual_text_config"] = {
  --    config = function()
  --       require("nvim.diagnostic_virtual_text_config").setup { }
  --    end,
  -- },

  "JoosepAlviste/nvim-ts-context-commentstring",

  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  { "segeljakt/vim-silicon", cmd = "Sillicon" },

  { "kevinhwang91/nvim-bqf", ft = "qf" },

  {
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  },

  -- basic diagrams for flow charts etc
  {
    "jbyuki/venn.nvim",
    module = "venn.nvim",
    config = function()
      require("custom.configs.venn").setup()
    end,
  },

  -- TODO
  {
    "Badhi/nvim-treesitter-cpp-tools",
    requires = "nvim-treesitter/nvim-treesitter",
    before = "nvim-treesitter",
  },

  {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",

    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
  },
  {
    "andymass/vim-matchup",
    lazy = false,
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end,
  },
  -- ["jackMort/ChatGPT.nvim"] = {
  --   config = function()
  --     require("chatgpt").setup {
  --       -- optional configuration
  --     }
  --   end,
  --   after = "telescope.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  -- ["chrisgrieser/nvim-spider"] = {},
}
return plugins
