M = {}
M.script_path = "lua/utils/clangd_setup.lua"

function M.setup()
  print(M.script_path .. "::setup() executing...")

  vim.lsp.config("clangd", {
    on_attach = function()
      vim.keymap.set(
        "n", "<leader>lf", function() format_by_clang_format() end,
        { desc = "Format buffer with clang-format" }
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

return M
