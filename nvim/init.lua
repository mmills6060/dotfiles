-- Initialize packer.nvim if it's not installed
vim.cmd [[packadd packer.nvim]]

-- Use packer to manage plugins
require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'
  
  -- Utility library for plugins (required by many plugins)
  use 'nvim-lua/plenary.nvim'
  
  -- Harpoon: Mark files and quickly navigate between them
  use {
    "ThePrimeagen/harpoon",
    config = function()
        require("harpoon").setup({})
    end
  }

  -- ESLint and Prettier with null-ls
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.eslint,  -- ESLint for linting
                null_ls.builtins.formatting.prettier, -- Prettier for formatting
            },
        })
    end
  }

  -- Lazygit integration
  use {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- Indentation lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({})
    end
  }

  -- Telescope for fuzzy finding
  use {'nvim-telescope/telescope.nvim'}
  require('telescope').setup {
      scroll_strategy = "center",
      defaults = {
          layout_config = {
              horizontal = {
                  preview_width = 0.6,
              },
          },
          sorting_strategy = "ascending",
          dynamic_preview_title = true,
      }
  }

  -- LSP and Autocompletion
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  -- Treesitter
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")

  -- Comment plugin
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- VSCode theme
  use {
      'Mofiqul/vscode.nvim',
      config = function()
          require('vscode').setup({
              transparent = false,
          })
          vim.cmd('colorscheme vscode')
      end
  }

  -- CoC for additional language support
  use {
      'neoclide/coc.nvim',
      branch = 'release'
  }

  -- GitHub Copilot
  use("github/copilot.vim")

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Leader key
vim.g.mapleader = " "

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })

-- Telescope bindings
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fp', ':lua require("telescope.builtin").find_files({ cwd = "~/Documents" })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })


-- Harpoon navigation
vim.api.nvim_set_keymap('n', '<C-k>', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

-- Clipboard bindings
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'yy', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', '"+yg_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })

-- Comment bindings
vim.api.nvim_set_keymap('n', '<leader>/', 'gcc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', 'gc', { noremap = false, silent = true })


-- CoC bindings for navigating completion suggestions without using C-n and C-p
vim.api.nvim_set_keymap("i", "<C-j>", "coc#pum#next(1)", { silent = true, expr = true, noremap = true })  -- Move down
vim.api.nvim_set_keymap("i", "<C-k>", "coc#pum#prev(1)", { silent = true, expr = true, noremap = true })  -- Move up
vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'", { silent = true, expr = true, noremap = true })  -- Confirm selection
-- vim.api.nvim_set_keymap("i", "<C-e>", "coc#pum#visible() ? coc#pum#cancel() : '<C-e>'", { silent = true, expr = true, noremap = true })  -- Close completion


-- Format with LSP
vim.api.nvim_set_keymap('n', '<leader>l', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

-- Map `gd` to go to definition and `K` for hover documentation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'K', ":call CocAction('doHover')<CR>", { silent = true })

-- Git keybinding
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGitCurrentFile<CR>', { noremap = true, silent = true })

-- Yank (copy) and paste with system clipboard
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', '"+yg_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })

-- file explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':e.<CR>', { noremap = true, silent = true })

-- Configure Tab key for Copilot
vim.g.copilot_no_tab_map = true
                            

-- Map Control-l to accept Copilot suggestions
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })


vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end 
    -- add new file
    bind('n', '%')
    --delete file/directory
    bind('x', 'D')
    -- add new directory 
    bind('N', 'd')
    -- rename file
    bind('r', 'R')
  end
})

-- General Neovim options
vim.opt.clipboard:append("unnamedplus")
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true
