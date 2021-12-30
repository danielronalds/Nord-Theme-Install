set number 
set so=999
set tabstop=4

call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'arcticicestudio/nord-vim'
	Plug 'itchyny/lightline.vim'

	""Plug 'vim-airline/vim-airline-themes'
	""Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme nord

"" Lightline configuration

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"" NERDTree configuration

map <F5> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
