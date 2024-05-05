local M = {}

M.nvterm = {
  mappings = {
    new = {
      horizontal = "<leader>t",
      vertical = "<leader>T",
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "build/",
      ".git/",
      ".cache",
      "%.o",
      "%.a",
      "%.out",
      "%.class",
      "%.pdf",
      "%.mkv",
      "%.mp4",
      "%.zip",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      -- Follow symlinks!
      "--no-ignore",
      "--follow",
    },
  },
  extensions_list = { "themes", "terms", "refactoring", "git_worktree" },
  pickers = {
    find_files = {
      -- add -L to follow symlinks preceded of --no-ignore
      find_command = { "rg", "--no-ignore", "-L", "--hidden", "--files" },
      -- find_command = {'fd', '--type', 'f', '--no-ignore-vcs', '--color=never', '--hidden', '--follow'},
      prompt_prefix = "📄 ",
    },
    git_files = {
      prompt_prefix = " ",
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "pdf", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "norg",
    "query",
    "c",
    "rust",
    "cpp",
    "typescript",
    "javascript",
    "tsx",
    "jsonc",
    "python",
    "sql",
    "html",
    "css",
  },
  -- context_commentstring = {
  --    enable = true,
  --    enable_autocmd = false, -- integration with Comment.nvim
  -- },
  -- context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
  },
}

-- M.comment = {
--   pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
-- }

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",

    -- shell
    "shfmt",
    "shellcheck",

    -- custom
    "clangd",
    "rust-analyzer",
    "pyright",

    "clang-format",
    "prettier",
  },
}

function M.git_or_find_files()
  local results = require("telescope.utils").get_os_command_output { "git", "rev-parse", "--git-dir" }
  if results[1] then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end

return M
