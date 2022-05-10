local M = {}

local lsp_providers = {
  rust_analyzer = true,
  tsserver = true,
  pyright = true,
  gopls = true,
  sumneko_lua = true,
  jsonls = true,
  dartls = true,
  clangd = true,
}

-- local sumneko_root_path = "/home/mpaulson/personal/lua-language-server"
-- local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

function M.setup()
  -- print("hola")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Setup nvim-cmp.
  local cmp = require "cmp"
  local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
  }
  local lspkind = require "lspkind"

  cmp.setup {
    snippet = {
      expand = function(args)
        -- For `luasnip` user.

        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),

      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_mapping[entry.source.name]
        if entry.source.name == "cmp_tabnine" then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. " " .. menu
          end
          vim_item.kind = "?"
        end
        vim_item.menu = menu
        return vim_item
      end,
    },

    sources = {
      -- tabnine completion? yayaya

      { name = "cmp_tabnine" },

      { name = "nvim_lsp" },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      { name = "luasnip" },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = "buffer" },
    },
  }

  local tabnine = require "cmp_tabnine.config"
  tabnine:setup {
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
  }

  local function config(_config)
    return vim.tbl_deep_extend("force", {
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = function()
        Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
        Nnoremap("<leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
        Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
        Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
        Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
        Nnoremap("<leader>[", ":lua vim.lsp.diagnostic.goto_next()<CR>")
        Nnoremap("<leader>]", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
        Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
        Nnoremap("<leader>gr", ":lua vim.lsp.buf.references()<CR>")
        Nnoremap("<leader>rr", ":lua vim.lsp.buf.rename()<CR>")
        Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
      end,
    }, _config or {})
  end

  require("lspconfig").tsserver.setup(config())

  require("lspconfig").clangd.setup(config {
    cmd = { "clangd", "--background-index", "--log=verbose" },
    root_dir = function()
      print("clangd-Rootdir", vim.loop.cwd())
      return vim.loop.cwd()
    end,
  })
  -- require("lspconfig").ccls.setup(config())

  require("lspconfig").jedi_language_server.setup(config())

  require("lspconfig").svelte.setup(config())

  require("lspconfig").solang.setup(config())

  require("lspconfig").cssls.setup(config())

  require("lspconfig").gopls.setup(config {
    cmd = { "gopls", "serve" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  })

  -- who even uses this?
  require("lspconfig").rust_analyzer.setup(config {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    --[[
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
    --]]
  })

  require("lspconfig").sumneko_lua.setup(config())
  -- config({
  -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  -- settings = {
  -- Lua = {
  -- runtime = {
  -- -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
  -- version = "LuaJIT",
  -- -- Setup your lua path
  -- path = vim.split(package.path, ";"),
  -- },
  -- diagnostics = {
  -- -- Get the language server to recognize the `vim` global
  -- globals = { "vim" },
  -- },
  -- workspace = {
  -- -- Make the server aware of Neovim runtime files
  -- library = {
  -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
  -- [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
  -- },
  -- },
  -- },
  -- },
  -- })
  -- )

  local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
  }

  require("symbols-outline").setup(opts)

  local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. "/.vim/plugged/"
    for _, plug in ipairs(plugins) do
      path = root_path .. plug
      if vim.fn.isdirectory(path) ~= 0 then
        table.insert(paths, path)
      end
    end
    return paths
  end

  require("luasnip.loaders.from_vscode").lazy_load {
    paths = snippets_paths(),
    include = nil, -- Load all languages
    exclude = {},
  }
end

return M

-- local function setup_servers()
--   local lsp_installer = require "nvim-lsp-installer"

--   require("config.lsp.null-ls").setup()

--   lsp_installer.on_server_ready(function(server)
--     if lsp_providers[server.name] then
--       local server_opts = require("config.lsp." .. server.name).setup(server)
--       if server_opts then
--         server:setup(server_opts)
--       end
--     else
--       local lsputils = require "lsp.utils"
--       local opts = {
--         on_attach = lsputils.lsp_attach,
--         capabilities = lsputils.get_capabilities(),
--         on_init = lsputils.lsp_init,
--         on_exit = lsputils.lsp_exit,
--       }
--       server:setup(opts)
--     end
--   end)
-- end

-- function M.setup()
--   setup_servers()
-- end

-- function M.setup()

--   -- local coq = require("coq")
--   -- Mapping configuration applied only when LSP is available

--   local custom_attach = function(client, bufnr)
--     local function buf_set_keymap(...)
--       vim.api.nvim_buf_set_keymap(bufnr, ...)
--     end
--     local function buf_set_option(...)
--       vim.api.nvim_buf_set_option(bufnr, ...)
--     end

--     -- require'completion'.on_attach(client)

--     -- Setup nvim-cmp.
--     -- local cmp = require("cmp")

--     -- cmp.setup({
--     --       snippet = {
--     --          expand = function(args)
--     --             -- For `vsnip` user.
--     --             -- vim.fn["vsnip#anonymous"](args.body)

--     --             -- For `luasnip` user.
--     --             -- require('luasnip').lsp_expand(args.body)

--     --             -- For `ultisnips` user.
--     --             vim.fn["UltiSnips#Anon"](args.body)
--     --          end,
--     --       },
--     --       mapping = {
--     --          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     --          ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     --          ["<C-Space>"] = cmp.mapping.complete(),
--     --          ["<C-e>"] = cmp.mapping.close(),
--     --          ["<CR>"] = cmp.mapping.confirm({ select = true }),
--     --       },
--     --       sources = {
--     --          { name = "nvim_lsp" },

--     --          -- For vsnip user.
--     --          -- { name = 'vsnip' },

--     --          -- For luasnip user.
--     --          -- { name = 'luasnip' },

--     --          -- For ultisnips user.
--     --          { name = "ultisnips" },

--     --          { name = "buffer" },
--     --       },
--     --    })

--     buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

--     -- Mappings.
--     local opts = { noremap = true, silent = true }
--     buf_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--     buf_set_keymap("n", "<leader>gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--     buf_set_keymap("n", "<leader>gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--     buf_set_keymap("n", "<leader>gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
--     buf_set_keymap("n", "<leader>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)

--     buf_set_keymap("n", "<leader>[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
--     buf_set_keymap("n", "<leader>]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
--     -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   end

--   -- require("lspconfig").clangd.setup({
--   -- 	on_attach = custom_attach,
--   -- 	root_dir = function()
--   -- 		return vim.loop.cwd()
--   -- 	end,
--   -- })

--   local servers = { "tsserver", "pyright", "dartls", "clangd", "rust_analyzer", "sumneko_lua" }
--   for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup(
--       -- coq.lsp_ensure_capabilities({
--       -- on_attach = custom_attach,
--       -- -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--       -- autostart = true,
--       -- flags = {
--       -- debounce_text_changes = 150,
--       -- },
--       -- })
--     )
--   end

--   -- Special case: Ada built in Lsp
--   require("lspconfig").als.setup {
--     on_attach = custom_attach,
--     cmd = { "/home/perseo/sources/linux/ada_language_server" },
--   }

--   -- https://www.reddit.com/r/neovim/comments/l00zzb/improve_style_of_builtin_lsp_diagnostic_messages/gjt2hek?utm_source=share&utm_medium=web2x&context=3
--   -- Remove signs from left bar and change color for the line number
--   vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
--   vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
--   vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
--   vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })
-- end

-- return M
