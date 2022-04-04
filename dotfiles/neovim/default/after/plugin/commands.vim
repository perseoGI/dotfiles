
" Commands ------------------------------------------------------------------{{{
command! -range JsonFormat <line1>,<line2>call JsonFormatFunction()
command! -range SplitToLines <line1>,<line2>call SplitToLinesFunction()
command! -nargs=0 Format Neoformat
command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)
" }}}

