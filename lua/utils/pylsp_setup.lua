M = {}
M.script_path = "lua/utils/pylsp_setup.lua"

function format_python_file()
  print(M.script_path .. "::format_python_file executing...")
  vim.cmd("write")
  vim.cmd("!isort % && black %")
  vim.cmd("edit %")
end

function M.setup()
  print(M.script_path .. "::setup executing...")

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

return M
