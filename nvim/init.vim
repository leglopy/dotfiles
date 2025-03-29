"Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set exrc
"set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set smartcase
set ignorecase
set scrolloff=8
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=100

language en_US
"let g:python3_host_prog = '/usr/bin/python3'
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Dart
Plug 'dart-lang/dart-vim-plugin'
" Svelte
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
let g:vim_svelte_plugin_load_full_syntax = 1
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
"Plug 'folke/tokyonight.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

let g:coc_global_extensions = ['coc-snippets', 'coc-prettier', 'coc-html', 'coc-highlight', 'coc-tsserver', 'coc-json', 'coc-flutter', 'coc-css']

call plug#end()

let mapleader = " "
set encoding=utf-8

nnoremap <leader>u :UndotreeToggle<CR>

" Search
nnoremap n nzzzv
nnoremap N Nzzzv

vmap <C-p> <Plug>(coc-format-selected)
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
noremap <C-p> :Format<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap x "_x

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
nnoremap cn *``cgn
nnoremap cN *``cgN

"Copy/Paste multi-times in visual mode
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

" Spell-check Git messages
autocmd FileType gitcommit setlocal spell

" Set spellfile to location that is guaranteed to exist,
" can be symlinked to Dropbox or kept in Git
" and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" Flutter
nnoremap <leader>fe :CocCommand flutter.emulators<CR>
nnoremap <leader>fr :CocCommand flutter.dev.hotRestart<CR>
nnoremap <leader>fd :below CocCommand flutter.dev.openDevLog<CR>
nnoremap <leader>fj flutter pub run build_runner build<CR>
nnoremap <silent> <leader>cf  :<C-u>CocList --input=flutter. commands<CR>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
lua << EOF
EOF
