local M = {}

local servers_by_filetype = {
  kotlin = "kotlin_lsp",
  sh = "bashls"
}

local function warn(message)
  vim.notify(message, vim.log.levels.WARN)
end

function M.start_current_buffer()
  local filetype = vim.bo.filetype

  if filetype == "" then
    warn("No filetype detected")
    return
  end

  local server = servers_by_filetype[filetype]

  if server == nil then
    warn("No LSP server configured for filetype: " .. filetype)
    return
  end

  local ok, err = pcall(vim.lsp.enable, server)

  if not ok then
    warn("Failed to start LSP server " .. server .. ": " .. err)
  end
end

return M
