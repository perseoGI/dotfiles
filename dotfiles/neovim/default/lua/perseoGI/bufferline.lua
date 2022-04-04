local M = {}

function M.setup()
   require('bufferline').setup {
      options = {
         mode = "buffers", -- set to "tabs" to only show tabpages instead
         separator_style = "slant"
      }
   }
end

return M
