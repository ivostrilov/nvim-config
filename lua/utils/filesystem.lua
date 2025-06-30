M = {}

function M.get_current_dirpath()
  -- % current buffer path
  -- :p convert to absolute path
  -- :h get head of current path like a dirname func in bash
  local dir = vim.fn.expand('%:p:h')
  return vim.fn.isdirectory(dir) == 1 and dir or nil
end

return M
