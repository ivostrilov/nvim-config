local M = {}

local function notify_no_file_path()
  vim.notify("No file path", vim.log.levels.WARN)
end

local function copy_to_clipboard(path)
  if path == "" then
    notify_no_file_path()
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end

function M.copy_relative_filepath()
  copy_to_clipboard(vim.fn.expand("%"))
end

function M.copy_absolute_filepath()
  copy_to_clipboard(vim.fn.expand("%:p"))
end

function M.open_parent_dir()
  local parent_dir = vim.fn.expand("%:p:h")

  if parent_dir == "" then
    notify_no_file_path()
    return
  end

  vim.cmd.edit(vim.fn.fnameescape(parent_dir))
end

return M
