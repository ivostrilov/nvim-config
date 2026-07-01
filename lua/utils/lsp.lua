local M = {}

local servers_by_filetype = {
  kotlin = "kotlin_lsp",
  sh = "bashls",
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

function M.statusline()
  local clients = vim.lsp.get_clients({
    bufnr = vim.api.nvim_get_current_buf(),
  })

  if next(clients) == nil then
    return "LSP: [No]"
  end

  local names = {}

  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  table.sort(names)

  return "LSP: [" .. table.concat(names, ", ") .. "]"
end

return M
