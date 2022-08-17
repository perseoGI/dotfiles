local M = {}

function M.setup()
  require("nvim-surround").setup {
    -- keymaps = {
    --     -- Overwrite keymaps here
    -- },
    highlight = {
      duration = 3,
    },
  }

  require("nvim-surround").buffer_setup {
    surround = {
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
