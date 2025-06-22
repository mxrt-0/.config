let mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
call plug#end()

set encoding=UTF-8              
set clipboard+=unnamedplus       
set mouse=                      
set tabstop=4                  
set softtabstop=4             
set shiftwidth=4             
set expandtab               
set number                 
set relativenumber        
set nocursorline         
set splitbelow          
set splitright         
set termguicolors     
set incsearch           
set nohlsearch         
set ignorecase        
set smartcase        
set laststatus=2
set noshowmode      
set hidden        

nnoremap <silent><leader>ls :Buffers<CR>                       
nnoremap <silent><leader>ff :Files<CR>                          
nnoremap <silent><leader>fg :GFiles<CR>                          
nnoremap <silent><leader>fr :Files /<CR>                          
nnoremap <silent><leader>fh :Files ~/<CR>                          
nnoremap <silent><leader>fc :Files ~/.config<CR>                          
nnoremap <silent><leader>fp :Files ~/projects<CR>                          
nnoremap <leader>e :NERDTreeToggle<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"
let g:lightline = {'colorscheme' : 'selenized_light'}
colorscheme acme
