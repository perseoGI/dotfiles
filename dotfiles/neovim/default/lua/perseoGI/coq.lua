local M = {}

vim.g.coq_settings = {
   keymap = {
      recommended = false,
      jump_to_mark = '<c-t>',
      pre_select = true,
   },
   auto_start = true,
}


function M.setup()
   local coq = require('coq')
   coq.Now() -- Start coq

   -- Coq third party config
   local coq_3p = require("coq_3p") {
      { src = "cow", trigger = "!cow" },
      { src = "figlet", short_name = "BIG" },
      { src = "nvimlua", short_name = "nLUA", conf_only = false }, -- autocomplete on vim.api...
      { src = "bc", short_name = "MATH", precision = 6 },
      {
         src = "repl",
         sh = "zsh",
         -- shell = { p = "perl", n = "node" },
         max_lines = 99,
         deadline = 500,
         unsafe = { "rm", "poweroff", "mv" }
      }
   }
end

return M
