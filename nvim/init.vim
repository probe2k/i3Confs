" Source themes from ~/.config/nvim/themes/themes.vim
source /home/probe/.config/nvim/themes/themes.vim

" Source keymaps to access buffers
source /home/probe/.config/nvim/keymaps/shortcuts.vim

" Plugins for vim
call plug#begin('/home/probe/.config/nvim/plugged')
	Plug 'mengelbrecht/lightline-bufferline'
"	Plug 'junegunn/goyo.vim'
	Plug 'ryanoasis/vim-devicons'
"	Plug 'dart-lang/dart-vim-plugin'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-markdown'
"	Plug 'vim-scripts/fountain.vim'
	Plug 'preservim/nerdtree'
"	Plug 'Brettm12345/moonlight.vim'
call plug#end()

let g:loaded_X_provider = 0
"let g:python3_host_prog = '/home/probe/anaconda3/bin/python3'
