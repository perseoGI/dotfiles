local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "html", "cssls", "bashls", "tsserver", "clangd", "pyright" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
