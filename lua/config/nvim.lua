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
  vim.opt.colorcolumn = "81" -- Vertical column for inspecting line length

  -- Open splitted buffer with a comfotable side
  vim.opt.splitbelow = true
  vim.opt.splitright = true
end

function setup_lsp_keymaps()
  vim.keymap.set(
    "n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition" }
  )

  vim.keymap.set(
    "n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer with LSP" }
  )

  vim.keymap.set(
    "n", "<space>rn", vim.lsp.buf.rename, { desc = "LSP rename under cursor" }
  )
end

function setup_keymaps()
  -- Setup default keymaps.
  -- All keymaps can be reset in 'plugins/' files.

  vim.g.mapleader = " " -- Setup '<leader>' key to space

  setup_lsp_keymaps()

  -- Copy to system clipboard
  vim.keymap.set(
    "v", "<leader>y", '"+y', { desc = "Copy to system clipboard" }
  )

  --- Open current directory
  vim.keymap.set(
    'n', '\\', function()
      local filesystem = require("utils.filesystem")

      local dirpath = filesystem.get_current_dirpath()
      if not dirpath then
        vim.notify("dirpath is nil")
        return
      end

      vim.cmd("edit " .. dirpath)
    end,
    { desc = "Open current directory" }
  )

  -- Open diagnostic hover window
  vim.keymap.set(
    "n", "<leader>d", function()
      vim.diagnostic.open_float()
    end,
    { desc = "Hover diagnostic info" }
  )

  vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open new tab" })

  vim.keymap.set(
    "x", "<leader>e", function()
      local executing = require("utils.executing")
      executing.execute_selected_lua_lines()
    end,
    { desc = "Execute selected lua lines" }
  )
end

setup_identation()
setup_visual_helpers()
setup_keymaps()
