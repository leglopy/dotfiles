let g:codeium_disable_bindings = 1

" imap <script><silent><nowait><expr> <leader>a codeium#Accept()
" imap <leader>s   <Cmd>call codeium#CycleCompletions(1)<CR>
" imap <leader>w   <Cmd>call codeium#CycleCompletions(-1)<CR>
" imap <leader>x   <Cmd>call codeium#Clear()<CR>
" imap <leader>f   <Cmd>call codeium#Complete()<CR>

lua << EOF
require("codeium").setup({
   enable_chat = true,
})
EOF
