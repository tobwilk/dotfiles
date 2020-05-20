"
" Tobys vimrc file
"

" Standard stuff
set backspace=2
set tabstop=4
set expandtab
set ruler
set shiftwidth=4
set softtabstop=4
set cursorline
set smarttab
set number
syntax on
            
" set leader key
let mapleader=" "

" USE VUNDLE
" set the runtimepath to include Vundle and initialize
" Make sure to clone git into the vim directory using:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" inside vim, run :PluginInstall
" to search plugins, run :PluginSearch foobar

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Add plugins here
"

Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
" Plugin 'git@github.com:Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight searching
set incsearch
set showmatch
set hlsearch

" KEYBOARD BINDINGS

" Disable the arrow keys to force good vim practice
"no <down> <Nop>
"no <left> <Nop>
"no <right> <Nop>
"no <up> <Nop>
"ino <down> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
"ino <up> <Nop>

" NERDTree toggle key - ctrl+n
"map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Map jj to escape insert mode, its quicker
imap jj <Esc>

" Switch vim windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" Filetype stuff
filetype plugin on 
filetype indent on

" Get rid of anoying files
set nobackup " do not keep backups after close
set nowritebackup " do not keep a backup while working
set noswapfile " don't keep swp files either

"colours
colorscheme gruvbox
set background=dark

" enable spelling for markdown. ctl+ N/P auto completes
autocmd BufRead, BufNewFile *.md setlocal spell spelllang=en_gb
set complete+=kspell

" Line wrap for markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
set autoindent
