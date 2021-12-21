" Automatic commands --------------------------------------------------------{{{

" Remember last position in buffer
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Tab size for JS and TS files
augroup TabSize
   autocmd!
   autocmd FileType javascript,typescript set tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Configure wrap mode only on Markdown files
augroup Markdown
   autocmd!
   autocmd FileType markdown set wrap
augroup END

" This is not working properly... should highlight yanked lines
" TODO add if to check if coc-yank is already installed
augroup highlight_yank
   autocmd!
   autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Trim whitespaces on buffer write
autocmd BufWritePre * :call TrimWhitespace()

" Automatically aqualize splits when terminal is resized
autocmd VimResized * wincmd =

" }}}

