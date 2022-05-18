return {

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

    -- Debugger
    ["rcarriga/nvim-dap-ui"] = {
      requires = { "mfussenegger/nvim-dap" },
      -- config = function()
      --   require("config.nvim-dap").setup()
      -- end,
    },

    -- Flutter development
    ["akinsho/flutter-tools.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      -- config = function()
      --   require("config.flutter-tools").setup {}
      -- end,
    }
}

