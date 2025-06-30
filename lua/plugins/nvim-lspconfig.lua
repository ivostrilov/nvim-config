# https://github.com/neovim/nvim-lspconfig

local M = {}
M.script_path = "lua/plugins/nvim-lspconfig.lua"

function M.enable_clangd()
  print(M.script_path .. "::enable_clangd executing...")
  vim.lsp.config("clangd", {
    on_attach = function()
      vim.keymap.set(
        "n", "<leader>lf", function() format_by_clang_format() end,
        { desc = "Format buffer with clang-format" }
      )
      vim.keymap.set(
        "n", "<leader>s", function() end, { desc = "Switch header/source file" }
      )
    end,
  })

  vim.filetype.add({
    extension = {
      mm = "cpp",
    },
  })

  vim.lsp.enable("clangd")
end

function format_by_clang_format()
  print(M.script_path .. "::format_by_clang_format executing...")
  vim.cmd("write")
  vim.cmd("!clang-format -i %")
  vim.cmd("edit %")
end

function format_python_file()
  print(M.script_path .. "::format_python_file executing...")
  vim.cmd("write")
  vim.cmd("!isort % && black %")
  vim.cmd("edit %")
end

function M.enable_pylsp()
  print(M.script_path .. "::enable_pylsp executing...")
  vim.lsp.config("pylsp", {
    on_attach = function()
      vim.keymap.set(
        "n", "<leader>lf", function() format_python_file() end,
        { desc = "Format buffer with python isort and black" }
      )
    end,
  })

  vim.lsp.enable("pylsp")
end

return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Usage :lua vim.g.enable_clangd()
    vim.g.enable_clangd = M.enable_clangd
    vim.g.enable_pylsp = M.enable_pylsp

    -- Uncomment if want to enable by default
    -- vim.g.enable_clangd()
    -- vim.g.enable_pylsp()
  end
}
