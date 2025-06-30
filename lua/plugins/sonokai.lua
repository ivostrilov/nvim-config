-- https://github.com/sainnhe/sonokai?tab=readme-ov-file

return {
  "sainnhe/sonokai",
  config = function()
    vim.cmd("let g:sonokai_style = 'andromeda'")
    vim.cmd("let g:sonokai_better_performance = 1")
    vim.cmd("colorscheme sonokai")
  end
}
