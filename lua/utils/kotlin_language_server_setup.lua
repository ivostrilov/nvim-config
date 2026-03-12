M = {}

local script_path = "lua/utils/kotlin_language_server_setup.lua"

function M.setup()
  print(script_path .. "::setup() executing...")

  vim.lsp.enable("kotlin_language_server")
end

function M.kill()
  print(script_path .. "::kill() executing...")

  vim.lsp.enable("kotlin_language_server", false)
  vim.fn.jobstart("pkill -f kotlin-language-server", { detach = true })
end

return M
