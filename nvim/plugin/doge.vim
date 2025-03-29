" Generate comment for current line.
nmap <silent> <Leader>d <Plug>(doge-generate)

" Interactive mode comment todo-jumping.
nmap <silent> <TAB> <Plug>(doge-comment-jump-forward)
nmap <silent> <S-TAB> <Plug>(doge-comment-jump-backward)
imap <silent> <TAB> <Plug>(doge-comment-jump-forward)
imap <silent> <S-TAB> <Plug>(doge-comment-jump-backward)
smap <silent> <TAB> <Plug>(doge-comment-jump-forward)
smap <silent> <S-TAB> <Plug>(doge-comment-jump-backward)
