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
         "--follow"
      },
   },
   extensions_list = { "themes", "terms", "refactoring", "git_worktree" },
   pickers = {
      find_files = {
         -- add -L to follow symlinks preceded of --no-ignore
         find_command = { "rg", "--no-ignore", "-L", "--hidden", "--files" },
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
   },
   ensure_installed = {"lua", "vim", "norg"},
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
