local servers = {
  html = {},
  cssls = {},
  bashls = {},
  clangd = {},

  -- pyright = {
  --   settings = {
  --     python = {
  --       analysis = {
  --         autoSearchPaths = true,
  --         typeCheckingMode = "basic",
  --       },
  --       extraPaths = {
  --         "/Users/perseo/.local/share/uv/tools/conan/lib/python3.14/site-packages"
  --       },
  --     },
  --   },
  -- },
  ty = {},
  ruff = {},
  rust_analyzer = {},
  yamlls = {},
  ts_ls = {},
  neocmake = {},
  rnix = {},
  conanlint = {
    cmd = { 'conanlint', 'lsp' },
    filetypes = { 'python', 'yaml' },
    root_markers = { 'conanfile.py', 'conandata.yml', 'config.yml' },
  },
  cmakelang = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
