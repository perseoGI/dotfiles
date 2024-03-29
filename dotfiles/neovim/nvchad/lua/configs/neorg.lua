local M = {}

function M.setup()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          },
        },
      },
    },
  }
end

return M
