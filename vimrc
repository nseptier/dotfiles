set autoindent
set autoread
set backupdir=~/.vim/backup//
set clipboard=unnamed
set cmdheight=1
" set conceallevel=2
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
Plug 'gerw/vim-HiLinkTrace'
Plug 'haya14busa/incsearch.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'logico/typewriter-vim'
Plug 'machakann/vim-sandwich'
Plug 'michaeljsmith/vim-indent-object'
Plug 'milch/vim-fastlane'
Plug 'moll/vim-bbye'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
" Plug 'phaazon/hop.nvim'
Plug 'smoka7/hop.nvim'
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
Plug 'udalov/kotlin-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vim-ruby/vim-ruby'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'luukvbaal/stabilize.nvim'
Plug 'vifm/vifm.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'reisub0/hot-reload.vim'
Plug 'vim-test/vim-test'
call plug#end()

lua require("stabilize").setup()

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

autocmd FileType dart setlocal commentstring=//\ %s

" some keymaps
noremap <silent> <leader>s :sort i<cr>
nnoremap <silent> <leader>Q :DeleteHiddenBuffers<CR>
nnoremap <silent> <leader>qq :Bdelete!<cr>
nmap <silent> <Esc><Esc> :noh<cr>

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

lua << EOF
local hop = require( 'hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1()
end, {remap=true})
EOF

" colorscheme
set termguicolors
syntax enable
color lorem

" function! SynStack()
"     for i1 in synstack(line("."), col("."))
"         let i2 = synIDtrans(i1)
"         let n1 = synIDattr(i1, "name")
"         let n2 = synIDattr(i2, "name")
"         echo n1 "->" n2
"     endfor
" endfunc

" autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd BufEnter * :set signcolumn=no

"
map <Leader>rb :call VimuxRunCommand("clear; npx jest " . bufname("%"))<CR>
"
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead,BufEnter *.tsx,*.jsx set filetype=typescriptreact

nnoremap <silent> <leader>tc :ColorToggle<CR>

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" let g:indentLine_char = '⋮'
" let g:indentLine_defaultGroup = 'LineNr'

lua << EOF
require("ibl").setup {
    indent = { char = "⋮" },
    scope = { enabled = true },
}
EOF

" let g:ibl.config.indent.char = ''
" let g:indent_blankline_show_end_of_line = v:false
" let g:indent_blankline_show_trailing_blankline_indent = v:false

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
let g:prettier#config#print_width = 60
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#plugin_search_dir = '.'
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1

" fzf
let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
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
let g:fzf_commits_log_options = '--graph --color=always --abbrev-commit --author-date-order --date=relative --decorate --format="%C(white bold)%h%C(reset) %s %C(white bold)by%C(reset) %C(cyan bold)%an%C(reset)%C(white bold), %cr%C(reset)%C(auto)%d%C(reset)"'

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

nnoremap <silent><nowait> QQ  :xa!<cr>
nnoremap <silent><nowait> XX  :CocCommand<cr>

nmap <silent> <C-p> :Files<Cr>
nmap <silent> <C-b> :Buffers<Cr>
nmap <silent> <C-c> :Commits<Cr>

let $BAT_THEME="Nord"

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--preview-window=right,60%', '--bind=ctrl-/:toggle-preview', '--info=hidden', '--preview', 'bat --style=plain --color=always {}']}, <bang>0)

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 0
let g:vim_jsx_pretty_disable_tsx = 1

" agriculture
let g:agriculture#rg_options = '--hidden --smart-case --multiline --pcre2'
" let g:agriculture#disable_smart_quoting = 1

nmap <Leader>f <Plug>RgRawSearch
nmap <Leader>F <Plug>RgRawWordUnderCursor<cr>

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

" hi! StatusLine          guibg=#8b8b79 guifg=black
" hi! StatusLineNC        guifg=white
" hi! BufferNr            guibg=white   guifg=#222222
" hi! ActiveBufferNrArrow guibg=#222222 guifg=white
" hi! BufferNrArrow       guibg=#222222 guifg=white
" hi! ActiveFilename      guibg=#222222 guifg=white
" hi! ActiveFilenameArrow guibg=#8b8b79    guifg=#222222
" hi! Filename            guibg=#222222 guifg=white
" hi!FilenameArrow        guibg=NONE    guifg=#222222

set statusline=
" buffer
set statusline+=%#BufferNr#\ %n\ 
set statusline+=%#ActiveBufferNrArrow#%{g:actual_curwin==win_getid()?'':''}
set statusline+=%#BufferNrArrow#%{g:actual_curwin!=win_getid()?'':''}

" expand('%f:p:~:.:h')

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

" Highlight past column 60
" let &colorcolumn=join(range(81, 120), ',')

" In Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don’t type over our limit
autocmd FileType gitcommit set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" coc
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> to scroll float windows/popups
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
