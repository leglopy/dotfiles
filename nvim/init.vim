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

language en_US
"let g:python3_host_prog = '/usr/bin/python3'
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Dart
Plug 'dart-lang/dart-vim-plugin'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'ThePrimeagen/harpoon'
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



let g:coc_global_extensions = ['coc-snippets', 'coc-prettier', 'coc-html', 'coc-highlight', 'coc-tsserver', 'coc-json', 'coc-flutter', 'coc-css']

call plug#end()

let mapleader = " "
set encoding=utf-8

nnoremap <leader>u :UndotreeToggle<CR>

" Git
" let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gf :diffget //2 <Bar>diffupdate<CR>
nmap <leader>gj :diffget //3 <Bar>diffupdate<CR>
nmap <leader>g; :G<CR>

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
nnoremap <leader>fe :CocCommand flutter.emulators<CR>
nnoremap <leader>fr :CocCommand flutter.dev.hotRestart<CR>
nnoremap <leader>fd :below CocCommand flutter.dev.openDevLog<CR>
nnoremap <silent> <leader>cf  :<C-u>CocList --input=flutter. commands<CR>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
nnoremap cn *``cgn
nnoremap cN *``cgN

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
