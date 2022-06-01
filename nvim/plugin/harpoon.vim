" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nnoremap <silent><C-v> :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-r> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><C-g> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><C-a> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><C-s> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><C-d> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><C-f> :lua require("harpoon.ui").nav_file(4)<CR>

lua << EOF
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 100, 
    }
})
EOF
