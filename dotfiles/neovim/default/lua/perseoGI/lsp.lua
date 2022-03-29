local nvim_lsp = require('lspconfig')
local coq = require "coq"

--[ Mapping configuration applied only when LSP is available

local custom_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- require'completion'.on_attach(client)

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
      snippet = {
        expand = function(args)
          -- For `vsnip` user.
          -- vim.fn["vsnip#anonymous"](args.body)

          -- For `luasnip` user.
          -- require('luasnip').lsp_expand(args.body)

          -- For `ultisnips` user.
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'nvim_lsp' },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        -- { name = 'luasnip' },

        -- For ultisnips user.
        { name = 'ultisnips' },

        { name = 'buffer' },
      }
    })

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>rr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  buf_set_keymap('n', '<leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
end


require'lspconfig'.tsserver.setup{ on_attach=custom_attach }

--[ This is the perfect sustitute to coc-clangd
require'lspconfig'.clangd.setup {
  on_attach = custom_attach,
  root_dir = function() return vim.loop.cwd() end
}

-- Ada built in Lsp
require'lspconfig'.als.setup{ on_attach=custom_attach, cmd = {"/home/perseo/sources/linux/ada_language_server" } }

-- require'lspconfig'.pyright.setup(coq.lsp_ensure_capabilities({ on_attach=custom_attach }))
require'lspconfig'.pyright.setup( coq.lsp_ensure_capabilities({ on_attach=custom_attach , capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())}))

require'lspconfig'.dartls.setup{on_attach=custom_attach}
--[ require'lspconfig'.rust_analyzer.setup{ on_attach=custom_attach }


--[[  https://www.reddit.com/r/neovim/comments/l00zzb/improve_style_of_builtin_lsp_diagnostic_messages/gjt2hek?utm_source=share&utm_medium=web2x&context=3
   [ Remove signs from left bar and change color for the line number
   ]]

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

--[ nvim-tree.lua

require'nvim-tree'.setup{
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  }
}
