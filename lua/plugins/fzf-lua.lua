-- https://github.com/ibhagwan/fzf-lua

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>")
    vim.keymap.set("n", "<leader>f", ":FzfLua files<CR>")
  end
}
