-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.plugins = {
{ "nordtheme/vim" },
{ "akinsho/toggleterm.nvim"},
{"CRAG666/code_runner.nvim", config = true},
{"majutsushi/tagbar"},
{"github/copilot.vim"},
{"nvim-telescope/telescope.nvim"}, tag ='0.1.4',
-- {"marko-cerovac/material.nvim"},
{"Banbury-inc/banbury.nvim"}
}
-- lvim.colorscheme = "nord"
lvim.colorscheme = "material"
vim.g.material_style = "dark"

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


