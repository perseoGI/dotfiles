local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})



-- Remember last position in buffer
api.nvim_create_autocmd("BufReadPost", {
  command = [[ if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- TODO not working
--local markdownGrp = api.nvim_create_augroup("Markdown", { clear = true })
---- Wrap only markdown files
--api.nvim_create_autocmd("FileType markdown", {
--  command = "set wrap",
--  group = markdownGrp
--})


-- TODO
-- Trim whitespaces on buffer write
-- autocmd BufWritePre * :call TrimWhitespace()
--
-- -- Automatically aqualize splits when terminal is resized
-- autocmd VimResized * wincmd =
