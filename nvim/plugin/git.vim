" Git
" let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gf :diffget //2 <Bar>diffupdate<CR>
nmap <leader>gj :diffget //3 <Bar>diffupdate<CR>
nmap <leader>g; :G<CR>
