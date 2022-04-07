" PerseoGI init.vim

" + Vim pluggins settings ---------------------------------------------------{{{

" ++ CoC  config -------------------------------------------------------{{{
function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" ++ }}}


" ++ fzf settings -----------------------------------------------------------{{{

" Vim 8.2 or neovim support floating windows
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

if has('mac')
   set rtp+=/usr/local/opt/fzf
endif
" ++ }}}

" ++ RipGrep settings -------------------------------------------------------{{{
" Allow RipGrep (FZF) to detect the route, search for git repo and optimize searchs
if executable('rg')
   let g:rg_derive_root='true'
endif
let loaded_matchparen = 1
" ++ }}}

" Mappings ------------------------------------------------------------------{{{

" Configure leader key to spacebar. Leader key allow enter custom user command mode
let mapleader = " "

" + }}}

" + Vim Pluggings mappings --------------------------------------------------{{{

" ++ }}}

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_confirm_key = "\<C-c>"

" FIXME completion with <c-n>
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

let g:completion_enable_auto_hover = 0

" ++ FuGITive mappings ------------------------------------------------------{{{
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" ++ }}}


" Close tags mappings --------------------------------------------------------{{{
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.tsx'
" ++ }}}

" + }}}

" }}}

lua require("perseoGI")

" vim:foldmethod=marker:foldlevel=4
