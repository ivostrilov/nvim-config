# https://github.com/neovim/nvim-lspconfig

local M = {}
M.script_path = "lua/plugins/nvim-lspconfig.lua"

function M.enable_clangd()
  print(M.script_path .. "::enable_clangd executing...")
  vim.lsp.enable("clangd")
end

return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Usage :lua vim.g.enable_clangd()
    vim.g.enable_clangd = M.enable_clangd

    -- Uncomment if want to enable by default
    -- vim.g.enable_clangd()
  end
}
