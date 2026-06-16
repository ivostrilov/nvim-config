vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function setup_indentation()
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.expandtab = true
  vim.opt.smarttab = true
  vim.opt.autoindent = true
end

local function setup_visual_helpers()
  vim.opt.number = true
  vim.opt.colorcolumn = "81"
  vim.opt.splitbelow = true
  vim.opt.splitright = true
end

local function setup_keymaps()
  local path = require("utils.path")

  vim.keymap.set("v", "<leader>y", '"+y', {
    desc = "Copy to system clipboard",
  })

  vim.keymap.set("n", "<leader>fy", path.copy_relative_filepath, {
    desc = "Copy relative file path",
  })

  vim.keymap.set("n", "<leader>fY", path.copy_absolute_filepath, {
    desc = "Copy absolute file path",
  })

  vim.keymap.set("n", "<leader>e", path.open_parent_dir, {
    desc = "Open parent directory",
  })
end

setup_indentation()
setup_visual_helpers()
setup_keymaps()
