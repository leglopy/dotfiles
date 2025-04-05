let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
" let g:lightline = {'colorscheme': 'onedark'}

let g:lightline = {'colorscheme': 'monokaipro'}

syntax on
" colorscheme onedark 
colorscheme monokai-pro 



"call dein#add('ray-x/aurora')  " for dein user

" set termguicolors            " 24 bit color
" let g:aurora_italic = 1     " italic
" let g:aurora_transparent = 1     " transparent
" let g:aurora_bold = 1     " bold
" let g:aurora_darker = 1     " darker background

" colorscheme aurora

" " customize your own highlight
" hi Normal guibg=NONE ctermbg=NONE "remove background
" hi String guibg=#339922 ctermbg=NONE "remove background

" " customize your own highlight with lua
" lua <<EOF
"   vim.api.nvim_set_hl(0, '@string', {fg='#59E343'})
"   vim.api.nvim_set_hl(0, '@field', {fg='#f93393'})
"   vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
" EOF
