local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "bashls", "clangd", "pyright", "ruff", "rust_analyzer", "yamlls", "ts_ls", "neocmake", "rnix" }

-- bash-language-server
-- clangd
-- cmake-language-server
-- css-lsp
-- html-lsp
-- json-lsp
-- lua-language-server
-- neocmakelsp
-- pyright
-- ruff
-- ruff-lsp
-- rust-analyzer
-- typescript-language-server
-- yaml-language-server


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- lspconfig.conan.setup{
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--     filetypes = { "python"},
--     cmd = { "python ~/sources/conan-lsp/server.py" }
-- }

-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" }
-- }
