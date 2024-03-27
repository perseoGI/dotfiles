vim.api.nvim_exec(
  [[

function! TrimWhitespace()
   let l:save = winsaveview()
   keeppatterns %s/\s\+$//e
   call winrestview(l:save)
endfunction

function! ExecuteMacroOverVisualRange()
   echo "@".getcmdline()
   execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! JsonFormatFunction() range
# Use python power to format json
   execute a:firstline . "," . a:lastline . "! python -m json.tool"
endfunction

function SplitToLinesFunction() range
   for lnum in range(a:lastline, a:firstline, -1)
      let words = split(getline(lnum))
      execute lnum . "delete"
      call append(lnum-1, words)
   endfor
endfunction

function! QFList(forwards)
# Quick Fix List custom mapping to first move in current buffer
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

]],
  false
)
