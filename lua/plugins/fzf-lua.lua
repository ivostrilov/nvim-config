-- https://github.com/ibhagwan/fzf-lua

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    {
      "<leader>b",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Find buffers",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").grep()
      end,
      desc = "Find by grep",
    },
    {
      "<leader>fm",
      function()
        require("fzf-lua").marks()
      end,
      desc = "Find marks",
    },
  },
}
