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
  { "nvim-telescope/telescope.nvim" },
  tag = '0.1.4',
  -- {"marko-cerovac/material.nvim"},
  { "Banbury-inc/banbury.nvim" }
}

require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "sudo python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      -- "rustc $fileName &&",
      "cargo build &&",
      "cargo run",
      -- "sudo $dir/$fileNameWithoutExt"
    },
  },
})

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
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

