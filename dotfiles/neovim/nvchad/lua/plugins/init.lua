local overrides = require "configs.override"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- Remove default plugins
  { "windwp/nvim-autopairs", enabled = false },

  -- Override default plugins
  { "NvChad/nvterm", opts = overrides.nvterm },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    -- opts = overrides.telescope,
    -- Enable telescope lazy loading at Cmds and now at modules!
    -- Refactoring, etc extensions to telescope will also load telescope
    -- plugin at start
    -- module = { "telescope" },
    --
    -- dependencies = {
    --   -- TODO: check!
    --   {
    --     "ThePrimeagen/git-worktree.nvim",
    --     config = function()
    --       require("configs.git-worktree").setup()
    --     end,
    --   },
    -- },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,

    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  { "williamboman/mason.nvim", opts = overrides.mason },

  { "numToStr/Comment.nvim", opts = overrides.comment },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
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
  --   --    require("configs.gruvbox").setup ()
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
  { "kshenoy/vim-signature", lazy = false },
  -- Minimalist TODO list management
  { "vuciv/vim-bujo", cmd = "Todo" },

  -- Cool maximizer/minimizer plugin
  { "szw/vim-maximizer", cmd = "MaximizerToggle" },

  -- Go-To-Finder / Go-To-Terminal (current buffer)
  { "justinmk/vim-gtfo", keys = { "got", "goT", "gof", "goF" } },
  -- Git blames, logs...
  { "tpope/vim-fugitive", lazy = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("configs.nvim-surround").setup()
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
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require("configs.markdown-preview").setup()
    end,
  },

  -- Discord vimscene
  -- ["andweeb/presence.nvim"] = {
  --   config = function()
  --     require("configs.presence").setup ()
  --   end,
  -- },
  -- Show lsp errors on Telescope
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Debugger
  {
    "mfussenegger/nvim-dap",

    dependencies = {

      -- fancy UI for the debugger
      -- {
      --   "rcarriga/nvim-dap-ui",
      -- -- stylua: ignore
      -- keys = {
      --   { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      --   { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      -- },
      --   opts = {},
      --   config = function(_, opts)
      --     -- setup dap config by VsCode launch.json file
      --     -- require("dap.ext.vscode").load_launchjs()
      --     local dap = require "dap"
      --     local dapui = require "dapui"
      --     dapui.setup(opts)
      --     dap.listeners.after.event_initialized["dapui_config"] = function()
      --       dapui.open {}
      --     end
      --     dap.listeners.before.event_terminated["dapui_config"] = function()
      --       dapui.close {}
      --     end
      --     dap.listeners.before.event_exited["dapui_config"] = function()
      --       dapui.close {}
      --     end
      --   end,
      -- },

      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },

      -- which key integration
      {
        "folke/which-key.nvim",
        optional = true,
        opts = {
          defaults = {
            ["<leader>d"] = { name = "+debug" },
          },
        },
      },

      -- mason.nvim integration
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
          "williamboman/mason.nvim",
          "mfussenegger/nvim-dap",
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = { "python" },
        },
      },
    },

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>dl", function() require("dap").step_into() end, desc = "Step Into" },
    -- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    -- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    -- { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>dk", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dj", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>di", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

    -- config = function()
    --   local Config = require "lazyvim.config"
    --   vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    --
    --   for name, sign in pairs(Config.icons.dap) do
    --     sign = type(sign) == "table" and sign or { sign }
    --     vim.fn.sign_define(
    --       "Dap" .. name,
    --       { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
    --     )
    --   end
    -- end,
    -- config = function()
    --   require("configs.nvim-dap").setup()
    -- end,
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
  --     require("configs.neorg").setup()
  --   end,
  --   requires = "nvim-lua/plenary.nvim",
  -- },

  {
    "nvim-neorg/neorg",
    tag = "0.0.12",
    ft = "norg",
    after = "nvim-treesitter",
    -- setup = function()
    --   require("configs.neorg").autocmd()
    -- end,
    config = function()
      require("configs.neorg").setup()
    end,
  },

  -- Show name of current function on the line when function is to long
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup {
        max_lines = 3,
      }
    end,
  },

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
      require("configs.venn").setup()
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
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    config = function()
      require("devcontainer").setup {}
    end,
    requires = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    lazy = false,
  },
  -- best to add to dependencies of `neotest`:
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("configs.neotest").setup()
    end,
    lazy = false,
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    config = function()
      require("gitlinker").setup {
        opts = {
          remote = "origin", -- force the use of a specific remote
        },
        -- default mapping to call url generation with action_callback
        mappings = "<leader>gy",
      }
    end,
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
  {
    "dlvhdr/gh-blame.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>gg", "<cmd>GhBlameCurrentLine<cr>", desc = "GitHub Blame Current Line" },
    },
  },
  {
    "dlvhdr/gh-addressed.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "folke/trouble.nvim",
    },
    cmd = "GhReviewComments",
    keys = {
      { "<leader>grc", "<cmd>GhReviewComments<cr>", desc = "GitHub Review Comments" },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("configs.copilot").setup()
      end,
      dependencies = {
        {
          "zbirenbaum/copilot-cmp",
          config = function()
            require("copilot_cmp").setup()
          end,
        },
        {
          "CopilotC-Nvim/CopilotChat.nvim",
          -- opts = {
          --   debug = true, -- Enable debugging
          -- },
        },
      },
    },

    -- Override NvChad config
    opts = function()
      return require "configs.cmp"
    end,
  },

  { dir="/Users/perseo/sources/conan.nvim", lazy=false }

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
