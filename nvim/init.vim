-- Initialize packer.nvim if it's not installed
vim.cmd [[packadd packer.nvim]]

-- Use packer to manage plugins
require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Utility library for plugins (required by many plugins)
  use 'nvim-lua/plenary.nvim'

  -- Harpoon: Mark files and quickly navigate between them
  use 'ThePrimeagen/harpoon'


  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }


  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  

  use("github/copilot.vim")
  -- Optional: Add more plugins here as needed

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)


vim.g.mapleader = " "

-- Keybindings to add, toggle, or navigate to marks
vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-k>', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
-- Yank (copy) to system clipboard
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'yy', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', '"+yg_', { noremap = true, silent = true })

-- Paste from system clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")

-- More optional configurations as needed
vim.opt.clipboard:append("unnamedplus")
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

