local M = {}

function M.setup()
  require("neotest").setup {
    adapters = {
      require("neotest-gtest").setup {},
    },
  }
end
return M
