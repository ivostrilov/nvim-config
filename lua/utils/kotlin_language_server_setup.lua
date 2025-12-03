M = {}
M.script_path = "lua/utils/kotlin_language_server_setup.lua"

function M.setup()
  print(M.script_path .. "::setup() executing...")

  vim.lsp.enable("kotlin_language_server")
end

return M
