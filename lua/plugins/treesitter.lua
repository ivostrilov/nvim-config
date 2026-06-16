-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  opts = {},
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "kotlin" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
