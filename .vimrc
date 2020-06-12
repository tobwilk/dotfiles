"
" Tobys vimrc
"
set encoding=utf-8
set nocompatible
set backspace=2
set tabstop=4
set expandtab
set ruler
set shiftwidth=4
set softtabstop=4
set cursorline
set cursorcolumn
set smarttab
set number
set laststatus=2
set ignorecase
set mouse=a
filetype plugin on
filetype indent on
syntax on

" leader key
let mapleader=" "



" ---------- Plugins --------------------------------
" inside vim, run :PluginInstall

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'vimwiki/vimwiki'
" Plugin 'git@github.com:Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on

" -------- Plugins -----------------------------------

" Make vim work with system clipboard
set clipboard+=unnamedplus

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight searching
set incsearch
set showmatch
set hlsearch

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
" also..
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

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

" vimWiki config. Set this the root of your VimWIki directory
let g:vimwiki_list = [{'path': '~/Dropbox/folders/1_PROJECTS/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Set tmux pane title, to open vim filename
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Alias write and quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
