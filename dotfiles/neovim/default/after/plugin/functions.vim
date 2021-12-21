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

function! g:Open_browser(url)
   if has('mac') || has('maxunix')
      silent exec '!open -na  "Brave Browser"' . a:url . " &"
   else
      silent exec "!brave " . a:url . " &"
   endif
endfunction
" }}}

