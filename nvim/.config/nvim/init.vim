" Plugins
call plug#begin()
	Plug 'tmsvg/pear-tree'
	Plug 'vim-airline/vim-airline'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'arcticicestudio/nord-vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-sensible'
	" Plug 'tpope/vim-fugative'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'akinsho/bufferline.nvim'
	Plug 'preservim/nerdtree' 
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim' 
	Plug 'lewis6991/spellsitter.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'akinsho/toggleterm.nvim'
	Plug 'github/copilot.vim'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap
set relativenumber
set number
set mouse=a
set spell
set clipboard=unnamed
set belloff=all
set hidden
set rtp+=/opt/homebrew/opt/fz
let mapleader=" "
syntax enable
filetype plugin indent on

" Appearance
" colorscheme nord
set termguicolors

" key mappings
inoremap jk <Esc>
noremap <S-j> :bnext<CR>
noremap <S-k> :bprevious<CR>
noremap <Tab> :bprevious<CR>
map <C-s> :w<CR>
" map <C-q> :q<CR>

" Plugin key mappings
nnoremap <leader>n	:NERDTreeToggle<CR>
nnoremap <leader>f	:Files<CR>
nnoremap <C-_>		:Commentary<bar> j<CR>
nnoremap <Leader>' :ToggleTerm<CR>

" move around splits with Alt-arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

if has('nvim')
lua << EOF
	require('utils')
	require("bufferline").setup{}
	require('spellsitter').setup()
	require("terminal").setup()
	require("term_options")
local key_mapper = require('utils').key_mapper
key_mapper('n', '<C-q>', '<cmd>lua require("utils").close_buffer()<CR>')
EOF
endif
