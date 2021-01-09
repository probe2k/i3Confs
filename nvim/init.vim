" Source themes from ~/.config/nvim/themes/airline.vim
source /home/probe/.config/nvim/themes/airline.vim

" Source keymaps to access buffers
source /home/probe/.config/nvim/keymaps/shortcuts.vim

" Source coc.vim for intelliSense autocompletion
" source /home/probe/.config/nvim/coc-config/coc.vim

" Plugins for vim
call plug#begin('/home/probe/.config/nvim/plugged')
" Tools
	Plug 'vim-airline/vim-airline'
	Plug 'junegunn/goyo.vim'
	Plug 'dart-lang/dart-vim-plugin'
" Syntax
	Plug 'tpope/vim-markdown'
	Plug 'ap/vim-css-color' " Displays a preview of colors with CSS
	Plug 'vim-scripts/fountain.vim'
	Plug 'preservim/nerdtree'

" File Explorer - nerdtree
"	Plug 'scrooloose/nerdtree'

" Autocomplete - CoC
"	Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorscheme
"	Plug 'morhetz/gruvbox'
call plug#end()

set encoding=UTF-8

" Reduce history limit to 100 from 10000
set history=100

" Colorscheme
" set background=dark
colorscheme rdark-terminal2

" Tabbing to 4
set list
set listchars=tab:\|\ 
set tabstop=4
set shiftwidth=4

" Basics
syntax on
set nowrap
set autoread
set cursorline
set relativenumber
set number

" Search
set ignorecase
set smartcase

" Auto completion
" set wildmenu

" Set space indenter
set lcs+=space:•

" Set NERDTree to start with vim argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
