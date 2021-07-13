" PerseoGI init.vim
"runtime! macros/dvorak.vim

" VIM general settings ------------------------------------------------------{{{
" + Interface ---------------------------------------------------------------{{{
syntax on
set noshowmatch
set hidden
set noerrorbells                " Stop sound effects
set number                      " Line numbers
set relativenumber
set nowrap                      " If a line goes our of screen it will not go line below
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
" + }}}

" + Text editor -------------------------------------------------------------{{{
set tabstop=8 softtabstop=4
set shiftwidth=3
set expandtab                   " Convert tab character to spaces
set smartindent                 " Best job to indent for you
" + }}}

" + Search ------------------------------------------------------------------{{{
set smartcase                   " Case sensitive searching
set nohlsearch
set incsearch                   " By the time start searching it highlight results before press enter
" + }}}
" + File manipulation and versioning ----------------------------------------{{{
set noswapfile                  " Dont create vim.swp files
set nobackup                    " Dont make a backup
set undodir=~/.vim/undodir      " Store a backup in undo directory
set undofile                    " Store modified file per file in undo directory
"set autoread
" + }}}

" + GUI settings ------------------------------------------------------------{{{
set mouse=a                     " Yes... but only for some special cases
set scrolloff=8
set guicursor=
set termguicolors
set noshowmode                  " Dont show Vim mode status => replaced by vim-airline
" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
" Avoid showing message extra message when using completion
set shortmess+=c
" Column mark
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" + }}}

" }}}

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
Plug 'preservim/nerdcommenter'          " Comments
Plug 'kshenoy/vim-signature'            " Show marks
Plug 'vuciv/vim-bujo'                   " Minimalist TODO list management


Plug 'jiangmiao/auto-pairs'             " Auto open close pairs, best plug of Augost-2020
" After having tested coc-html, coc-emmet, coc-snippets, this is the best option for auto-closing html tags on jsx
Plug 'alvan/vim-closetag'
Plug 'szw/vim-maximizer'                " Cool maximizer/minimizer pluggin
" Go-To-Finder / Go-To-Terminal (current buffer)
Plug 'justinmk/vim-gtfo'

Plug 'jdhao/better-escape.vim'          " Essential to exit to normal mode with jk or kj
Plug 'honza/vim-snippets'

if executable('git')
    Plug 'tpope/vim-fugitive'               " Git blames, logs...
endif

if has('python3')
    Plug 'puremourning/vimspector', {
                \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
                \ }
    " Plug 'codota/tabnine-vim'           " Im testing it :3
endif

if has('node')
    " TODO: add CocConfig to dotfiles
    " Coc meta plugin needs nodejs
    " To avoid file not found errors on C/C++, compile_commands.json must be
    " created on the path. Use $ bear make ... to generate automatically
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons'           " Icons for coc-explorer
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
endif


" Apple support to V-Block copy-paste
if has('mac') || has('maxunix')
    Plug 'bfredl/nvim-miniyank'
endif

" Discord vimscene
if has('mac') && executable('/Applications/Discord.app/Contents/MacOS/Discord') ||
            \ has('unix') && (executable('discord') || executable('discord-canary'))
    Plug 'andweeb/presence.nvim'    " Much faster than hugolgst/vimsence.vim
endif


if has('nvim-0.5')
    " Telescope (>=neovim 5.0)
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " LSP config
    Plug 'neovim/nvim-lspconfig'
    " Improves LSP completion
    Plug 'nvim-lua/completion-nvim'

    " Get better at vim from the best streamer ever
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    " NEW
    " Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

if ! has('node')  && ! has('nvim-0.5')
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-file.vim'
    Plug 'machakann/vim-highlightedyank'
endif

" Not using stuff
"
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'floobits/floobits-neovim'         " Colaborate Vim ~= VSCode Live Share pluggin or Atom Teletype
" Plug 'mcchrish/nnn.vim'
" Plug 'soywod/iris.vim'                  " Email client
" Plug 'justinmk/vim-sneak'               " Vim search word given two letters  TODO pensar si cambiarlo a f
" Plug 'vim-utils/vim-man'                " Man pages

call plug#end()


" + Vim pluggins settings ---------------------------------------------------{{{

" ++ Theme customization ----------------------------------------------------{{{

" +++ Vim Airline settings --------------------------------------------------{{{

" Set up powerline fonts to enable cute, non rectangle interface
let g:airline_powerline_fonts = 1
" Show current open buffers as tabs on the top
let g:airline#extensions#tabline#enabled = 1
" Show only last (tail) name of the file on tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Set theme with gruvbox
let g:airline_theme='gruvbox'
" +++ }}}

" +++ Gruvbox settgings -----------------------------------------------------{{{

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" Disable invert selection, you are wellcome eyes!
let g:gruvbox_invert_selection='0'
" +++ }}}

" remove the file encoding with Github account
let g:airline_section_y='@PerseoGI'
" remove separators for empty sections
"let g:airline_skip_empty_sections = 1

" Leave colorcheme config here, after airline config
colorscheme gruvbox
set background=dark

" ++ }}}


" ++ CoC  config -------------------------------------------------------{{{
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Add `:Format` command to format current buffer.
if isdirectory($HOME."/.config/coc/extensions/node_modules/coc-clangd")
    command! -nargs=0 Format :call CocAction('format')
else
    " TODO make only availabe for *.c,*.cc,*.cpp,*.C,*.h,*.hpp
    command! -nargs=0 Format :!clang-format -i %
endif
" ++ }}}

" ++ VimBeGood config -------------------------------------------------------{{{
let g:vim_be_good_floating = 0
" ++ }}}


" ++ fzf settings '-------------------------------------------------------{{{

" Vim 8.2 or neovim support floating windows
if v:version > 802 || has('nvim')
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
else
    " Greps for systems without Rg or Ag installed
    let g:fzf_layout = { 'down': '40%' }
    command! -bang -nargs=* GitGrep
                \ call fzf#vim#grep(
                \   'git grep --line-number -- '.shellescape(<q-args>), 0,
                \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

    " No git
    command! -bang -nargs=* OldGrep
                \ call fzf#vim#grep(
                \   'grep -n --line-buffered -r --exclude-dir={node_modules,.svn,.git} --exclude=\*.{a,o,so} '.shellescape(<q-args>). ' .', 0,
                \   fzf#vim#with_preview(), <bang>0)
endif


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

" ++ Browser tree configuration ---------------------------------------------{{{

if isdirectory($HOME."/.config/coc/extensions/node_modules/coc-explorer")
    let loaded_netrwPlugin = 1  " Disable netrw on open
else
    let g:netrw_browse_split = 4
    let g:vrfr_rg = 'true'
    let g:netrw_banner = 0  " Disable help info on browser tree
    let g:netrw_winsize = 25
endif
"" ++ }}}

" ++ better-scape -----------------------------------------------------------{{{
" Escape to normal mode pressing 'jk' or 'kj' at the same time
let g:better_escape_interval = 100
let g:better_escape_shortcut = ['jk', 'kj', 'JK', 'KJ']
"++ }}}

" ++ ToDo bujo settings -----------------------------------------------------{{{
let g:bujo#window_width = 70
"++ }}}


" Iris settings -------------------------------------------------------------{{{
"let g:iris_name = "Perseo"
"let g:iris_mail = "perseo.gi98@gmail.com"
"let g:iris_imap_host  = "imap.gmail.com"
"let g:iris_imap_port  = 993
"let g:iris_smtp_host  = "smtp.gmail.com"
"let g:iris_smtp_port  = 587
"let g:iris_imap_passwd_filepath = "/home/perseo/.config/nvim/gmail_password_iris.gpg"
"let g:iris_smtp_passwd_filepath = "/home/perseo/.config/nvim/gmail_password_iris.gpg""

"++ }}}

" nnn settings  -------------------------------------------------------------{{{
"let g:nnn#layout = { 'left': '~30%' }
" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NnnPicker | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | NnnPicker| endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd vimenter * NnnPicker
"++ }}}

" + asyncomplete.vim --------------------------------------------------------{{{

" Register LSP server for C/C++/Objective-C
if ! has('node')  && ! has('nvim-0.5')
    if executable('clangd')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd', '-background-index']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
    endif

    " Register LSP server for Python
    if executable('pyls')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'pyls',
                    \ 'cmd': {server_info->['pyls']},
                    \ 'whitelist': ['python'],
                    \ })
    endif
endif
" + }}}

" + asyncomplete-file.vim ---------------------------------------------------{{{
if ! has('node')  && ! has('nvim-0.5')
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                \ 'name': 'file',
                \ 'whitelist': ['*'],
                \ 'priority': 10,
                \ 'completor': function('asyncomplete#sources#file#completor')
                \ }))
endif
" + }}}

" + vim-lsp -----------------------------------------------------------------{{{
if ! has('node')  && ! has('nvim-0.5')
    " TODO this should be on Mappings secction this is WIP
    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nmap <leader>gd <plug>(lsp-definition)
        nmap <buffer> <leader>gs <plug>(lsp-document-symbol-search)
        nmap <buffer> <leader>gS <plug>(lsp-workspace-symbol-search)
        nmap <buffer> <leader>gr <plug>(lsp-references)
        nmap <buffer> <leader>gi <plug>(lsp-implementation)
        nmap <buffer> <leader>gt <plug>(lsp-type-definition)
        nmap <buffer> <leader>rr <plug>(lsp-rename)
        nmap <buffer> <leader>[ <plug>(lsp-previous-diagnostic)
        nmap <buffer> <leader>] <plug>(lsp-next-diagnostic)
        "nmap <buffer> <leader>K <plug>(lsp-hover)
        "inoremap <buffer> <expr><c-f> lsp#scroll(+4)
        "inoremap <buffer> <expr><c-d> lsp#scroll(-4)

        let g:lsp_format_sync_timeout = 1000
        autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

        " refer to doc to add more commands

    endfunction
    if ! has('patch-8.1.1517')
        " Completly dissable popup (https://github.com/prabirshrestha/vim-lsp/issues/53)
        let g:lsp_signature_help_enabled = 0
	      set completeopt-=preview
	      let g:lsp_preview_float = 0
    endif
    let g:lsp_highlight_references_enabled = 0
    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_diagnostics_float_cursor = 1
    "let g:lsp_signs_error = {'text': '✗'}
    "let g:lsp_signs_error = {'text': 'e'}
    "let g:lsp_signs_warning = {'text': 'ѡ'}
    "let g:lsp_signs_warning = {'text': 'Ꭵ'}

    augroup lsp_install
        au!
        "call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END
endif
" + }}}

" + }}}

" presence.vim (Discord) configuration ---------------------------------------{{{
let g:presence_auto_update       = 1
let g:presence_editing_text      = "Olfateanding %s"
let g:presence_workspace_text    = "Curranding on %s"
let g:presence_neovim_image_text = "If you do emacs...sorry"
let g:presence_main_image        = "neovim"
let g:presence_client_id         = "793271441293967371"
let g:presence_debounce_timeout  = 15
" ++ }}}

" + markdown-preview.nvim config --------------------------------------------------------{{{
function! g:Open_browser(url)
    if has('mac') || has('maxunix')
        silent exec '!open -na  "Brave Browser"' . a:url . " &"
    else
        silent exec "!brave " . a:url . " &"
    endif
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
" }}}

" Mappings ------------------------------------------------------------------{{{

" Configure leader key to spacebar. Leader key allow enter custom user command mode
let mapleader = " "

" Reload vim.init file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

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

inoremap <C-c> <esc>

" Visual-Line move lines up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
inoremap <C-u> <esc>viw~ea

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
if has ('nvim')
    " Horizontal term
    nnoremap <leader>t :sp<CR><C-w>r:term<CR>:set nonumber<CR>:set norelativenumber<CR>
    " Vertical term
    nnoremap <leader>T :vs<CR><C-w>r:term<CR>:set nonumber<CR>:set norelativenumber<CR>
else
    " Vim does not open term with line numbers
    " Horizontal term
    nnoremap <leader>t :term<CR><C-w>r
    " Vertical term
    nnoremap <leader>T :vert term<CR><C-w>r
endif
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

if exists(':cbefore')
    nnoremap <c-j> :call QFList(1)<CR>
    nnoremap <c-k> :call QFList(0)<CR>
else
    " Vim <= 8.1 compatibility
    nnoremap <c-j> :cnext<CR>
    nnoremap <c-k> :cprev<CR>
endif

" + }}}

" Automatically save movements larger than 5 lines to the jumplist (useful for
" relativenumber)
" TODO va muy mal con ssh
"nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
"nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" + }}}

" + Clipboard config --------------------------------------------------------{{{
set clipboard+=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Copy all file on clipboard
nnoremap <leader>ya gg"+yG<C-o>

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

if has('nvim-0.5') && isdirectory($HOME.'/.vim/plugged/telescope.nvim')
    " Telescope mappings --------------------------------------------------------{{{
    nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
    nnoremap <leader>pw <cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
    nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>vh <cmd>lua require('telescope.builtin').help_tags()<cr>
    " ++ }}}
elseif executable('rg')
    " Find current word in the project using rg
    nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
    " Find a word on project using rg
    nnoremap <Leader>ps :Rg<CR>
else
    " Check if git is accesible
    silent! !git rev-parse --is-inside-work-tree
    if v:shell_error == 0
        " Find current word in the project using git grep command
        nnoremap <leader>pw :GitGrep <C-R>=expand("<cword>")<CR><CR>
        " Find a word on project using git grep command
        nnoremap <Leader>ps :GitGrep<CR>
    else
        " Find current word in the project using classical grep
        nnoremap <leader>pw :OldGrep <C-R>=expand("<cword>")<CR><CR>
        " Find a word on project using classical grep
        nnoremap <Leader>ps :OldGrep<CR>
    endif

endif
" ++ }}}}

" ++ File explorer mappings -------------------------------------------------{{{

if has('nvim-0.5') && isdirectory($HOME.'/.vim/plugged/telescope.nvim')
    " Telescope mappings --------------------------------------------------------{{{
    nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<CR>
    nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
    " ++ }}}
else
    " GFiles only works with git repo and will only display added files on .git
    nnoremap <C-p> :GFiles<CR>
    " Files is the best alternative for GFiles when there is no git initialized
    nnoremap <Leader>pf :Files<CR>
endif

" if &runtimepath =~ 'coc-explorer' " this does not work because vimrc loads
" before coc pluggin
if isdirectory($HOME."/.config/coc/extensions/node_modules/coc-explorer")
    nnoremap <leader>pv :CocCommand explorer --quit-on-open<CR>
elseif has('nvim-0.5')
    nnoremap <leader>pv :NvimTreeToggle<CR>
else
    " Open classical Ex-plorer on the left
    "nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
    nnoremap <leader>pv :Sex!<CR>
endif

" ++ }}}


" ++ Coc mappings: GoTo code navigation --------------------------------------{{{
if has('node')
    nmap <leader>gd <Plug>(coc-definition)
    nmap <leader>gt <Plug>(coc-type-definition)
    nmap <leader>gi <Plug>(coc-implementation)
    nmap <leader>gr <Plug>(coc-references)
    nmap <leader>rr <Plug>(coc-rename)
    nmap <leader>[ <Plug>(coc-diagnostic-prev)
    nmap <leader>] <Plug>(coc-diagnostic-next)
    nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
    nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
    nnoremap <leader>cr :CocRestart

    "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <silent><expr> <C-space> coc#refresh()


    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    vmap <C-j> <Plug>(coc-snippets-select)
    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
    " Use <leader>x for convert visual selected code to snippet
    xmap <leader>x  <Plug>(coc-convert-snippet)
endif

" Go to header (C/C++)
if isdirectory($HOME."/.config/coc/extensions/node_modules/coc-clangd")
    " Use coc-clangd built in function
    noremap <leader>gth :CocCommand clangd.switchSourceHeader<cr>
else
    " Use custom function
    noremap <leader>gth :call SwitchSourceHeader()<cr>
endif
" ++ }}}

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" FIXME completion with <c-n>
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"


if has('nvim-0.5')
    " Enable Lua syntax highlight on vim file
    let g:vimsyn_embed= 'l'

    lua << EOF

        local nvim_lsp = require('lspconfig')

        --[ Mapping configuration applied only when LSP is available

        local custom_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            require'completion'.on_attach(client)

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
        end


        require'lspconfig'.tsserver.setup{ on_attach=custom_attach }

        --[ This is the perfect sustitute to coc-clangd
        require'lspconfig'.clangd.setup {
        on_attach = custom_attach,
        root_dir = function() return vim.loop.cwd() end
        }

        -- Ada built in Lsp
        require'lspconfig'.als.setup{ on_attach=custom_attach, cmd = {"/home/perseo/sources/linux/ada_language_server" } }

        require'lspconfig'.pyright.setup{ on_attach=custom_attach }
        --[ require'lspconfig'.pyls.setup{ on_attach=custom_attach }

        --[ require'lspconfig'.rust_analyzer.setup{ on_attach=custom_attach }


        --[[  https://www.reddit.com/r/neovim/comments/l00zzb/improve_style_of_builtin_lsp_diagnostic_messages/gjt2hek?utm_source=share&utm_medium=web2x&context=3
        [ Remove signs from left bar and change color for the line number
        ]]

        vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
        vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
        vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
        vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

EOF
endif
"let g:python3_host_prog = '/usr/bin/python'


" ++ FuGITive mappings ------------------------------------------------------{{{
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" ++ }}}

" ToDo Bujo mappings --------------------------------------------------------{{{
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert
" ++ }}}


" Vim-sneak mappings --------------------------------------------------------{{{
"map t <Plug>Sneak_f
"map T <Plug>Sneak_F
" ++ }}}

" Iris mappings --------------------------------------------------------{{{
" ++ }}}

" Close tags mappings --------------------------------------------------------{{{
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.ts,*.jsx,*.tsx'
" ++ }}}

" Vimspector mappings --------------------------------------------------------{{{
" TODO personalizar
command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)

let maplocalleader="\<space>"
"let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <localleader>dg :call vimspector#Launch()<cr>
nnoremap <localleader>dn :call vimspector#Continue()<cr>
"nnoremap <localleader>gs :call vimspector#Stop()<cr>
nnoremap <localleader>dr :call vimspector#Reset()<cr>

nnoremap <localleader>dR :call vimspector#Restart()<cr>
nnoremap <localleader>dp :call vimspector#Pause()<cr>
nnoremap <localleader>db :call vimspector#ToggleBreakpoint()<cr>
"nnoremap <localleader>dB :call vimspector#ToggleConditionalBreakpoint()<cr>
"nnoremap <localleader>dB <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>dB <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <localleader>dj :call vimspector#StepOver()<cr>
nnoremap <localleader>dl :call vimspector#StepInto()<cr>
nnoremap <localleader>dk :call vimspector#StepOut()<cr>
nnoremap <localleader>dh :call vimspector#RunToCursor()<cr>
" ++ }}}

" Maximizer mappings --------------------------------------------------------{{{
nnoremap <leader>m :MaximizerToggle!<CR>
" ++ }}}

" + }}}


" }}}

" Automatic commands --------------------------------------------------------{{{

" Remember last position in buffer
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if has('nvim-0.5')
    " Nvim built in Lsp allow autocommand pop up diagnostic message
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
endif

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

" Commands ------------------------------------------------------------------{{{
command! -range JsonFormat <line1>,<line2>call JsonFormatFunction()
command! -range SplitToLines <line1>,<line2>call SplitToLinesFunction()

" }}}

" Functions -----------------------------------------------------------------{{{

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! CloseAllBuffersButCurrent()
    let curr = bufnr("%")
    let last = bufnr("$")

    if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
    if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction


" Custom function to between header and source files of C/C++ (similar to
" coc-clangd.switchSourceHeader)
function! SwitchSourceHeader()
    let l:curr = expand('%:r')
    let l:extension = expand('%:e')

    let l:sources = ['c', 'C', 'cpp', 'cc']
    let l:headers = ['h', 'hpp']

    if l:extension =~ join(l:sources, '\|')
        for ext in l:headers
            let l:option = l:curr . '.' . ext
            if filereadable(l:option)
                execute "e ".fnameescape(l:option)
                return
            endif
        endfor
        echo 'No header file exist'
    elseif l:extension =~ join(l:headers, '\|')
        for ext in l:sources
            let l:option = l:curr . '.' . ext
            if filereadable(l:option)
                execute "e ".fnameescape(l:option)
                return
            endif
        endfor
        echo 'No source file exist'
    endif
endfunction

" Use python power to format json
function! JsonFormatFunction() range
    execute a:firstline . "," . a:lastline . "! python -m json.tool"
endfunction

function SplitToLinesFunction() range
  for lnum in range(a:lastline, a:firstline, -1)
    let words = split(getline(lnum))
    execute lnum . "delete"
    call append(lnum-1, words)
  endfor
endfunction


" TODO This is to be improved to detect character and column under the cursor on a
" visual selection
function! Indent(char, column) range
    let column_1 = a:column - 1
    let current_pos = getpos(".")
    execute a:firstline . "," . a:lastline . "normal! 0f". a:char . a:column . "i \ed" . column_1 . "|"."2wdT".a:char."i "
    call setpos(".", current_pos)
endfunction

" Quick Fix List custom mapping to first move in current buffer
function! QFList(forwards)
    try
        if a:forwards
            execute ':cafter'
        else
            execute ':cbefore'
        endif
    catch
        try
            if a:forwards
                execute ':cnext'
            else
                execute ':cprev'
            endif
        catch
            echo 'No more items'
        endtry
    endtry
endfunction

" }}}

" Custom abbreviations ------------------------------------------------------{{{
iabbrev clog console.log(
iabbrev @@ perseo.gi98@gmail.com
iabbrev af () => {}<left><CR><Tab>
iabbrev intmain int main (int argc, char *arcv[], char *envp[]){
" }}}

" vim:foldmethod=marker:foldlevel=4
