-- https://github.com/shortcuts/no-neck-pain.nvim

return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    autocmds = {
      enableOnVimEnter = true,
      enableOnTabEnter = true,
      skipEnteringNoNeckPainBuffer = true,
    },
    buffers = {
      right = {
        enabled = false,
      },
    },
  },
}
