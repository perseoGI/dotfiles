

function forceIncreasingOrder()
   -- local sline, scol, eline, ecol = unpack(visual_selection_range())
   -- print(sline, scol, eline, ecol)

   -- 234, 23
   -- 234, 34
   -- 245
   --print(cursor)
   local lines, sline, scol, eline, ecol = getVisualSelection()

   print(vim.inspect(lines), sline, scol, eline, ecol)
   nextNumber = nil
   for i, line in ipairs(lines) do
      local cline = sline - 2 + i
      print(i, line)
      line = string.gsub(line, "%d+", function(num)
         if num then
            if nextNumber == nil then
               nextNumber = num
            else
               num = nextNumber
            end
            nextNumber = nextNumber + 1
            print(num)
         end
            return num
         end)
      lines[i] = line

      print('setting', cline, scol, cline, ecol, {line})
      vim.api.nvim_buf_set_text(0, cline, scol-1, cline, ecol, {line})
   end
   print(vim.inspect(lines))
   print(type(lines))
   --vim.api.nvim_buf_set_lines(0, sline-1, eline, true, lines)
   -- vim.api.nvim_buf_set_text(0, sline-1, scol, eline, ecol, {''})

end


function getVisualSelection()
   local modeInfo = vim.api.nvim_get_mode()
   local mode = modeInfo.mode

   local cursor = vim.api.nvim_win_get_cursor(0)
   local cline, ccol = cursor[1], cursor[2]
   local vline, vcol = vim.fn.line('v'), vim.fn.col('v')

   local sline, scol
   local eline, ecol
   if cline == vline then
      if ccol <= vcol then
         sline, scol = cline, ccol
         eline, ecol = vline, vcol
         scol = scol + 1
      else
         sline, scol = vline, vcol
         eline, ecol = cline, ccol
         ecol = ecol + 1
      end
   elseif cline < vline then
      sline, scol = cline, ccol
      eline, ecol = vline, vcol
      scol = scol + 1
   else
      sline, scol = vline, vcol
      eline, ecol = cline, ccol
      ecol = ecol + 1
   end

   if mode == "V" then --or mode == "\22" then
      scol = 1
      ecol = nil
   end
   -- if --or mode == "CTRL-V"

   local lines = vim.api.nvim_buf_get_lines(0, sline - 1, eline, 0)
   if #lines == 0 then return end


   print(sline, eline, scol, ecol)
   for i = 1, #lines do
      lines[i] = string.sub(lines[i], scol, ecol)
   end
   print(vim.inspect(lines))
   return lines, sline, scol, eline, ecol

--    local startText, endText
--    if #lines == 1 then
--       startText = string.sub(lines[1], scol, ecol)
--    else
--       startText = string.sub(lines[1], scol)
--       endText = string.sub(lines[#lines], 1, ecol)
--    end

--    local selection = {startText}
--    if #lines > 2 then
--       vim.list_extend(selection, vim.list_slice(lines, 2, #lines - 1))
--    end
--    table.insert(selection, endText)

--    return {selection, sline, eline}
end

function visual_selection_range()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return csrow - 1, cscol - 1, cerow - 1, cecol
  else
    return cerow - 1, cecol - 1, csrow - 1, cscol
  end
end
