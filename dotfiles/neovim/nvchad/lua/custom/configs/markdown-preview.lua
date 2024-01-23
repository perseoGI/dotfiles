local M = {}

function M.setup()
  vim.g.mkdp_browserfunc = "g:Open_browser"
  vim.g.mkdp_auto_start = 1
  vim.g.mkdp_auto_close = 0
end

-- function! g:Open_browser(url)
--    if has('mac') || has('maxunix')
--       silent exec '!open -na  "Brave Browser"' . a:url . " &"
--    else
--       silent exec "!brave " . a:url . " &"
--    endif
-- endfunction
return M
