" PerseoGI init.vim

" VIM Pluggins {{{
call plug#begin('~/.vim/plugged')

" Theme
"" Colorscheme
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

"" Vim Airline: botton bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Highlighters
" To enable configure coc-settings.json with
"       clangd.semanticHighlighting": true
Plug 'jackguo380/vim-lsp-cxx-highlight' " Syntax highlighter for C/C++ to be used with Coc [semanticHighlighting]
Plug 'sheerun/vim-polyglot'

Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'            " Show marks
Plug 'vuciv/vim-bujo'                   " Minimalist TODO list management


" Plug 'jiangmiao/auto-pairs'             " Auto open close pairs, best plug of Augost-2020
" After having tested coc-html, coc-emmet, coc-snippets, this is the best option for auto-closing html tags on jsx
Plug 'alvan/vim-closetag'
Plug 'szw/vim-maximizer'                " Cool maximizer/minimizer pluggin
" Go-To-Finder / Go-To-Terminal (current buffer)
Plug 'justinmk/vim-gtfo'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'tpope/vim-fugitive'               " Git blames, logs...
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Vim text objects
Plug 'kana/vim-textobj-user'            " Base for following plugins
Plug 'kana/vim-textobj-entire'          " ae, ie
Plug 'kana/vim-textobj-indent'          " ai, aI, ii, iI
Plug 'kana/vim-textobj-line'            " al, il
Plug 'kana/vim-textobj-function'        " af, if
Plug 'Matt-A-Bennett/vim-surround-funk'

" Plug 'svermeulen/vim-yoink'

if has('python3')
   Plug 'puremourning/vimspector', {
         \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
            \ }
   " Plug 'codota/tabnine-vim'           " Im testing it :3
endif

" TODO: add CocConfig to dotfiles
" Coc meta plugin needs nodejs
" To avoid file not found errors on C/C++, compile_commands.json must be
" created on the path. Use $ bear make ... to generate automatically
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'           " Icons for coc-explorer
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


" Apple support to V-Block copy-paste
if has('mac') || has('maxunix')
   Plug 'bfredl/nvim-miniyank'
endif

" Discord vimscene
if has('mac') && executable('/Applications/Discord.app/Contents/MacOS/Discord') ||
         \ has('unix') && (executable('discord') || executable('discord-canary'))
   Plug 'andweeb/presence.nvim'    " Much faster than hugolgst/vimsence.vim
endif


" Telescope (>=neovim 5.0)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'ThePrimeagen/harpoon'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP config
Plug 'neovim/nvim-lspconfig'
" Show lsp errors on Telescope
Plug 'folke/trouble.nvim'
" Improves LSP completion
" Plug 'nvim-lua/completion-nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Get better at vim from the best streamer ever
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" NEW

Plug 'sbdchd/neoformat'

call plug#end()


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

" Reload vim.init file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <Leader>s :w<CR>

" + Buffer maps -------------------------------------------------------------{{{
" Remap convenient change between windows commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Move among buffers with CTRL (enable g:airline#extensions#tabline#enabled to
" see open buffers)
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>
"nnoremap <Left> :cprev<CR>zzzv
"nnoremap <Right> :cnext<CR>zzzv

" Close current buffer
nnoremap <C-w>c :bd<CR>
" Close all buffers but current
nmap <Leader><C-w>c :call CloseAllBuffersButCurrent()<CR>

" Buffer resizing
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
" + }}}

" + Useful mappings ---------------------------------------------------------{{{

" Make Y as it should be!
nnoremap Y y$
" X as a i<backspace>
vnoremap X "_d

" Keep movements centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`zmz

" Undo break points
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

" Automatically save movements larger than 5 lines to the jumplist (useful for
" relativenumber)
" TODO va muy mal con ssh
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

inoremap <C-c> <esc>

" Visual-Line move lines up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move lines up/down while on insert mode
inoremap <c-j> <esc>:m .+1<CR>==a
inoremap <c-k> <esc>:m .-2<CR>==a

" From justinmk
" un-join (split) the current line at the cursor position
nnoremap gj i<c-j><esc>k$
" select last inserted text
nnoremap gV `[v`]
" repeat last command for each line of a visual selection
xnoremap . :normal .<CR>

" Visual selection after shifting
vnoremap < <gv
vnoremap > >gv

" Paste from 0 registre easily
noremap ,p "0p


" Surround with quotation marks and {, [ a single word under the cursor
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel

" Surround with { } visual selections, V-line selections and V-block
" selections
" \e == <esc>
" `< == gvo<esc> (go to the begining of the previous selection) more precise
" `> == gvo<esc> (go to the end of the previous selection)
xnoremap <expr> <leader>{ {
         \  'v': "\e`>a}\e`<i{\e",
         \  'V': "\e`>o}\e`<O{\eva{=",
         \  '<c-v>': "A}\egvI{\e",
         \ }[mode()]

" Idem for []
xnoremap <expr> <leader>[ {
         \  'v': "\e`>a]\e`<i[\e",
         \  'V': "\e`>a]\e`<i[\e",
         \  '<c-v>': "A]\egvI[\e",
         \ }[mode()]

" Idem for []
xnoremap <expr> <leader>( {
         \  'v': "\e`>a)\e`<i(\e",
         \  'V': "\e`>a)\e`<i(\e",
         \  '<c-v>': "A)\egvI(\e",
         \ }[mode()]

" Idem for ""
xnoremap <expr> <leader>" {
         \  'v': "\e`>a\"\e`<i\"\e",
         \  'V': "\e`>a\"\e`<i\"\e",
         \  '<c-v>': "A\"\egvI\"\e",
         \ }[mode()]

" Idem for ''
xnoremap <expr> <leader>' {
         \  'v': "\e`>a\'\e`<i\'\e",
         \  'V': "\e`>a\'\e`<i\'\e",
         \  '<c-v>': "A\'\egvI\'\e",
         \ }[mode()]

" Idem for ``
xnoremap <expr> <leader>` {
         \  'v': "\e`>a\`\e`<i\`\e",
         \  'V': "\e`>a\`\e`<i\`\e",
         \  '<c-v>': "A\`\egvI\`\e",
         \ }[mode()]

" Auto indent all file
nnoremap <Leader>i gg=G<C-o>

" Capitalize or lower case current word
"inoremap <C-u> <esc>viw~ea

" Operator pending mappings -------------------------------------------------{{{
" Same as Xi(  shorted to Xp
onoremap p i(
onoremap l i{
onoremap r /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
" + }}}


" Open terminal mappings ----------------------------------------------------{{{
" Horizontal term
nnoremap <leader>t :sp<CR><C-w>r:term<CR>:set nonumber<CR>:set norelativenumber<CR>
" Vertical term
nnoremap <leader>T :vs<CR><C-w>r:term<CR>:set nonumber<CR>:set norelativenumber<CR>
" + }}}


" Visual Line macros: apply a macro to multiple lines by:
"   1. Recording a macro
"   2. Selecting multiple lines with V-Line mode
"   3. Applying macro to those lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Quick fix list ------------------------------------------------------------{{{

" TIP: <c-q> inside Telescope search and it will load all results on quickfix list
" TIP: <a-a> or <Tab>/<S-Tab> inside Rg search to select files and <Enter> to
" load all results on quickfix list
"
" :cfdo <command>
" Example: :cfdo s/pattern/replacePattern/gc | update

nnoremap <c-j> :call QFList(1)<CR>
nnoremap <c-k> :call QFList(0)<CR>

" + }}}

" + }}}

" + Clipboard config --------------------------------------------------------{{{
set clipboard+=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Only needed on macOS
" This allows to use unnamedplus clipboard in combination of ^V block pasting
if has('mac') || has('maxunix')
   map p <Plug>(miniyank-autoput)
   map P <Plug>(miniyank-autoPut)
endif
" + }}}

" + }}}

" + Vim Pluggings mappings --------------------------------------------------{{{

" ++ NERDCommenter mappings -------------------------------------------------{{{
" Comments map to <C-/> (vim register for '/' is  '_')
nmap <C-_>   <Plug>NERDCommenterToggle
" gv leave selected lines
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" ++ }}}

" ++ Undotree mappings ------------------------------------------------------{{{
" Open Undotree
nnoremap <leader>u :UndotreeShow<CR>
" ++ }}}

" ++ Find mappings ----------------------------------------------------------{{{

" Find and refactor current word in the project
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" Open vim help for current word
nnoremap <leader>vhw :h <C-R>=expand("<cword>")<CR><CR>

" ++ }}}}

" ++ File explorer mappings -------------------------------------------------{{{
nnoremap <leader>pv :NvimTreeToggle<CR>
" ++ }}}


set completeopt=menuone,noinsert,noselect
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
vmap <leader>foo <Cmd>lua print(vim.inspect(forceIncreasingOrder()))<Cr>
vmap <leader>fee <Cmd>lua print(vim.inspect(getVisualSelection()))<Cr>


" vim:foldmethod=marker:foldlevel=4
