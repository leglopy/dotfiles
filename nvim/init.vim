"Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" set clipboard^=unnamed,unnamedplus

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
set backupcopy=yes

"language en_US
let g:python3_host_prog = '/usr/bin/python3'
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Svelte
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
let g:vim_svelte_plugin_load_full_syntax = 1
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'zk-org/zk-nvim'
Plug 'folke/todo-comments.nvim'
Plug 'NvChad/nvim-colorizer.lua'
" Dart
Plug 'dart-lang/dart-vim-plugin'
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
Plug 'ray-x/aurora'      " for Plug user
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'olacin/telescope-cc.nvim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'Exafunction/codeium.nvim', { 'branch': 'main' }

Plug 'loctvl842/monokai-pro.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

"Autocomplete and snippets LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v4.x'}

"Show signature when you type
Plug 'ray-x/lsp_signature.nvim'

"Mini.AI
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }

call plug#end()

let mapleader = " "
set encoding=utf-8

nnoremap <leader>u :UndotreeToggle<CR>

" Search
nnoremap n nzzzv
nnoremap N Nzzzv

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
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
"nnoremap <leader>fe :CocCommand flutter.emulators<CR>
"nnoremap <leader>fr :CocCommand flutter.dev.hotRestart<CR>
"nnoremap <leader>fd :below CocCommand flutter.dev.openDevLog<CR>
"nnoremap <leader>fj flutter pub run build_runner build<CR>
"nnoremap <silent> <leader>cf  :<C-u>CocList --input=flutter. commands<CR>

"Telescope conventional commits
nnoremap <leader>g :Telescope conventional_commits<CR>

"Colorizer
lua << EOF
require 'colorizer'.setup()
require 'lsp_shortcuts'
require 'mason_lsp'
require 'zk_init'
require'nvim-treesitter.configs'.setup{
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "typescript", "javascript", "html", "astro" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
}
require('todo-comments').setup{}
require('mini.ai').setup()
vim.cmd([[
augroup _astro
autocmd!
autocmd BufRead,BufEnter *.astro set filetype=astro
augroup end
]])
EOF

