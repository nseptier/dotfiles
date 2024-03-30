" Initialisation:"{{{
" ----------------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

let s:style = get(g:, 'ayucolor', 'dark')
let g:colors_name = "ayu"
"}}}

" Palettes:"{{{
" ----------------------------------------------------------------------------

let s:palette = {}

let s:palette.bg        = {'dark': "#0F1419",  'light': "#FAFAFA",  'mirage': "#212733",  'bronzelemon': "#262A2E",  'bronzevine': "#262A2E"}
let s:palette.comment   = {'dark': "#5C6773",  'light': "#ABB0B6",  'mirage': "#5C6773",  'bronzelemon': "#696758",  'bronzevine': "#696758"}
let s:palette.markup    = {'dark': "#F07178",  'light': "#F07178",  'mirage': "#F07178",  'bronzelemon': "#F07178",  'bronzevine': "#F07178"}
let s:palette.constant  = {'dark': "#FFEE99",  'light': "#A37ACC",  'mirage': "#D4BFFF",  'bronzelemon': "#EEE6AB",  'bronzevine': "#5B7C8D"}
let s:palette.operator  = {'dark': "#E7C547",  'light': "#E7C547",  'mirage': "#80D4FF",  'bronzelemon': "#C5BC8E",  'bronzevine': "#C5BC8E"}
let s:palette.tag       = {'dark': "#36A3D9",  'light': "#36A3D9",  'mirage': "#5CCFE6",  'bronzelemon': "#79BD9A",  'bronzevine': "#79BD9A"}
let s:palette.regexp    = {'dark': "#95E6CB",  'light': "#4CBF99",  'mirage': "#95E6CB",  'bronzelemon': "#457B9C",  'bronzevine': "#457B9C"}
let s:palette.string    = {'dark': "#B8CC52",  'light': "#86B300",  'mirage': "#BBE67E",  'bronzelemon': "#FDDF4D",  'bronzevine': "#C06C84"}
let s:palette.function  = {'dark': "#FFB454",  'light': "#F29718",  'mirage': "#FFD57F",  'bronzelemon': "#A8DBA8",  'bronzevine': "#A8DBA8"}
let s:palette.special   = {'dark': "#E6B673",  'light': "#E6B673",  'mirage': "#FFC44C",  'bronzelemon': "#696758",  'bronzevine': "#696758"}
let s:palette.keyword   = {'dark': "#FF7733",  'light': "#FF7733",  'mirage': "#FFAE57",  'bronzelemon': "#3B8686",  'bronzevine': "#3B8686"}
let s:palette.error     = {'dark': "#FF3333",  'light': "#FF3333",  'mirage': "#FF3333",  'bronzelemon': "#FF3333",  'bronzevine': "#FF3333"}
let s:palette.accent    = {'dark': "#F29718",  'light': "#FF6A00",  'mirage': "#FFCC66",  'bronzelemon': "#FFCC66",  'bronzevine': "#FC9D9A"}
let s:palette.panel     = {'dark': "#14191F",  'light': "#FFFFFF",  'mirage': "#272D38",  'bronzelemon': "#272D38",  'bronzevine': "#272D38"}
let s:palette.guide     = {'dark': "#2D3640",  'light': "#D9D8D7",  'mirage': "#3D4751",  'bronzelemon': "#3D4751",  'bronzevine': "#3D4751"}
let s:palette.line      = {'dark': "#151A1E",  'light': "#F3F3F3",  'mirage': "#242B38",  'bronzelemon': "#242B38",  'bronzevine': "#1D2227"}
let s:palette.selection = {'dark': "#253340",  'light': "#F0EEE4",  'mirage': "#343F4C",  'bronzelemon': "#151A1E",  'bronzevine': "#151A1E"}
let s:palette.fg        = {'dark': "#E6E1CF",  'light': "#5C6773",  'mirage': "#D9D7CE",  'bronzelemon': "#D9D7CE",  'bronzevine': "#D9D7CE"}
let s:palette.fg_idle   = {'dark': "#3E4B59",  'light': "#828C99",  'mirage': "#607080",  'bronzelemon': "#607080",  'bronzevine': "#607080"}
let s:palette.cursor    = {'dark': "#1B2129",  'light': "#1B2129",  'mirage': "#1B2129",  'bronzelemon': "#1D2227",  'bronzevine': "#1D2227"}
let s:palette.highlight = {'dark': "#151A1E",  'light': "#151A1E",  'mirage': "#151A1E",  'bronzelemon': "#151A1E",  'bronzevine': "#151A1E"}
let s:palette.lulz      = {'dark': "#151A1E",  'light': "#151A1E",  'mirage': "#151A1E",  'bronzelemon': "#151A1F",  'bronzevine': "#151A1F"}
let s:palette.joker     = {'dark': "#45484B",  'light': "#45484B",  'mirage': "#45484B",  'bronzelemon': "#45484B",  'bronzevine': "#45484B"}

"}}}

" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------

function! s:build_prim(hi_elem, field)
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_gray
  let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field][s:style] " guibg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key_name, d_value] in items(s:palette)
  call s:build_prim('bg', key_name)
  call s:build_prim('fg', key_name)
endfor
" }}}

" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
"}}}


" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! Normal"        .s:fg_fg          .s:bg_bg        .s:fmt_none
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
" Conceal, Cursor, CursorIM
exe "hi! CursorColumn"  .s:fg_none        .s:bg_cursor      .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_cursor      .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_operator    .s:bg_cursor      .s:fmt_none
exe "hi! LineNr"        .s:fg_guide       .s:bg_none        .s:fmt_none

exe "hi! Directory"     .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_function    .s:bg_highlight   .s:fmt_revr
exe "hi! DiffChange"    .s:fg_none        .s:bg_highlight   .s:fmt_none
exe "hi! DiffText"      .s:fg_constant    .s:bg_highlight   .s:fmt_revr
exe "hi! DiffDelete"    .s:fg_markup      .s:bg_highlight   .s:fmt_revr
exe "hi! ErrorMsg"      .s:fg_error       .s:bg_none        .s:fmt_none
exe "hi! VertSplit"     .s:fg_bg          .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_joker       .s:bg_none        .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_panel       .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_panel       .s:fmt_none
"   Incsearch"

exe "hi! MatchParen"    .s:fg_fg          .s:bg_none        .s:fmt_undr
exe "hi! ModeMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_fg          .s:bg_cursor      .s:fmt_none
exe "hi! PmenuSel"      .s:fg_fg          .s:bg_cursor      .s:fmt_revr

"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_highlight   .s:bg_fg          .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_tag         .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_keyword     .s:bg_none        .s:fmt_undr
exe "hi! SpellBad"      .s:fg_error       .s:bg_none        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_regexp      .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_fg          .s:bg_lulz        .s:fmt_none
exe "hi! StatusLineNC"  .s:fg_fg          .s:bg_selection   .s:fmt_none
exe "hi! WildMenu"      .s:fg_bg          .s:bg_markup      .s:fmt_none
exe "hi! TabLine"       .s:fg_fg          .s:bg_panel       .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_keyword     .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_highlight   .s:bg_fg          .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_error       .s:bg_none        .s:fmt_none

" TODO LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

"}}}

" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment   .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_constant  .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_string    .s:bg_none        .s:fmt_none
"   Character"
"   Number"
"   Boolean"
"   Float"

exe "hi! Identifier"      .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_function  .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_keyword   .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_operator  .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"

exe "hi! PreProc"         .s:fg_joker   .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_tag       .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_special   .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_special   .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_tag       .s:bg_none        .s:fmt_undr

exe "hi! Ignore"          .s:fg_none      .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_fg        .s:bg_error       .s:fmt_none

exe "hi! Todo"            .s:fg_markup    .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_keyword   .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

exe "hi! Conceal"         .s:fg_special     .s:bg_none        .s:fmt_none
exe "hi! CursorLineConceal" .s:fg_selection   .s:bg_line        .s:fmt_none


" Terminal
" ---------
if has("nvim")
  let g:terminal_color_0 =  s:palette.bg[s:style]
  let g:terminal_color_1 =  s:palette.markup[s:style]
  " let g:terminal_color_2 =  s:palette.string[s:style]
  let g:terminal_color_2 =  s:palette.tag[s:style]
  let g:terminal_color_3 =  s:palette.accent[s:style]
  " let g:terminal_color_4 =  s:palette.tag[s:style]
  let g:terminal_color_4 =  s:palette.keyword[s:style]
  let g:terminal_color_5 =  s:palette.regexp[s:style]
  let g:terminal_color_6 =  s:palette.tag[s:style]
  let g:terminal_color_7 =  s:palette.special[s:style]
  let g:terminal_color_8 =  s:palette.fg_idle[s:style]
  let g:terminal_color_9 =  s:palette.error[s:style]
  let g:terminal_color_10 = s:palette.string[s:style]
  let g:terminal_color_11 = s:palette.accent[s:style]
  let g:terminal_color_12 = s:palette.tag[s:style]
  let g:terminal_color_13 = s:palette.constant[s:style]
  let g:terminal_color_14 = s:palette.regexp[s:style]
  let g:terminal_color_15 = "#FFFFFF"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = s:palette.fg[s:style]
else
  let g:terminal_ansi_colors =  [s:palette.bg[s:style],      s:palette.markup[s:style]]
  let g:terminal_ansi_colors += [s:palette.string[s:style],  s:palette.accent[s:style]]
  let g:terminal_ansi_colors += [s:palette.tag[s:style],     s:palette.constant[s:style]]
  let g:terminal_ansi_colors += [s:palette.regexp[s:style],  "#FFFFFF"]
  let g:terminal_ansi_colors += [s:palette.fg_idle[s:style], s:palette.error[s:style]]
  let g:terminal_ansi_colors += [s:palette.string[s:style],  s:palette.accent[s:style]]
  let g:terminal_ansi_colors += [s:palette.tag[s:style],     s:palette.constant[s:style]]
  let g:terminal_ansi_colors += [s:palette.regexp[s:style],  s:palette.comment[s:style]]
endif


" NerdTree
" ---------
exe "hi! NERDTreeOpenable"          .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! NERDTreeClosable"          .s:fg_accent      .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarksHeader"   .s:fg_pink        .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarksLeader"   .s:fg_bg          .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarkName"      .s:fg_keyword     .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeCWD"               .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! NERDTreeUp"                .s:fg_fg_idle    .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDir"               .s:fg_function   .s:bg_none        .s:fmt_none
exe "hi! NERDTreeFile"              .s:fg_none       .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDirSlash"          .s:fg_accent     .s:bg_none        .s:fmt_none


" GitGutter
" ---------
exe "hi! GitGutterAdd"          .s:fg_string     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChange"       .s:fg_tag        .s:bg_none        .s:fmt_none
exe "hi! GitGutterDelete"       .s:fg_markup     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChangeDelete" .s:fg_function   .s:bg_none        .s:fmt_none

"}}}

" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
hi! link diffOldFile Keyword
hi! link diffNewFile Keyword
hi! link diffFile LineNr
hi! link diffOnly DiffAdd
" hi! link diffIdentical ErrorMsg
" hi! link diffDiffer ErrorMsg
" hi! link diffBDiffer ErrorMsg
" hi! link diffIsA ErrorMsg
" hi! link diffNoEOL ErrorMsg
" hi! link diffCommon ErrorMsg
" hi! link diffRemoved DiffDelete
" hi! link diffChanged DiffChange
" hi! link diffAdded DiffAdd
hi! link diffLine LineNr
hi! link diffSubname LineNr
" hi! link diffComment ErrorMsg

hi! link gitDiff Comment

exe "hi! diffAdded"       .s:fg_tag         .s:bg_none   .s:fmt_none
exe "hi! diffChanged"    .s:fg_none        .s:bg_none   .s:fmt_none
exe "hi! diffRemoved"    .s:fg_markup      .s:bg_none   .s:fmt_none

" fugitive

hi! link fugitiveUnstagedSection CursorLineNr
hi! link fugitiveUnstagedHeading Comment
hi! link fugitiveCount LineNr
hi! link fugitiveSymbolicRef Comment
hi! link fugitiveHeader Comment
hi! link fugitiveStagedSection keyword
hi! link fugitiveStagedHeading Comment
hi! link fugitiveHash Directory

" statusline

exe "hi! BufferNrArrow"         .s:fg_highlight   .s:bg_cursor      .s:fmt_none
exe "hi! ActiveBufferNrArrow"   .s:fg_highlight   .s:bg_keyword     .s:fmt_none

exe "hi! NormalMode"            .s:fg_highlight   .s:bg_fg_idle     .s:fmt_none
exe "hi! EditMode"              .s:fg_highlight   .s:bg_keyword     .s:fmt_none
exe "hi! VisualMode"            .s:fg_highlight   .s:bg_fg          .s:fmt_none
exe "hi! CommandMode"           .s:fg_highlight   .s:bg_regexp      .s:fmt_none

exe "hi! ActiveFilename"        .s:fg_highlight   .s:bg_keyword     .s:fmt_none
exe "hi! ActiveFilenameArrow"   .s:fg_keyword     .s:bg_highlight   .s:fmt_none
exe "hi! Filename"              .s:fg_fg          .s:bg_cursor      .s:fmt_none
exe "hi! FilenameArrow"         .s:fg_cursor      .s:bg_highlight   .s:fmt_none

"}}}
"
" This is needed for some reason: {{{

let &background = s:style

" }}}

exe "hi! HopNextKey"         .s:fg_markup     .s:bg_none   .s:fmt_none
exe "hi! HopNextKey1"        .s:fg_function   .s:bg_none   .s:fmt_none
exe "hi! HopNextKey2"        .s:fg_regexp     .s:bg_none   .s:fmt_none
exe "hi! HopUnmatched"       .s:fg_guide      .s:bg_none   .s:fmt_none
 
exe "hi! FzfInvisible"           .s:fg_cursor      .s:bg_cursor   .s:fmt_none
