local overrides = require "custom.plugins.override"

return {

  -- Remove default plugins
  ["goolord/alpha-nvim"] = false,
  ["windwp/nvim-autopairs"] = false,
  ["folke/which-key.nvim"] = false,

  -- Override default plugins
  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
    -- Enable telescope lazy loading at Cmds and now at modules!
    -- Refactoring, etc extensions to telescope will also load telescope
    -- plugin at start
    module = { "telescope" },

    requires = {
      -- TODO: check!
      {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
          require("git-worktree").setup {}
        end,
      },
    },
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["numToStr/Comment.nvim"] = {
    override_options = overrides.comment,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- Custom plugins
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },

  -- Theme
  ["gruvbox-community/gruvbox"] = {},
  ["sainnhe/gruvbox-material"] = {
    -- config = function()
    --    require("custom.plugins.gruvbox").setup ()
    -- end,
  },

  -- ["shaunsingh/oxocarbon.nvim"] = { run = "./install.sh" },

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
  ["kylechui/nvim-surround"] = {
    config = function()
      require("custom.plugins.nvim-surround").setup()
    end,
  },
  -- ["tpope/vim-commentary"] = {},
  ["tpope/vim-repeat"] = {},
  -- :%S smart case find/replace
  ["tpope/vim-abolish"] = {},

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
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      require("custom.plugins.markdown-preview").setup()
    end,
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

  -- ["nvim-neorg/neorg"] = {
  --   ft = "norg",
  --   after = { "nvim-treesitter" },
  --   config = function()
  --     require("custom.plugins.neorg").setup()
  --   end,
  --   requires = "nvim-lua/plenary.nvim",
  -- },

  ["nvim-neorg/neorg"] = {
    tag = "0.0.12",
    ft = "norg",
    after = "nvim-treesitter",
    -- setup = function()
    --   require("custom.plugins.neorg").autocmd()
    -- end,
    config = function()
      require("custom.plugins.neorg").setup()
    end,
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
  ["jinh0/eyeliner.nvim"] = {
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

  ["JoosepAlviste/nvim-ts-context-commentstring"] = {},

  ["nvim-treesitter/playground"] = {},

  ["segeljakt/vim-silicon"] = {},

  ["kevinhwang91/nvim-bqf"] = {
    ft = "qf",
  },

  ["junegunn/fzf"] = {
    run = function()
      vim.fn["fzf#install"]()
    end,
  },

  -- basic diagrams for flow charts etc
  ["jbyuki/venn.nvim"] = {
    module = "venn.nvim",
    config = function()
      require("custom.plugins.venn").setup()
    end,
  },

  -- TODO
  ["Badhi/nvim-treesitter-cpp-tools"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    before = "nvim-treesitter",
  },

  ["sindrets/diffview.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
  },
  ["andymass/vim-matchup"] = {
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  ["kevinhwang91/nvim-hlslens"] = {
    config = function()
        require('hlslens').setup()
    end,
  },
}
