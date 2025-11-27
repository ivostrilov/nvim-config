-- https://github.com/mfussenegger/nvim-jdtls

return {
  "mfussenegger/nvim-jdtls",
  config = function()
    -- Usage :lua vim.g.jdtls_setup()
    vim.g.enable_jdtls = require("utils.jdtls_setup").setup

    -- Uncomment if want to enable by default
    -- vim.g.enable_jdtls = jdtls_setup.setup()
  end,
}
