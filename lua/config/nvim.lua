function setup_identation()
  vim.opt.tabstop = 2       -- Amount of spaces for drawing tabs
  vim.opt.shiftwidth = 2    -- Amount of spaces for auto identation

  vim.opt.softtabstop = 2   -- Amount of spaces while editing
                            -- (pressing Tab/Backspace)

  vim.opt.expandtab = true  -- Convert tabs to spaces
  vim.opt.smarttab = true   -- Smart using of tabs at the beginning of line
  vim.opt.autoindent = true -- Save identation of current line for next
end

function setup_visual_helpers()
  vim.opt.number = true      -- Indexing lines by numbers (left edge column)
  vim.opt.colorcolumn = "80" -- Vertical column for inspecting line length

  -- Open splitted buffer with a comfotable side
  vim.opt.splitbelow = true
  vim.opt.splitright = true
end

function setup_keymaps()
  vim.g.mapleader = " " -- Setup '<leader>' key to space

  vim.keymap.set("v", "<leader>y", '"+y')  -- Copy to system clipboard
end

setup_identation()
setup_visual_helpers()
setup_keymaps()
