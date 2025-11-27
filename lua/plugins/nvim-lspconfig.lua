# https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Usage ':lua vim.g.enable_clangd()'
    vim.g.enable_clangd = require("utils.clangd_setup").setup
    vim.g.enable_pylsp = require("utils.pylsp_setup").setup

    -- Also available ':lua vim.g.enable_jdtls()'.
    -- Check 'plugins/nvim-lspconfig.lua'.

    -- Uncomment if want to enable by default
    -- vim.g.enable_clangd()
    -- vim.g.enable_pylsp()
  end
}
