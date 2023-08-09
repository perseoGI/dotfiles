local M = {}

function M.setup()
  local Worktree = require "git-worktree"
  local Job = require "plenary.job"

  -- op = Operations.Switch, Operations.Create, Operations.Delete
  -- metadata = table of useful values (structure dependent on op)
  --      Switch
  --          path = path you switched to
  --          prev_path = previous worktree path
  --      Create
  --          path = path where worktree created
  --          branch = branch name
  --          upstream = upstream remote name
  --      Delete
  --          path = path where worktree deleted

  Worktree.on_tree_change(function(op, metadata)
    if op == Worktree.Operations.Switch then
      print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    elseif op == Worktree.Operations.Create then
      print("Created branch" .. metadata.branch .. " on " .. metadata.path)
      Job:new({ "git", "submodule", "update", "--init" }):start()
      Job:new({ "git", "lfs", "install" }):start()
      Job:new({ "git", "lfs", "pull" }):start()
    end
  end)
end

return M
