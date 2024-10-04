local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  -- Syntax highlighting
  { 'nvim-treesitter/nvim-treesitter' },

  -- Colorscheme
  { 'Mofiqul/dracula.nvim' },

  -- Formatting
  -- { 'jose-elias-alvarez/null-ls.nvim' },

  { 'vim-scripts/BufOnly.vim' },

  -- Comments
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- Auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  -- Key hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  -- Finding navigation
  { "phaazon/hop.nvim" },

  -- Bottom info line
  { "nvim-lualine/lualine.nvim" },

  -- Filesystem
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },

  -- Tabs for vim buffers
  {
    "nanozuki/tabby.nvim",
  },

  -- Search
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                          , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Language server
  { 'neovim/nvim-lspconfig' },

  -- Autocomplete
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' }
})

