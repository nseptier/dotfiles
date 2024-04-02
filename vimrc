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
" plugins
" ------------------------------------------------------------------------------

call plug#begin()
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gerw/vim-HiLinkTrace'
Plug 'haya14busa/incsearch.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'machakann/vim-sandwich'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'michaeljsmith/vim-indent-object'

Plug 'moll/vim-bbye'
nnoremap <Leader>q :Bdelete<CR>

Plug 'preservim/vimux'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'reisub0/hot-reload.vim'
Plug 'smoka7/hop.nvim'
Plug 'tpope/vim-abolish'

Plug 'tpope/vim-commentary'
filetype plugin indent on

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'vifm/vifm.vim'
Plug 'vim-test/vim-test'
Plug 'wavded/vim-stylus'
call plug#end()

" ------------------------------------------------------------------------------
" keymaps
" ------------------------------------------------------------------------------

" Sort selection
noremap <silent> <leader>s :sort i<cr>

" Quit buffers
nnoremap <silent><nowait> QQ :xa!<cr>
nnoremap <silent> <leader>Q :DeleteHiddenBuffers<CR>
nnoremap <silent> <leader>qq :Bdelete!<cr>

" Remove search highlights
nmap <silent> <Esc><Esc> :noh<cr>

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

" multiline macros
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" statusline
set statusline=
" buffer
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

" In Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don’t type over our limit
autocmd FileType gitcommit set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51
