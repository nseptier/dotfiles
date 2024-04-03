" ------------------------------------------------------------------------------
" options
" ------------------------------------------------------------------------------

set autoindent
set autoread
set backupdir=~/.vim/backup//
set clipboard=unnamed
set cmdheight=1
set directory=~/.vim/swap//
set encoding=utf-8
set expandtab
set fillchars=fold:-,vert:▏
set foldcolumn=0
set foldlevel=99
set foldlevelstart=99
set foldmethod=indent
set foldnestmax=20
set foldopen-=block
set foldtext=
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=eol:↲,tab:→\ ,trail:×,precedes:‹,extends:›,nbsp:~,space:\ 
set lcs=tab:\|\→
set nocompatible
set nocursorcolumn
set cursorline
set noswapfile
set nowrap
set number relativenumber
set path=$PWD/**
set rtp+=/usr/local/opt/fzf
set ruler
set scrolloff=2
set shiftwidth=2
set showtabline=0
set smartcase
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undo//
set wildignore+=*/node_modules/**
set signcolumn=no

" ------------------------------------------------------------------------------
" keymaps
" ------------------------------------------------------------------------------

" Sort selection
noremap <silent> <leader>s :sort i<cr>

" Quit buffers
nnoremap <Leader>q :Bdelete<CR>
nnoremap <silent> <leader>Q :DeleteHiddenBuffers<CR>
nnoremap <silent> <leader>qq :Bdelete!<cr>
nnoremap <silent><nowait> QQ :xa!<cr>

" Remove search highlights
nmap <silent> <Esc><Esc> :noh<cr>

" Move lines
vnoremap <silent> <s-J> :m '>+1<CR>gv
vnoremap <silent> <s-K> :m '<-2<CR>gv

" Others
nnoremap H ^
nnoremap L $

" ------------------------------------------------------------------------------
" statusline
" ------------------------------------------------------------------------------

set statusline=
set statusline+=%#BufferNr#\ %n\ 
set statusline+=%#ActiveBufferNrArrow#%{g:actual_curwin==win_getid()?'':''}
set statusline+=%#BufferNrArrow#%{g:actual_curwin!=win_getid()?'':''}
set statusline+=%#ActiveFilename#%{g:actual_curwin==win_getid()?'\ \ '.(expand('%:~')==''?'':expand('%:~:.').'\ '):''}
set statusline+=%{g:actual_curwin==win_getid()?(&modified?'\ ✱\ ':''):''}
set statusline+=%{g:actual_curwin==win_getid()?(&readonly?'\ \ ':''):''}
set statusline+=%#ActiveFilenameArrow#%{g:actual_curwin==win_getid()?'\ ':''}
set statusline+=%#Filename#%{g:actual_curwin!=win_getid()?'\ \ '.(expand('%:~')==''?'':expand('%:~:.').'\ '):''}
set statusline+=%{g:actual_curwin!=win_getid()?(&modified?'\ ✱\ ':''):''}
set statusline+=%{g:actual_curwin!=win_getid()?(&readonly?'\ \ ':''):''}
set statusline+=%#FilenameArrow#%{g:actual_curwin!=win_getid()?'\ ':''}
set statusline+=%*\ %l:%c
set statusline+=%*
set statusline+=\ 
set statusline+=%*
set statusline+=%=

" ------------------------------------------------------------------------------
" Miscellaneous
" ------------------------------------------------------------------------------

" colorscheme
set termguicolors
syntax enable
color lorem

" Auto resize buffers size on window resize
autocmd VimResized * wincmd =

" search
set hlsearch
let g:incsearch#auto_nohlsearch = 1

" In Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don’t type over our limit
autocmd FileType gitcommit set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51
