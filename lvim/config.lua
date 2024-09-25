-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.plugins = {
  { "nordtheme/vim" },
  { "akinsho/toggleterm.nvim" },
  { "CRAG666/code_runner.nvim",     config = true },
  { "majutsushi/tagbar" },
  { "github/copilot.vim" },
  -- { "neoclide/coc.nvim"  },
  { "nvim-telescope/telescope.nvim" },
  tag = '0.1.4',
  -- {"marko-cerovac/material.nvim"},
  { "Banbury-inc/banbury.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "VonHeikemen/lsp-zero.nvim",
    requres = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
      { 'j-hui/fidget.nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

    },

    {
      "metakirby5/codi.vim",
      cmd = "Codi",
    },
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
      config = function()
        require('telescope').load_extension('project')
      end,
      setup = function()
        vim.cmd [[packadd telescope.nvim]]
      end,
    },
    -- {
    -- "Pocco81/auto-save.nvim",
    -- config = function()
    -- require("auto-save").setup()
    -- end,
    -- },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "lua" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

}



require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "sudo python3 -u",
    typescript = "deno run --allow-env --allow-read --allow-write --allow-net",
    rust = {
      "cd $dir &&",
      -- "rustc $fileName &&",
      "cargo build &&",
      "cargo run",
      -- "sudo $dir/$fileNameWithoutExt"
    },
  },
})


lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "f", "  Find File", "<cmd>Telescope find_files<CR>" },
  { "r", "  Recent Files", "<cmd>Telescope oldfiles<CR>" },
  { "p", "  Projects", "<cmd>Telescope project<CR>" }, -- Add this line
  { "g", "  Find Text", "<cmd>Telescope live_grep<CR>" },
  { "e", "  Open File Tree", "<cmd>NvimTreeToggle<CR>" },
  { "c", "  Edit Config", "<cmd>edit ~/.config/lvim/config.lua<CR>" }, -- Open config button
  { "q", "  Quit", "<cmd>q<CR>" },
}


-- lvim.colorscheme = "nord"
lvim.colorscheme = "material"
vim.g.material_style = "dark"
lvim.format_on_save.enabled = true
lvim.builtin.alpha.dashboard.section.header.val = {
  "                                                                     ",
  "                                                                      ",
  "                                     .:                               ",
  "                                   ^Y#?                               ",
  "                                  !@@@^                               ",
  "                                  P@@&^                               ",
  "                            .~?7:P@@@@&P!.                            ",
  "                       :!: !#@?:G@@@@@@@@#5!:                         ",
  "                     .5&? J@#^ G@@@@@@@@@@@@&#?                       ",
  "                  . .G@J 7@#: J@@@@@@@@@@@@@@@&~                      ",
  "                 5J J@G  #@5 .#@@@@@@@@@@@@@@@@&!                     ",
  "                7@~ P@Y .&@5 .#@@@@@@@@@@@@@@@@@@5:                   ",
  "                G@7 ?@#. 5@#. Y@@@@@@@@@@@@@@@@@@@&5^                 ",
  "             7. Y@#. G@5 .G@P  Y@@@@@@@@@@@@@@@@@@@@@BJ~.             ",
  "            ^@: :#@G. 5@P  J@B^ ~P&@@@@@@@@@@@@@@@@@@@@@&7            ",
  "            ^@5  ^B@B^ !##~ .Y#5: :7YPGBBBBBB#@@@@@@@@@@@J            ",
  "             G@Y  .Y@@J. ?BP~ .?GJ:          .!G@@@@@@@@@@~           ",
  "           . :B@B~  :5@&J. !PP7. !Y?.           !#@@@GPP57:           ",
  "          ^P. .Y@@P^  :J#&5^ :?PY^ ^?^           .7PY                 ",
  "          ^@G.  ^5@@P~   !P&BJ: ^Y5! ^.                               ",
  "           7@#7.  .?B@B?:  .7G#G! .?Y~                                ",
  "            ^5&#5~   :JB&G7:  :?BB7  7!                               ",
  "              .75BB57:  :?G#G7.  !PB7 .:                              ",
  "                  ^75GGY!: .7G#P~  ^PG^                               ",
  "                      :7YPPJ~.:JBG!  ~G?                              ",
  "                          :!YPJ: !GG~  Y5                             ",
  "                              ~?7  !GJ  ?J                            ",
  "                                .:   Y5  7^                           ",
  "                                      7J  .                           ",
  "                                       !~                             ",
  "                                        ^                             ",
  "                                                                      ",
  "                                                                      ",
}

--vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
--vim.keymap.set('n', '<space>h', ':ChatGPT<CR>', { noremap = false, silent = false })
vim.keymap.set('n', '<space>t', ':TagbarToggle<CR>', { noremap = false, silent = false })
vim.keymap.set('n', '<space>r', ':RunFile toggleterm<CR>', { noremap = false, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-e>', ':set invrelativenumber<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


vim.opt.relativenumber = true -- relative line numbers
