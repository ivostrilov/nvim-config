vim.g.mapleader = " "

-- absolute path to clipboard
vim.api.nvim_set_keymap('n', '<F1>', [[<Cmd>let @+ = expand('%:p')<CR>]], { noremap = true, silent = true })

-- relative path to clipboard
vim.api.nvim_set_keymap('n', '<F2>', [[<Cmd>let @+ = expand('%:f')<CR>]], { noremap = true, silent = true })

-- filename to clipboard
vim.api.nvim_set_keymap('n', '<F3>', [[<Cmd>let @+ = expand('%:t')<CR>]], { noremap = true, silent = true })

-- NeoTree
vim.keymap.set('n', '<leader>N', ':Neotree float focus <CR>')
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left <CR>')

-- Tabby
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- Formatting
vim.keymap.set('n', '<leader>i', ':lua vim.lsp.buf.format() <CR>');

-- LSP
vim.keymap.set('n', '<leader>s', ':ClangdSwitchSourceHeader <CR>');
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
