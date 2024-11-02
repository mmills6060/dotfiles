-- Initialize packer.nvim if it's not installed
vim.cmd [[packadd packer.nvim]]

-- Use packer to manage plugins
require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Utility library for plugins (required by many plugins)
  use 'nvim-lua/plenary.nvim'

  -- Harpoon: Mark files and quickly navigate between them
  use 'ThePrimegen/harpoon'
use {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
		})
	end
}

use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
    
}
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


-- use {
--     'kyazdani42/nvim-tree.lua',
--     requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
--     config = function()
--         require('nvim-tree').setup {
--             view = {
--                 width = 30,
--                 side = 'left',
--             },
--             update_cwd = true,
--             filters = {
--                 dotfiles = false,
--             },
--         }
--     end
-- }





use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}


--use {
--    'rose-pine/neovim',
--    as = 'rose-pine',
--    config = function()
--        require('rose-pine').setup({
--            variant = 'main', -- Options are 'main', 'moon', or 'dawn'
--            dark_variant = 'moon', -- Optional: set a different variant for dark mode
--            bold_vert_split = false,
--            dim_nc_background = true,
--            disable_background = false,
--            disable_float_background = true,
--            disable_italics = false,
--        })
--        vim.cmd('colorscheme rose-pine') -- Set rose-pine as the colorscheme
--    end
--}



-- use 
--     'shaunsingh/nord.nvim',
--     config = function()
--         require('nord').set()
--     vim.cmd('colorscheme nord')
--     vim.cmd('highlight Normal guifg=#F8F8F2 guibg=#212121')
--     end
-- }


use {
    'Mofiqul/vscode.nvim',
    config = function()
        require('vscode').setup({
            -- Add any specific configuration here, like transparent backgrounds
            transparent = false, -- Set to true if you prefer transparency
        })
        vim.cmd('colorscheme vscode')
        vim.cmd('highlight Normal guifg=#dbdbdb guibg=#212121')
    end
}


use {
    'neoclide/coc.nvim',
    branch = 'release'
}


  -- use("Banbury-inc/banbury.nvim")

  

  use("github/copilot.vim")
  -- Optional: Add more plugins here as needed
  --
-- Disable default Tab mapping for Copilot
vim.g.copilot_no_tab_map = true

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)


local builtin = require('telescope.builtin')




vim.g.mapleader = " "
-- Keybindings to add, toggle, or navigate to marks
vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>',
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
vim.api.nvim_set_keymap('n', '<leader>/', 'gcc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', 'gc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', ':q<CR>', ':q!<CR>', { noremap = true, silent = true })
-- Use `gd` to go to definition
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
-- Show documentation on hover with `K`
vim.api.nvim_set_keymap('n', 'K', ":call CocAction('doHover')<CR>", { silent = true })

-- Unmap the default Tab binding for Copilot in insert mode
vim.api.nvim_set_keymap("i", "<Tab>", "<Nop>", { noremap = true, silent = true })

-- Map Control-l to accept Copilot suggestions
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })


vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")


--vim.cmd [[
--  highlight Normal guifg=#F8F8F2 guibg=#282A36
--  highlight Comment guifg=#6272A4 cterm=italic
--  highlight Keyword guifg=#FF79C6
--  highlight Function guifg=#50FA7B
--  highlight String guifg=#F1FA8C
--  highlight Type guifg=#BD93F9
--]]




-- More optional configurations as needed
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
--vim.opt.cursorlineopt = "number"



