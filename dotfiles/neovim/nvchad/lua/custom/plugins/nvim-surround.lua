local M = {}

function M.setup()
  require("nvim-surround").setup {
    -- keymaps = {
    --     -- Overwrite keymaps here
    -- },
    highlight_motion = {
      duration = 3,
    },
  }

  require("nvim-surround").buffer_setup {
    delimiters = {
      pairs = {
        ["l"] = function()
          return {
            "[",
            "](" .. vim.fn.getreg "*" .. ")",
          }
        end,
      },
    },
  }
end

return M
