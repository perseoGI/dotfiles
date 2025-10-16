local servers = {
  html = {},
  cssls = {},
  bashls = {},
  clangd = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
  ruff = {},
  rust_analyzer = {},
  yamlls = {},
  ts_ls = {},
  neocmake = {},
  rnix = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
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
