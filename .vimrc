"
" Tobys vimrc

" leader key. space and , are good options
let mapleader=" "

" Global settings
set encoding=utf-8
set nocompatible
set backspace=2
set tabstop=4           " tabs are n spaces
set expandtab           " expand tabs by default (overloadable per file type)
set ruler               " underlines current line
set shiftwidth=4        " number of spaces to use for autoindenting
set softtabstop=4       " when hitting <BS>, pretend like a tab is removed, even if spaces
set cursorline
set cursorcolumn
set smarttab            "insert tabs on the start of a line according to shiftwidth, not tabstop
set smartindent
set number              " Shows line numbers
set laststatus=2
set ignorecase
"set mouse=a
set clipboard=unnamed
set textwidth=80
set autoindent          " always set autoindenting on
set foldmethod=indent   " Allow folding based on ident
set foldlevel=20        " Auto unfold to level 20 (all)
set visualbell          " Disable anying bell on WSL
set colorcolumn=100      " guide ruler for line length
"set spell               " Enable spellchecker
filetype plugin on
filetype indent on
syntax on


" ------ Plugins -------------------------------------
" Make sure Plug is installed first
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'              " nice colour theme
Plug 'scrooloose/nerdtree'          " File explorer tree
Plug 'vimwiki/vimwiki'              " A wiki, for vim`
Plug 'tpope/vim-fugitive'           " Nice git integration
Plug 'vim-airline/vim-airline'      " Nice status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} "intellisense
Plug 'junegunn/goyo.vim'            " Distraction free writer
Plug 'frazrepo/vim-rainbow'         " Color matches brackets
Plug 'jiangmiao/auto-pairs'         " auto closes brackets
Plug 'airblade/vim-gitgutter'       " Show git status on the left.
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/limelight.vim'       " Text focusing - Disabled, Unsuported in WLS at the moment

call plug#end()
" Reload .vimrc and :PlugInstall to install plugins
" ----- Plugins end ----------------------------------

" Rainbox pairs filetypes
au FileType c,cpp,objc,objcpp,js call rainbow#load()
let g:rainbow_active = 1

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

nnoremap <C-p> :Files<Cr>           " map ctrl+p to fzf

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

" ---- VimWiki --------------
" vimWiki config. Set this the root of your VimWIki directory
let g:vimwiki_list = [{'path': '~/Dropbox/folders/1_PROJECTS/notes/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

command! Genlinks VimwikiDiaryGenerateLinks


" ---- VimWiki ----

" Set tmux pane title, to open vim filename
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Alias write and quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" ---- CoC configuration ----

set cmdheight=2
set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")

" Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()




