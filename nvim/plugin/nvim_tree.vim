nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


lua<<EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})
EOF
