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
"let mapleader=","

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight searching
set incsearch
set showmatch
set hlsearch

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
map <C-n> :NERDTreeToggle<CR>
"map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Map jj to escape insert mode, its quicker
imap jj <Esc>

" Filetype stuff
filetype plugin on 
filetype indent on

" Get rid of anoying files
set nobackup " do not keep backups after close
set nowritebackup " do not keep a backup while working
set noswapfile " don't keep swp files either

"colours
highlight LineNr ctermfg=grey

