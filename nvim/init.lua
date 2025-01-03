-- Initialize packer.nvim if it's not installed
vim.cmd [[packadd packer.nvim]]

-- Use packer to manage plugins
require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'
  
  -- Utility library for plugins (required by many plugins)
  use 'nvim-lua/plenary.nvim'
  
    -- Mason for managing LSP servers and other tools
    use { "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }

    -- Mason-LSPConfig integration without auto-installing LSP servers
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                -- Do not auto-install any servers
                automatic_installation = false
            })
        end
    }

-- null-ls configuration without specific sources (auto-detect from Mason)
use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            -- Sources will be detected dynamically by Mason
            sources = {},
        })
    end
}

  -- Harpoon: Mark files and quickly navigate between them
  use {
    "ThePrimeagen/harpoon",
    config = function()
        require("harpoon").setup({})
    end
  }

  use {"neoclide/coc.nvim", branch = "release"}


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

  -- -- CoC for additional language support
  -- use {
  --     'neoclide/coc.nvim',
  --     branch = 'release'
  -- }

  -- GitHub Copilot
  use("github/copilot.vim")

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- Setup LSP servers only when they are manually installed
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup_handlers({
    function(server_name) -- Default handler for all installed servers
        require("lspconfig")[server_name].setup({})
    end,
})

-- Define a global format function
function format()
    local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
    for _, client in ipairs(clients) do
        if client.supports_method("textDocument/formatting") then
            vim.lsp.buf.format({ async = true })
            return
        end
    end
    print("No formatter available.")
end

-- Toggle true/false function
function ToggleTrueFalse()
  -- Get the current word under the cursor
  local current_word = vim.fn.expand('<cword>')

  -- Check if the word is 'true' or 'false' and toggle it
  if current_word == 'true' then
    -- Replace 'true' with 'false' on the current line
    vim.cmd("normal! ciwfalse")
  elseif current_word == 'false' then
    -- Replace 'false' with 'true' on the current line
    vim.cmd("normal! ciwtrue")
  end
end


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
vim.api.nvim_set_keymap('n', '<leader>fc', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', { noremap = true, silent = true })


-- Harpoon navigation
vim.api.nvim_set_keymap('n', '<C-k>', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

-- Clipboard bindings
--vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'yy', '"+yy', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'Y', '"+yg_', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })

-- Comment bindings
vim.api.nvim_set_keymap('n', '<leader>/', 'gcc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', 'gc', { noremap = false, silent = true })

-- Keybinding to toggle true/false
vim.api.nvim_set_keymap('n', '<Leader>tf', ':lua ToggleTrueFalse()<CR>', { noremap = true, silent = true })

-- CoC bindings for navigating completion suggestions without using C-n and C-p
vim.api.nvim_set_keymap("i", "<C-j>", "coc#pum#next(1)", { silent = true, expr = true, noremap = true })  -- Move down
vim.api.nvim_set_keymap("i", "<C-k>", "coc#pum#prev(1)", { silent = true, expr = true, noremap = true })  -- Move up
vim.api.nvim_set_keymap("i", "<C-;>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'", { silent = true, expr = true, noremap = true })  -- Confirm selection
-- vim.api.nvim_set_keymap("i", "<C-e>", "coc#pum#visible() ? coc#pum#cancel() : '<C-e>'", { silent = true, expr = true, noremap = true })  -- Close completion


-- Format with LSP
vim.api.nvim_set_keymap('n', '<leader>l', ':lua format()<CR>', { noremap = true, silent = true })

-- Map `gd` to go to definition and `K` for hover documentation
--vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
--vim.api.nvim_set_keymap('n', 'K', ":call CocAction('doHover')<CR>", { silent = true })


-- Go to definition (gd)
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
-- Show hover documentation (K)
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- Go to type definition
vim.api.nvim_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
-- Show signature help
vim.api.nvim_set_keymap('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
-- Rename symbol (not typically bound by default)
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })


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
