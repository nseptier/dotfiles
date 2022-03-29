set autoindent
set autoread
set backupdir=~/.vim/backup//
set clipboard=unnamed
set cmdheight=1
set conceallevel=2
set directory=~/.vim/swap//
set encoding=utf-8
set expandtab
set fillchars=fold:-,vert:
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

let g:sql_type_default = 'pgsql'

autocmd VimResized * wincmd =

" plug
call plug#begin()
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'ayu-theme/ayu-vim'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'haya14busa/incsearch.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lifepillar/pgsql.vim'
Plug 'machakann/vim-sandwich'
Plug 'michaeljsmith/vim-indent-object'
Plug 'milch/vim-fastlane'
Plug 'moll/vim-bbye'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug 'preservim/vimux'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sveltejs/prettier-plugin-svelte'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tveskag/nvim-blame-line'
Plug 'udalov/kotlin-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'Yggdroot/indentLine'
Plug 'gerw/vim-HiLinkTrace'
Plug 'phaazon/hop.nvim'
Plug 'logico/typewriter-vim'
call plug#end()

let g:svelte_preprocessors = ['typescript']

let g:blameLineUseVirtualText = 1
let g:blameLineVirtualTextHighlight = 'Directory'
let g:blameLineGitFormat = '  %an, %ar in #%h - %s'
" nnoremap <silent> <leader>tb :ToggleBlameLine<CR>
" augroup GitBlame
"   au!
"   au VimEnter,WinEnter,BufWinEnter * EnableBlameLine
"   au WinLeave,BufWinLeave * DisableBlameLine
" augroup END

" some keymaps
noremap <silent> <leader>s :sort i<cr>
nnoremap <silent> <leader>Q :DeleteHiddenBuffers<CR>
nnoremap <silent> <leader>qq :Bdelete!<cr>
nmap <silent> <Esc><Esc> :noh<cr>
nnoremap <silent> <leader>w :HopChar1<cr>

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

lua require'hop'.setup()

" colorscheme
set termguicolors
syntax enable
" let ayucolor="mirage"
let ayucolor="bronzevine"
color ayu
autocmd BufEnter * :syntax sync fromstart
"
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

nnoremap <silent> <leader>tc :ColorToggle<CR>

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

let g:indentLine_char = '⋮'
let g:indentLine_first_char = '⋮'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setConceal = 0
" let g:indentLine_defaultGroup = 'LineNr'

let g:vim_json_syntax_conceal = 0

autocmd FileType fzf IndentLinesDisable

" Prompt for a command to run
map <Leader>tt :VimuxPromptCommand<CR>

" search
set hlsearch
let g:incsearch#auto_nohlsearch = 1

" prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#config_precedence = 'cli-override'
let g:prettier#config#print_width = 80
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#plugin_search_dir = '.'
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0

" fzf
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
let g:fzf_layout = { 'down': '50%' }
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'NormalFloat'],
    \ 'hl':      ['fg', 'NERDTreeClosable'],
    \ 'fg+':     ['fg', 'SpellCap', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLineNr', 'CursorColumn'],
    \ 'hl+':     ['fg', 'DiffDelete'],
    \ 'info':    ['fg', 'Directory'],
    \ 'border':  ['fg', 'NonText'],
    \ 'prompt':  ['fg', 'Title'],
    \ 'pointer': ['fg', 'Title'],
    \ 'marker':  ['fg', 'SpellRare'],
    \ 'spinner': ['fg', 'SpellRare'],
    \ 'header':  ['fg', 'SpellRare'] }
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_commits_log_options = '--graph --color=always --abbrev-commit --author-date-order --date=relative --decorate --format="%C(white bold)%h%C(reset) %s %C(white bold)by%C(reset) %C(cyan bold)%an%C(reset)%C(white bold), %cr%C(reset)%C(auto)%d%C(reset)"'

nmap <silent> <C-p> :Files<Cr>
nmap <silent> <C-b> :Buffers<Cr>
nmap <silent> <C-c> :Commits<Cr>

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 0
let g:vim_jsx_pretty_disable_tsx = 1

" agriculture
let g:agriculture#rg_options = '--hidden --smart-case'

nmap <Leader>f <Plug>RgRawSearch
nmap <Leader>F <Plug>RgRawWordUnderCursor<cr>

" nerdtree
let g:NERDTreeWinSize=40
nnoremap <Leader>e :NERDTreeFocus<cr>
nnoremap <Leader>E :NERDTreeFind<cr>zt
let g:NERDTreeShowHidden = 1
" autocmd BufEnter * lcd %:p:h
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" multiline macros
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" statusline
let g:currentmode={
      \ 'n': 'n',
      \ 'no': 'no',
      \ 'nov': 'nov',
      \ 'noV': 'noV',
      \ 'noCTRL-V': 'noCTRL-V',
      \ 'niI': 'niI',
      \ 'niR': 'niR',
      \ 'niV': 'niV',
      \ 'v': 'v',
      \ 'V': 'V',
      \ "\<C-V>": 'CTRL-V',
      \ 's': 's',
      \ 'S': 'S',
      \ "\<C-S>": 'CTRL-S',
      \ 'i': 'i',
      \ 'ic': 'i',
      \ 'ix': 'ix',
      \ 'R': 'R',
      \ 'Rc': 'Rc',
      \ 'Rv': 'Rv',
      \ 'Rx': 'Rx',
      \ 'c': 'c',
      \ 'cv': 'cv',
      \ 'ce': 'ce',
      \ 'r': 'r',
      \ 'rm': 'rm',
      \ 'r?': 'r?',
      \ '!': '!',
      \ 't': 't',
      \}

set statusline=
" buffer
set statusline+=%#BufferNr#\ %n\ 
set statusline+=%#ActiveBufferNrArrow#%{g:actual_curwin==win_getid()?'':''}
set statusline+=%#BufferNrArrow#%{g:actual_curwin!=win_getid()?'':''}

set statusline+=%#ActiveFilename#%{g:actual_curwin==win_getid()?'\ \ '.(expand('%:f')==''?'':expand('%:f').'\ '):''}
set statusline+=%{g:actual_curwin==win_getid()?(&modified?'\ ✱\ ':''):''}
set statusline+=%{g:actual_curwin==win_getid()?(&readonly?'\ \ ':''):''}
set statusline+=%#ActiveFilenameArrow#%{g:actual_curwin==win_getid()?'\ ':''}
set statusline+=%#Filename#%{g:actual_curwin!=win_getid()?'\ \ '.(expand('%:f')==''?'':expand('%:f').'\ '):''}
set statusline+=%{g:actual_curwin!=win_getid()?(&modified?'\ ✱\ ':''):''}
set statusline+=%{g:actual_curwin!=win_getid()?(&readonly?'\ \ ':''):''}
set statusline+=%#FilenameArrow#%{g:actual_curwin!=win_getid()?'\ ':''}

set statusline+=%*\ %l:%c
set statusline+=%*
set statusline+=\ 

" mode
set statusline+=%#NormalMode#%{g:actual_curwin==#win_getid()&&(g:currentmode[mode()]==#'n')?'\ NORMAL\ ':''}
set statusline+=%#EditMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'i')?'\ INSERT\ ':''}
set statusline+=%#EditMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'r')?'\ REPLACE\ ':''}
set statusline+=%#EditMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'rv')?'\ VISUAL\ REPLACE\ ':''}
set statusline+=%#VisualMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'v')?'\ VISUAL\ ':''}
set statusline+=%#VisualMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'V')?'\ VISUAL\ LINE\ ':''}
set statusline+=%#VisualMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'CTRL-V')?'\ VISUAL\ BLOCK\ ':''}
set statusline+=%#CommandMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'c')?'\ COMMAND\ ':''}
set statusline+=%#CommandMode#%{g:actual_curwin==win_getid()&&(g:currentmode[mode()]==#'f')?'\ TERMINAL\ ':''}

set statusline+=%*
set statusline+=%=

" Highlight past column 80
" let &colorcolumn=join(range(81, 120), ',')

" In Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don’t type over our limit
" set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" coc
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=no

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

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap keys for applying codeAction to the current line.
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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
