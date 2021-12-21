" Vimspector mappings --------------------------------------------------------{{{
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
