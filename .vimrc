"
" Tobys vimrc
"

let mapleader=" "       " set leader as space

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
set textwidth=100
set autoindent          " always set autoindenting on
set foldmethod=indent   " Allow folding based on ident
set foldlevel=20        " Auto unfold to level 20 (all)
set visualbell          " Disable anying bell on WSL
set colorcolumn=100      " guide ruler for line length
"set spell               " Enable spellchecker
filetype plugin on
filetype indent on
syntax on

" Highlight searching
set incsearch
set showmatch
set hlsearch

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Get rid of anoying files
set nobackup " do not keep backups after close
set nowritebackup " do not keep a backup while working
set noswapfile " don't keep swp files either

" Map jj to escape insert mode, its quicker
imap jj <Esc>

" Switch vim windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" enable spelling for markdown. ctl+ N/P auto completes
autocmd BufRead, BufNewFile *.md setlocal spell spelllang=en_gb
set complete+=kspell

" Line wrap for markdown
au BufRead,BufNewFile *.md setlocal textwidth=100
set autoindent

" Alias write and quit
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" Set tmux pane title, to open vim filename
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


" --------------------------------- PLUGINS  ------------------------------------------------------

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
" --------------------------------- PLUGINS END ---------------------------------------------------


"--------------------------------- PLUGIN CONFIGURATION -------------------------------------------

" Rainbox pairs
au FileType c,cpp,objc,objcpp,js call rainbow#load()
let g:rainbow_active = 1

" NERDTree
"map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" fzf
nnoremap <C-p> :Files<Cr>           " map ctrl+p to fzf

" colours
colorscheme gruvbox
set background=dark

" VimWiki
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



"----------------------------- CoC CONFIGURATION START --------------------------------------------
" testEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
          set signcolumn=yes
      endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
          inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
      endif

      " Use `[g` and `]g` to navigate diagnostics
      " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)

      " GoTo code navigation.
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)

      " Use K to show documentation in preview window.
      nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
    " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"-------------------------- COC CONFIGURATION END -------------------------------------------------
