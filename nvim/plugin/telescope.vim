nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

lua << EOF
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = { 
    file_ignore_patterns = {"node_modules"} 
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension('harpoon')
require("telescope").load_extension("git_worktree")
EOF

