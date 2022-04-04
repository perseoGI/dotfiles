local M = {}

vim.g.coq_settings = {
   keymap = {
      recommended = false,
      jump_to_mark = '', -- real remove keymaps
      pre_select = true,
   },
   auto_start = true,
}


function M.setup()
   local coq = require('coq')
   coq.Now() -- Start coq
end

return M
