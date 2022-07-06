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
      file_ignore_patterns = {"node_modules", ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip"},
   },
   -- defaults = {
   --    vimgrep_arguments = {
   --       "rg",
   --       "--color=never",
   --       "--no-heading",
   --       "--with-filename",
   --       "--line-number",
   --       "--column",
   --       "--smart-case",
   --    },
   --    prompt_prefix = "> ",
   --    selection_caret = "> ",
   --    entry_prefix = "  ",
   --    initial_mode = "insert",
   --    selection_strategy = "reset",
   --    sorting_strategy = "descending",
   --    layout_strategy = "horizontal",
   --    layout_config = {
   --       horizontal = {
   --          mirror = false,
   --       },
   --       vertical = {
   --          mirror = false,
   --       },
   --    },
   --    file_sorter = require("telescope.sorters").get_fuzzy_file,
   --    file_ignore_patterns = {},
   --    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
   --    winblend = 0,
   --    border = {},
   --    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
   --    color_devicons = true,
   --    use_less = true,
   --    path_display = {},
   --    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
   --    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
   --    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
   --    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
   --
   --    -- Developer configurations: Not meant for general override
   --    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   -- },

   pickers = {
      find_files = {
         -- add -L to follow symlinks
         find_command = { "rg", "--ignore", "-L", "--hidden", "--files", "--follow" },
         -- find_command = {'fd', '--type', 'f', '--no-ignore-vcs', '--color=never', '--hidden', '--follow'},
         prompt_prefix = '📄 '
      },
      git_files = {
         prompt_prefix = ' '
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
   rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil
   }
}

function M.git_or_find_files()
   local results = require('telescope.utils').get_os_command_output({'git', 'rev-parse', '--git-dir'})
   if results[1] then
      require('telescope.builtin').git_files()
   else
      require('telescope.builtin').find_files()
   end
end

return M
