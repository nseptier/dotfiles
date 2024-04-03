hi clear
" if exists("syntax_on")
"   syntax reset
" endif
let colors_name = "lorem"

" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

let s:background = '#252a2e'
let s:background_dark = '#1e2026'
let s:background_light = '#2a2e33'
let s:none = 'NONE'

let s:neutral_0 = '#ffffff'
let s:neutral_1 = '#e8e1d9'
let s:neutral_2 = '#dccbb7'
let s:neutral_3 = '#ccbcab'
let s:neutral_4 = '#bfa68c'
let s:neutral_5 = '#b69c83'
let s:neutral_6 = '#ac937b'
let s:neutral_7 = '#6a6d6e'
let s:neutral_8 = '#515a62'
let s:neutral_9 = '#394856'
let s:neutral_10 = '#2e3942'
let s:neutral_11 = '#212427'

let s:primary_1 = '#aeccae'
let s:primary_2 = '#92ba92'
let s:primary_3 = '#85a78e'
let s:primary_4 = '#78938a'
let s:primary_5 = '#657980'

let s:accent_1 = '#d9ed92'
let s:accent_2 = '#b5e48c'
let s:accent_3 = '#99d98c'
let s:accent_4 = '#76c893'
let s:accent_5 = '#52b69a'
let s:accent_6 = '#34a0a4'
let s:accent_7 = '#168aad'

let s:secondary_1 = '#fbfd79'
let s:secondary_2 = '#fbd680'
let s:secondary_3 = '#fbaf87'
let s:secondary_4 = '#fb878e'

let s:error = '#ff6361'
let s:warning = '#ffea60'










let s:branch_1 = '#7c5f9f'
let s:branch_2 = '#5776b5'
let s:branch_3 = '#338dcb'
let s:branch_4 = '#65b184'
let s:branch_5 = '#95d03d'
let s:branch_6 = '#cad146'
let s:branch_7 = '#ffd250'
let s:branch_8 = '#ffa160'
let s:branch_9 = '#ff6b6d'

" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

exe 'hi SpecialKey guifg='.s:accent_3.' guibg='.s:none

exe 'hi TermCursor guifg='.s:neutral_8.' guibg='.s:none

exe 'hi NonText guifg='.s:background.' guibg='.s:none
hi! link EndOfBuffer NonText
hi! link Whitespace NonText

exe 'hi Directory guifg='.s:neutral_1.' guibg='.s:none
hi! link fugitiveHash Directory

exe 'hi ErrorMsg guifg='.s:error.' guibg='.s:none
hi! link NvimInvalidSpacing ErrorMsg

exe 'hi IncSearch guifg='.s:accent_7.' guibg='.s:neutral_0.' gui=reverse'

exe 'hi Search guifg='.s:none.' guibg='.s:none.' gui=reverse'
hi! link CurSearch IncSearch
hi! link QuickFixLine Search
hi! link Substitute Search

exe 'hi MoreMsg guifg='.s:neutral_3.' guibg='.s:none

exe 'hi ModeMsg guifg='.s:neutral_3.' guibg='.s:none

exe 'hi LineNr guifg='.s:neutral_7.' guibg='.s:none
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link diffFile LineNr
hi! link diffLine LineNr
hi! link diffSubname LineNr
hi! link fugitiveCount LineNr

exe 'hi CursorLineNr guifg='.s:neutral_0.' guibg='.s:background_dark
exe 'hi fugitiveUnstagedSection guifg='.s:neutral_3.' guibg='.s:none

exe 'hi Question guifg='.s:neutral_1.' guibg='.s:none

exe 'hi StatusLine guifg='.s:background_dark.' guibg='.s:neutral_0
hi! link MsgSeparator StatusLine

exe 'hi StatusLineNC guifg='.s:background_dark.' guibg='.s:neutral_2

exe 'hi VertSplit guifg='.s:background_dark.' guibg='.s:none
hi! link WinSeparator VertSplit
hi! link FloatBorder VertSplit

exe 'hi Title guifg='.s:neutral_2.' guibg='.s:none
hi! link FloatTitle Title

exe 'hi Visual guifg='.s:neutral_1.' guibg='.s:none.' gui=reverse'

exe 'hi WarningMsg guifg='.s:warning.' guibg='.s:none
hi! link vimWarn WarningMsg
hi! link vimBufnrWarn WarningMsg

exe 'hi WildMenu guifg='.'#fdffb6'.' guibg='.s:none

exe 'hi Folded guifg='.s:neutral_7.' guibg='.s:none
hi! link vimFold Folded

exe 'hi FoldColumn guifg='.'#9bf6ff'.' guibg='.s:none
hi! link CursorLineFold FoldColumn

exe 'hi DiffAdd guifg='.s:accent_3.' guibg='.s:none.' gui=reverse'
hi! link diffOnly DiffAdd

exe 'hi DiffChange guifg='.s:none.' guibg='.s:none

exe 'hi DiffDelete guifg='.s:secondary_4.' guibg='.s:secondary_4.' gui=reverse'

exe 'hi DiffText guifg='.s:secondary_2.' guibg='.s:none.' gui=reverse'

exe 'hi SignColumn guifg='.'#ffd6a5'.' guibg='.s:none
hi! link CursorLineSign SignColumn

exe 'hi Conceal guifg='.'#fdffb6'.' guibg='.s:none

exe 'hi SpellBad guifg='.'#caffbf'.' guibg='.s:none

exe 'hi SpellCap guifg='.s:neutral_0.' guibg='.s:none

exe 'hi SpellRare guifg='.s:primary_5.' guibg='.s:none

exe 'hi SpellLocal guifg='.'#bdb2ff'.' guibg='.s:none

exe 'hi Pmenu guifg='.s:neutral_1.' guibg='.s:background
hi! link PmenuKind Pmenu
hi! link PmenuExtra Pmenu
hi! link NormalFloat Pmenu

exe 'hi PmenuSel guifg='.s:neutral_1.' guibg='.s:none." gui=reverse"
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtraSel PmenuSel

exe 'hi PmenuSbar guifg='.'#ffd6a5'.' guibg='.s:none.' gui=reverse'

exe 'hi PmenuThumb guifg='.s:accent_3.' guibg='.s:none.' gui=reverse'

exe 'hi TabLine guifg='.'#caffbf'.' guibg='.s:none

exe 'hi TabLineSel guifg='.'#9bf6ff'.' guibg='.s:none

exe 'hi TabLineFill guifg='.'#a0c4ff'.' guibg='.s:none

exe 'hi CursorColumn guifg='.s:none.' guibg='.s:none

exe 'hi CursorLine guifg='.s:none.' guibg='.s:background_light

exe 'hi ColorColumn guifg='.'#ffadad'.' guibg='.s:none


" ==============================================================================
" ------------------------------------------------------------------------------

exe 'hi WinBar guifg='.'#ffd6a5'.' guibg='.s:none
hi! link WinBarNC WinBar

exe 'hi Cursor guifg='.'#fdffb6'.' guibg='.s:none
hi! link HopCursor Cursor

exe 'hi lCursor guifg='.'#caffbf'.' guibg='.s:none

exe 'hi Normal guifg='.s:neutral_1.' guibg='.s:none
hi! link NvimSpacing Normal
hi! link vimUserFunc Normal
hi! link vimEmbedError Normal
hi! link cssMediaComma Normal
hi! link dtdTag Normal
exe 'hi @variable guifg='.s:neutral_1.' guibg='.s:none

exe 'hi FloatShadow guifg='.'#a0c4ff'.' guibg='.s:error.' blend=90'

exe 'hi FloatShadowThrough guifg='.'#bdb2ff'.' guibg='.s:warning.' blend=90'

exe 'hi RedrawDebugNormal guifg='.'#ffc6ff'.' guibg='.s:none

exe 'hi RedrawDebugClear guifg='.'#ffadad'.' guibg='.s:none

exe 'hi RedrawDebugComposed guifg='.'#ffd6a5'.' guibg='.s:none

exe 'hi RedrawDebugRecompose guifg='.'#fdffb6'.' guibg='.s:none

exe 'hi Error guifg='.s:error.' guibg='.s:none
hi! link NvimInvalid Error
hi! link NvimInvalidAssignment Error
hi! link NvimInvalidPlainAssignment Error
hi! link NvimInvalidAugmentedAssignment Error
hi! link NvimInvalidAssignmentWithAddition Error
hi! link NvimInvalidAssignmentWithSubtraction Error
hi! link NvimInvalidAssignmentWithConcatenation Error
hi! link NvimInvalidOperator Error
hi! link NvimInvalidUnaryOperator Error
hi! link NvimInvalidUnaryPlus Error
hi! link NvimInvalidUnaryMinus Error
hi! link NvimInvalidNot Error
hi! link NvimInvalidBinaryOperator Error
hi! link NvimInvalidComparison Error
hi! link NvimInvalidComparisonModifier Error
hi! link NvimInvalidBinaryPlus Error
hi! link NvimInvalidBinaryMinus Error
hi! link NvimInvalidConcat Error
hi! link NvimInvalidConcatOrSubscript Error
hi! link NvimInvalidOr Error
hi! link NvimInvalidAnd Error
hi! link NvimInvalidMultiplication Error
hi! link NvimInvalidDivision Error
hi! link NvimInvalidMod Error
hi! link NvimInvalidTernary Error
hi! link NvimInvalidTernaryColon Error
hi! link NvimInvalidDelimiter Error
hi! link NvimInvalidParenthesis Error
hi! link NvimInvalidLambda Error
hi! link NvimInvalidNestingParenthesis Error
hi! link NvimInvalidCallingParenthesis Error
hi! link NvimInvalidSubscript Error
hi! link NvimInvalidSubscriptBracket Error
hi! link NvimInvalidSubscriptColon Error
hi! link NvimInvalidCurly Error
hi! link NvimInvalidContainer Error
hi! link NvimInvalidDict Error
hi! link NvimInvalidList Error
hi! link NvimInvalidValue Error
hi! link NvimInvalidIdentifier Error
hi! link NvimInvalidIdentifierScope Error
hi! link NvimInvalidIdentifierScopeDelimiter Error
hi! link NvimInvalidIdentifierName Error
hi! link NvimInvalidIdentifierKey Error
hi! link NvimInvalidColon Error
hi! link NvimInvalidComma Error
hi! link NvimInvalidArrow Error
hi! link NvimInvalidRegister Error
hi! link NvimInvalidNumber Error
hi! link NvimInvalidFloat Error
hi! link NvimInvalidNumberPrefix Error
hi! link NvimInvalidOptionSigil Error
hi! link NvimInvalidOptionName Error
hi! link NvimInvalidOptionScope Error
hi! link NvimInvalidOptionScopeDelimiter Error
hi! link NvimInvalidEnvironmentSigil Error
hi! link NvimInvalidEnvironmentName Error
hi! link NvimInvalidString Error
hi! link NvimInvalidStringQuote Error
hi! link NvimInvalidSingleQuote Error
hi! link NvimInvalidDoubleQuote Error
hi! link NvimInvalidDoubleQuotedUnknownEscape Error
hi! link NvimInvalidFigureBrace Error
hi! link NvimDoubleQuotedUnknownEscape Error
hi! link vimOperError Error
hi! link vimUserAttrbError Error
hi! link vimUserCmdError Error
hi! link vimElseIfErr Error
hi! link vimSynError Error
hi! link vimSyncError Error
hi! link luaParenError Error
hi! link luaError Error
hi! link vimError Error
hi! link vimKeyCodeError Error
hi! link vimErrSetting Error
hi! link vimBehaveError Error
hi! link vimFTError Error
hi! link vimFunctionError Error
hi! link vimAugroupError Error
hi! link vimFunc Error
hi! link vimPatSepErr Error
hi! link vimSubstFlagErr Error
hi! link vimCollClassErr Error
hi! link vimMapModErr Error
hi! link vimSynCaseError Error
hi! link vimHiCtermError Error
hi! link vimHiAttribList Error
hi! link vimHiKeyError Error
hi! link tsxCommentInvalid Error
hi! link cssError Error
hi! link cssBraceError Error
hi! link cssDeprecated Error
hi! link helpError Error
hi! link jsParensError Error
hi! link jsError Error
hi! link xmlError Error
hi! link xmlCommentError Error
hi! link dtdError Error

exe 'hi Todo guifg='.'#9bf6ff'.' guibg='.s:none
hi! link vimTodo Todo
hi! link luaTodo Todo
hi! link helpNote Todo
hi! link helpWarning Todo
hi! link helpDeprecated Todo
hi! link helpTodo Todo
hi! link jsCommentTodo Todo
hi! link xmlTodo Todo
hi! link dtdTodo Todo

exe 'hi String guifg='.s:secondary_2.' guibg='.s:none
hi! link String String
hi! link SpecialChar String
hi! link SpecialChar String
hi! link NvimString String
hi! link NvimStringBody String
hi! link NvimStringQuote String
hi! link NvimSingleQuote String
hi! link NvimSingleQuotedBody String
hi! link NvimDoubleQuote String
hi! link NvimDoubleQuotedBody String
hi! link NvimInvalidStringBody String
hi! link NvimInvalidSingleQuotedBody String
hi! link NvimInvalidDoubleQuotedBody String
hi! link vimString String
hi! link vimLetHereDoc String
hi! link vimSearch String
hi! link vimSetString String
hi! link vimCommentString String
hi! link vimPatSepZone String
hi! link vimNotPatSep String
hi! link vimStringEnd String
hi! link vimStringCont String
hi! link vimSubstTwoBS String
hi! link vimSynRegPat String
hi! link vimSynPatRange String
hi! link vimInsert String
hi! link vimSynNotPatRange String
hi! link luaString2 String
hi! link luaString String
hi! link luaStringDelimiter String
hi! link tsxString String
hi! link graphqlString String
hi! link graphqlTemplateString String
hi! link cssStringQ String
hi! link cssStringQQ String
hi! link cssAttributeSelector String
hi! link cssURL String
hi! link jsString String
hi! link styledXmlRegion String
hi! link helpHyperTextEntry String
hi! link helpString String
hi! link helpURL String
hi! link jsTemplateString String
hi! link jsRegexpString String
hi! link jsRegexpGroup String
hi! link jsObjectKeyString String
hi! link jsObjectStringKey String
hi! link jsClassStringKey String
hi! link jsxString String
hi! link xmlString String
hi! link xmlCdata String

exe 'hi Constant guifg='.s:secondary_1.' guibg='.s:none
hi! link Character Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant
hi! link Constant Constant
hi! link Special Constant
hi! link Define Constant
hi! link Character Constant
hi! link SpecialChar Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant
hi! link NvimNumber Constant
hi! link NvimFloat Constant
hi! link vimNumber Constant
hi! link vimMark Constant
hi! link vimMarkNumber Constant
hi! link vimPlainMark Constant
hi! link vimAddress Constant
hi! link vimHiGuiRgb Constant
hi! link vimHiNmbr Constant
hi! link luaConstant Constant
hi! link luaNumber Constant
hi! link graphqlBoolean Constant
hi! link graphqlNumber Constant
hi! link cssUnitDecorators Constant
hi! link cssValueInteger Constant
hi! link cssValueNumber Constant
hi! link cssValueLength Constant
hi! link cssValueAngle Constant
hi! link cssValueTime Constant
hi! link cssValueFrequency Constant
hi! link cssColor Constant
hi! link cssFunction Constant
hi! link cssKeyFrameProp Constant
hi! link cssAttr Constant
hi! link cssContentForPagedMediaAttr Constant
hi! link cssDimensionAttr Constant
hi! link cssGridAttr Constant
hi! link cssHyerlinkAttr Constant
hi! link cssLineboxAttr Constant
hi! link cssMarginAttr Constant
hi! link cssMarqueeAttr Constant
hi! link cssPaddingAttr Constant
hi! link cssPagedMediaAttr Constant
hi! link cssRubyAttr Constant
hi! link cssSpeechAttr Constant
hi! link cssTransformAttr Constant
hi! link cssRenderAttr Constant
hi! link cssGradientAttr Constant
hi! link cssCommonAttr Constant
hi! link cssAnimationAttr Constant
hi! link cssBackgroundAttr Constant
hi! link cssBorderAttr Constant
hi! link cssBoxAttr Constant
hi! link cssCascadeAttr Constant
hi! link cssFlexibleBoxAttr Constant
hi! link cssFontAttr Constant
hi! link cssMultiColumnAttr Constant
hi! link cssInteractAttr Constant
hi! link cssGeneratedContentAttr Constant
hi! link cssListAttr Constant
hi! link cssObjectAttr Constant
hi! link cssPositioningAttr Constant
hi! link cssPrintAttr Constant
hi! link cssTableAttr Constant
hi! link cssTextAttr Constant
hi! link cssTransitionAttr Constant
hi! link cssUIAttr Constant
hi! link cssIEUIAttr Constant
hi! link cssAuralAttr Constant
hi! link cssMediaAttr Constant
hi! link cssFontDescriptorAttr Constant
hi! link cssPseudoClassLang Constant
hi! link cssUnicodeRange Constant
hi! link cssCustomKeyFrameSelector Constant
hi! link helpConstant Constant
hi! link helpCharacter Constant
hi! link helpNumber Constant
hi! link helpBoolean Constant
hi! link helpFloat Constant
hi! link jsBooleanTrue Constant
hi! link jsBooleanFalse Constant
hi! link jsNumber Constant
hi! link jsFloat Constant
hi! link jsRegexpCharClass Constant
hi! link jsNan Constant
hi! link jsSuper Constant
hi! link jsGlobalObjects Constant
hi! link jsGlobalNodeObjects Constant
hi! link jsExceptions Constant
hi! link jsBuiltins Constant
hi! link jsDomErrNo Constant
hi! link jsDomNodeConsts Constant
hi! link jsCharacter Constant
hi! link dtdConstant Constant
hi! link dtdString Constant
hi! link dtdEnum Constant
hi! link dtdParamEntityInst Constant

exe 'hi Function guifg='.s:neutral_2.' guibg='.s:none
hi! link Function Function
hi! link Special Function
hi! link Macro Function
hi! link vimFuncName Function
hi! link luaMetaMethod Function
hi! link luaFunction Function
exe 'hi tsxTagName guifg='.s:accent_2.' guibg='.s:none
hi! link tsxNameSpace Function
hi! link cssClassNameDot Function
hi! link cssClassName Function
hi! link cssIdentifier Function
hi! link cssFunctionName Function
hi! link cssFunctionComma Function
hi! link cssBraces Function
hi! link jsFuncCall Function
hi! link helpFunction Function
hi! link jsObjectFuncName Function
hi! link jsFuncName Function
hi! link jsClassDefinition Function
hi! link jsClassFuncName Function
hi! link jsDecoratorFunction Function
hi! link jsxTag Function
hi! link jsxComponentName Function
hi! link xmlTagName Function
hi! link xmlTag Function
hi! link xmlInlineDTD Function
hi! link xmlDocTypeDecl Function
hi! link dtdFunction Function
hi! link dtdCard Function

exe 'hi Identifier guifg='.s:neutral_1.' guibg='.s:none
hi! link NvimIdentifier Identifier
hi! link NvimIdentifierScope Identifier
hi! link NvimIdentifierScopeDelimiter Identifier
hi! link NvimIdentifierName Identifier
hi! link NvimIdentifierKey Identifier
hi! link NvimOptionName Identifier
hi! link NvimOptionScope Identifier
hi! link NvimOptionScopeDelimiter Identifier
hi! link NvimEnvironmentName Identifier
hi! link vimVar Identifier
hi! link vimFBVar Identifier
hi! link vimSpecFile Identifier
hi! link vimFuncVar Identifier
hi! link vimSpecFileMod Identifier
hi! link luaFunc Identifier
hi! link vimKeyCode Identifier
hi! link tsxCloseString Identifier
hi! link graphqlName Identifier
hi! link graphqlVariable Identifier
hi! link helpHyperTextJump Identifier
hi! link helpVim Identifier
hi! link helpIdentifier Identifier
hi! link jsBlockLabel Identifier
hi! link jsBlockLabelKey Identifier
hi! link jsxTagName Identifier
hi! link xmlEndTag Identifier

exe 'hi Statement guifg='.s:neutral_3.' guibg='.s:none
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Keyword Statement
hi! link Exception Statement
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Keyword Statement
hi! link Exception Statement
hi! link diffOldFile Statement
hi! link diffNewFile Statement
exe 'hi fugitiveStagedSection guifg='.s:secondary_2.' guibg='.s:none
hi! link vimCommand Statement
hi! link vimSubst Statement
hi! link vimAutoCmd Statement
hi! link vimLet Statement
hi! link vimMap Statement
hi! link vimSyntax Statement
hi! link vimBehave Statement
hi! link vimBehaveModel Statement
hi! link vimFTCmd Statement
hi! link vimNotFunc Statement
hi! link vimAugroupKey Statement
hi! link vimFuncKey Statement
hi! link vimAbb Statement
hi! link vimEchoHL Statement
hi! link vimHighlight Statement
hi! link vimNorm Statement
hi! link vimUnmap Statement
hi! link vimUserCommand Statement
hi! link vimSubst1 Statement
hi! link vimSetSep Statement
hi! link vimMapBang Statement
hi! link nvimMap Statement
hi! link nvimUnmap Statement
hi! link vimFuncEcho Statement
hi! link vimHiClear Statement
hi! link vimSearchDelim Statement
hi! link luaCondElse Statement
hi! link luaCond Statement
hi! link luaStatement Statement
hi! link luaRepeat Statement
hi! link luaFor Statement
hi! link luaLabel Statement
hi! link vimAuHighlight Statement
hi! link vimAutoSet Statement
hi! link vimCondHL Statement
hi! link vimElseif Statement
hi! link vimKeyword Statement
hi! link vimStatement Statement
exe 'hi @keyword.tsx guifg='.s:primary_4.' guibg='.s:none
exe 'hi @keyword.import.tsx guifg='.s:primary_5.' guibg='.s:none
exe 'hi @keyword.return.tsx guifg='.s:accent_3.' guibg='.s:none
exe 'hi @keyword.conditional.tsx guifg='.s:primary_2.' guibg='.s:none
exe 'hi @keyword.coroutine.tsx guifg='.s:accent_3.' guibg='.s:none
hi! link graphqlNull Statement
hi! link graphqlKeyword Statement
hi! link cssTagName Statement
hi! link cssAtRuleLogical Statement
hi! link helpHeadline Statement
hi! link helpStatement Statement
hi! link helpConditional Statement
hi! link helpRepeat Statement
hi! link helpLabel Statement
hi! link helpKeyword Statement
hi! link helpException Statement
hi! link jsRegexpOr Statement
hi! link jsReturn Statement
hi! link jsStatement Statement
hi! link jsConditional Statement
hi! link jsForAwait Statement
hi! link jsDo Statement
hi! link jsLabel Statement
hi! link jsTry Statement
hi! link jsFinally Statement
hi! link jsCatch Statement
hi! link jsException Statement
hi! link jsAsyncKeyword Statement
hi! link jsClassKeyword Statement
hi! link jsExtendsKeyword Statement
hi! link jsBranch Statement
hi! link jsRepeat Statement
hi! link jsWhile Statement
hi! link jsFor Statement
hi! link jsDomElemAttrs Statement
hi! link jsHtmlElemAttrs Statement
hi! link jsCssStyles Statement
hi! link xmlEntity Statement
hi! link xmlCdataCdata Statement
hi! link xmlDocTypeKeyword Statement
hi! link dtdTagName Statement
hi! link dtdEntity Statement

exe 'hi Operator guifg='.s:neutral_5.' guibg='.s:none
hi! link Operator Operator
hi! link NvimAssignment Operator
hi! link NvimPlainAssignment Operator
hi! link NvimAugmentedAssignment Operator
hi! link NvimAssignmentWithAddition Operator
hi! link NvimAssignmentWithSubtraction Operator
hi! link NvimAssignmentWithConcatenation Operator
hi! link NvimOperator Operator
hi! link NvimUnaryOperator Operator
hi! link NvimUnaryPlus Operator
hi! link NvimUnaryMinus Operator
hi! link NvimNot Operator
hi! link NvimBinaryOperator Operator
hi! link NvimComparison Operator
hi! link NvimComparisonModifier Operator
hi! link NvimBinaryPlus Operator
hi! link NvimBinaryMinus Operator
hi! link NvimConcat Operator
hi! link NvimConcatOrSubscript Operator
hi! link NvimOr Operator
hi! link NvimAnd Operator
hi! link NvimMultiplication Operator
hi! link NvimDivision Operator
hi! link NvimMod Operator
hi! link NvimTernary Operator
hi! link NvimTernaryColon Operator
hi! link vimOper Operator
hi! link vimoperStar Operator
hi! link luaOperator Operator
hi! link luaSymbolOperator Operator
hi! link graphqlOperator Operator
hi! link helpOperator Operator
hi! link jsOf Operator
hi! link jsOperator Operator
hi! link jsOperatorKeyword Operator
hi! link jsSpreadOperator Operator
hi! link jsRestOperator Operator
hi! link jsTernaryIfOperator Operator
hi! link jsxSpreadOperator Operator
hi! link jsxDot Operator
hi! link jsxNamespace Operator
hi! link jsxEqual Operator

exe 'hi PreProc guifg='.s:neutral_2.' guibg='.s:none
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link Include PreProc
hi! link PreProc PreProc
hi! link vimOption PreProc
hi! link vimEnvvar PreProc
hi! link vimUserAttrbKey PreProc
hi! link vimSetMod PreProc
hi! link vimMenuName PreProc
hi! link vimMenuNameMore PreProc
hi! link vimHiAttrib PreProc
hi! link vimFgBgAttrib PreProc
hi! link vimCommentTitle PreProc
hi! link vimAutoCmdOpt PreProc
hi! link vimHLMod PreProc
hi! link graphqlDirective PreProc
hi! link cssAtRule PreProc
hi! link cssPseudoClassId PreProc
hi! link cssAtKeyword PreProc
hi! link cssPageMarginProp PreProc
hi! link cssPagePseudo PreProc
hi! link helpSectionDelim PreProc
hi! link helpHeader PreProc
hi! link helpPreProc PreProc
hi! link helpInclude PreProc
hi! link helpDefine PreProc
hi! link helpMacro PreProc
hi! link helpPreCondit PreProc
hi! link jsImport PreProc
hi! link jsExport PreProc
hi! link jsModuleAs PreProc
hi! link jsFrom PreProc
hi! link jsEnvComment PreProc
hi! link jsDomElemFuncs PreProc
hi! link jsHtmlElemFuncs PreProc

exe 'hi Type guifg='.s:accent_4.' guibg='.s:none
hi! link StorageClass Type
hi! link Typedef Type
hi! link Type Type
hi! link Typedef Type
hi! link StorageClass Type
hi! link NvimNumberPrefix Type
hi! link NvimOptionSigil Type
hi! link NvimEnvironmentSigil Type
hi! link vimGroup Type
hi! link vimHLGroup Type
hi! link nvimHLGroup Type
hi! link vimType Type
hi! link vimPattern Type
hi! link vimAutoEvent Type
hi! link nvimAutoEvent Type
hi! link vimEchoHLNone Type
hi! link vimSynCase Type
hi! link vimGroupName Type
hi! link vimSynReg Type
hi! link vimSyncC Type
hi! link vimSyncGroupName Type
hi! link vimSyncKey Type
hi! link vimSyncGroup Type
hi! link vimSyncNone Type
hi! link vimHiGroup Type
hi! link vimHiTerm Type
hi! link vimHiCTerm Type
hi! link vimHiStartStop Type
hi! link vimHiCtermFgBg Type
hi! link vimHiCtermul Type
hi! link vimHiGui Type
hi! link vimHiGuiFont Type
hi! link vimHiGuiFgBg Type
hi! link vimHiBlend Type
hi! link vimSpecial Type
hi! link vimUserAttrb Type
hi! link vimUserAttrbCmplt Type
hi! link vimSynType Type
hi! link vimFTOption Type
exe 'hi tsxAttrib guifg='.s:neutral_4.' guibg='.s:none
exe 'hi @type.builtin.tsx guifg='.s:accent_1.' guibg='.s:none
hi! link graphqlType Type
hi! link cssCustomPositioningPrefix Type
hi! link cssProp Type
hi! link cssContentForPagedMediaProp Type
hi! link cssLineboxProp Type
hi! link cssMarqueeProp Type
hi! link cssPagedMediaProp Type
hi! link cssPrintProp Type
hi! link cssRubyProp Type
hi! link cssSpeechProp Type
hi! link cssRenderProp Type
hi! link cssPositioningProp Type
hi! link cssAnimationProp Type
hi! link cssBackgroundProp Type
hi! link cssBorderProp Type
hi! link cssBoxProp Type
hi! link cssCascadeProp Type
hi! link cssColorProp Type
hi! link cssDimensionProp Type
hi! link cssFlexibleBoxProp Type
hi! link cssFontProp Type
hi! link cssMultiColumnProp Type
hi! link cssInteractProp Type
hi! link cssGeneratedContentProp Type
hi! link cssGridProp Type
hi! link cssHyerlinkProp Type
hi! link cssListProp Type
hi! link cssObjectProp Type
hi! link cssTableProp Type
hi! link cssTextProp Type
hi! link cssTransformProp Type
hi! link cssTransitionProp Type
hi! link cssUIProp Type
hi! link cssIEUIProp Type
hi! link cssAuralProp Type
hi! link cssMobileTextProp Type
hi! link cssMediaProp Type
hi! link cssPageProp Type
hi! link cssFontDescriptorProp Type
hi! link styledXmlRegionKeyword Type
hi! link xmlAttrib Type
hi! link jsTaggedTemplate Type
hi! link graphqlTaggedTemplate Type
hi! link helpOption Type
hi! link helpType Type
hi! link helpStorageClass Type
hi! link helpTypedef Type
hi! link jsStorageClass Type
hi! link jsExportDefault Type
hi! link jsExportDefaultGroup Type
hi! link jsObjectMethodType Type
hi! link jsNull Type
hi! link jsUndefined Type
hi! link jsClassMethodType Type
hi! link jsArrowFunction Type
hi! link jsFunction Type
hi! link jsGenerator Type
hi! link jsxAttrib Type
hi! link jsxAttribKeyword Type
hi! link xmlProcessing Type
hi! link xmlEntityPunct Type
hi! link xmlCdataStart Type
hi! link xmlCdataEnd Type
hi! link dtdType Type
hi! link dtdAttrType Type
hi! link dtdAttrDef Type
hi! link dtdParamEntityDecl Type
hi! link dtdParamEntityPunct Type
hi! link dtdEntityPunct Type

exe 'hi Structure guifg='.s:primary_5.' guibg='.s:none
hi! link luaTable Structure
hi! link graphqlStructure Structure
hi! link helpStructure Structure
exe 'hi fugitiveUnstagedModifier guifg='.s:neutral_7.' guibg='.s:none

exe 'hi Special guifg='.s:neutral_5.' guibg='.s:none
exe 'hi @punctuation.bracket.tsx guifg='.s:neutral_5.' guibg='.s:none
exe 'hi @punctuation.delimiter.tsx guifg='.s:neutral_6.' guibg='.s:none
exe 'hi @punctuation.special.javascript guifg='.s:secondary_4.' guibg='.s:none
exe 'hi @tag.builtin.tsx guifg='.s:primary_3.' guibg='.s:none
exe 'hi @tag.tsx guifg='.s:accent_2.' guibg='.s:none
exe 'hi @tag.attribute.tsx guifg='.s:neutral_4.' guibg='.s:none
hi! link Tag Special
hi! link SpecialChar Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special
hi! link Debug Special
hi! link Tag Special
hi! link NvimParenthesis Special
hi! link NvimLambda Special
hi! link NvimNestingParenthesis Special
hi! link NvimCallingParenthesis Special
hi! link NvimSubscript Special
hi! link NvimSubscriptBracket Special
hi! link NvimSubscriptColon Special
hi! link NvimCurly Special
hi! link NvimContainer Special
hi! link NvimDict Special
hi! link NvimList Special
hi! link NvimColon Special
hi! link NvimComma Special
hi! link NvimArrow Special
hi! link NvimRegister Special
hi! link NvimStringSpecial Special
hi! link NvimSingleQuotedQuote Special
hi! link NvimDoubleQuotedEscape Special
hi! link NvimInvalidStringSpecial Special
hi! link NvimInvalidSingleQuotedQuote Special
hi! link NvimInvalidDoubleQuotedEscape Special
hi! link vimRegister Special
hi! link vimCmplxRepeat Special
hi! link vimNotation Special
hi! link vimCtrlChar Special
hi! link vimContinue Special
hi! link vimParenSep Special
hi! link vimSep Special
hi! link vimFuncSID Special
hi! link vimUserAttrbCmpltFunc Special
hi! link vimPatSep Special
hi! link vimPatSepZ Special
hi! link vimPatSepR Special
hi! link vimEscape Special
hi! link vimSubstSubstr Special
hi! link vimSubstDelim Special
hi! link vimSubstFlags Special
hi! link vimPlainRegister Special
hi! link vimLetHereDocStart Special
hi! link vimLetHereDocStop Special
hi! link vimAutoCmdMod Special
hi! link vimMapModKey Special
hi! link vimBracket Special
hi! link vimMapMod Special
hi! link vimMenuMod Special
hi! link vimGroupSpecial Special
hi! link vimIskSep Special
hi! link luaSpecial Special
hi! link vimSynOption Special
hi! link vimSynContains Special
hi! link vimSynKeyContainedin Special
hi! link vimSynNextgroup Special
hi! link vimGroupAdd Special
hi! link vimGroupRem Special
hi! link vimSynKeyOpt Special
hi! link vimSynMtchOpt Special
hi! link vimSynRegOpt Special
hi! link vimSynMtchGrp Special
hi! link graphqlDirectiveLocation Special
hi! link graphqlMetaFields Special
hi! link graphqlBraces Special
hi! link cssSelectorOp Special
hi! link cssSelectorOp2 Special
hi! link cssUnicodeEscape Special
hi! link cssImportant Special
hi! link cssCustomProp Special
hi! link cssAttrComma Special
hi! link cssMediaType Special
hi! link cssFontDescriptor Special
hi! link styledAmpersand Special
hi! link helpSpecial Special
hi! link helpSpecialChar Special
hi! link helpTag Special
hi! link helpDelimiter Special
hi! link helpSpecialComment Special
hi! link helpDebug Special
hi! link jsPrototype Special
hi! link jsSpecial Special
hi! link jsRegexpBoundary Special
hi! link jsRegexpBackRef Special
hi! link jsRegexpQuantifier Special
hi! link jsRegexpMod Special
hi! link jsThis Special
hi! link jsHtmlEvents Special
hi! link jsDecorator Special
hi! link jsArguments Special
hi! link jsxBraces Special
hi! link xmlNamespace Special
exe 'hi fugitiveHelpTag guifg='.s:neutral_8.' guibg='.s:none

exe 'hi DiagnosticError guifg='.s:error.' guibg='.s:none
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticFloatingError DiagnosticError
hi! link DiagnosticSignError DiagnosticError

exe 'hi DiagnosticWarn guifg='.s:warning.' guibg='.s:none
hi! link DiagnosticVirtualTextWarn DiagnosticWarn
hi! link DiagnosticFloatingWarn DiagnosticWarn
hi! link DiagnosticSignWarn DiagnosticWarn

exe 'hi DiagnosticInfo guifg='.s:neutral_3.' guibg='.s:none
hi! link DiagnosticVirtualTextInfo DiagnosticInfo
hi! link DiagnosticFloatingInfo DiagnosticInfo
hi! link DiagnosticSignInfo DiagnosticInfo

exe 'hi DiagnosticHint guifg='.s:warning.' guibg='.s:none
hi! link DiagnosticVirtualTextHint DiagnosticHint
hi! link DiagnosticFloatingHint DiagnosticHint
hi! link DiagnosticSignHint DiagnosticHint

exe 'hi DiagnosticOk guifg='.'#a0c4ff'.' guibg='.s:none
hi! link DiagnosticVirtualTextOk DiagnosticOk
hi! link DiagnosticFloatingOk DiagnosticOk
hi! link DiagnosticSignOk DiagnosticOk

exe 'hi DiagnosticUnderlineError guifg='.s:error.' guibg='.s:none.' gui=reverse'

exe 'hi DiagnosticUnderlineWarn guifg='.s:warning.' guibg='.s:none.' gui=reverse'

exe 'hi DiagnosticUnderlineInfo guifg='.s:neutral_7.' guibg='.s:none

exe 'hi DiagnosticUnderlineHint guifg='.s:none.' guibg='.s:none.' gui=none'

exe 'hi DiagnosticUnderlineOk guifg='.'#fdffb6'.' guibg='.s:none

exe 'hi DiagnosticDeprecated guifg='.'#caffbf'.' guibg='.s:none

exe 'hi Comment guifg='.s:neutral_7.' guibg='.s:none
hi! link DiagnosticUnnecessary Comment
hi! link Comment Comment
hi! link gitDiff Comment
exe 'hi fugitiveUnstagedHeading guifg='.s:neutral_7.' guibg='.s:none
exe 'hi fugitiveSymbolicRef guifg='.s:neutral_1.' guibg='.s:none
exe 'hi fugitiveHeader guifg='.s:neutral_8.' guibg='.s:none
exe 'hi fugitiveStagedHeading guifg='.s:neutral_5.' guibg='.s:none
hi! link vimComment Comment
hi! link vim9Comment Comment
hi! link vimLineComment Comment
hi! link vimMtchComment Comment
hi! link vim9LineComment Comment
hi! link luaComment Comment
hi! link luaCommentDelimiter Comment
hi! link vimScriptDelim Comment
hi! link tsxBlockComment Comment
hi! link tsxLineComment Comment
hi! link shellbang Comment
hi! link graphqlComment Comment
hi! link cssComment Comment
hi! link cssVendor Comment
hi! link cssHacks Comment
hi! link jsComment Comment
hi! link helpExample Comment
hi! link helpCommand Comment
hi! link helpComment Comment
hi! link jsCommentIfElse Comment
hi! link jsCommentRepeat Comment
hi! link jsCommentFunction Comment
hi! link jsCommentClass Comment
hi! link jsxCloseString Comment
hi! link jsxComment Comment
hi! link jsxCloseTag Comment
hi! link jsxPunct Comment
hi! link jsxOpenPunct Comment
hi! link jsxClosePunct Comment
hi! link xmlAttribPunct Comment
hi! link xmlComment Comment
hi! link xmlCommentStart Comment
hi! link xmlCommentPart Comment
hi! link xmlProcessingDelim Comment
hi! link dtdComment Comment
hi! link dtdParamEntityDPunct Comment

exe 'hi Underlined guifg='.'#a0c4ff'.' guibg='.s:none
hi! link helpUnderlined Underlined

exe 'hi MatchParen guifg='.s:none.' guibg='.s:none.' gui=reverse'

exe 'hi NvimInternalError guifg='.s:error.' guibg='.s:none
hi! link NvimFigureBrace NvimInternalError
hi! link NvimSingleQuotedUnknownEscape NvimInternalError
hi! link NvimInvalidSingleQuotedUnknownEscape NvimInternalError

exe 'hi HopNextKey guifg='.s:accent_3.' guibg='.s:none

exe 'hi HopNextKey1 guifg='.s:accent_5.' guibg='.s:none

exe 'hi HopNextKey2 guifg='.s:accent_6.' guibg='.s:none

exe 'hi HopUnmatched guifg='.s:neutral_8.' guibg='.s:none

exe 'hi LongLineWarning guifg='.s:warning.' guibg='.s:none

exe 'hi qfLineNr guifg='.'#ffffff'.' guibg='.s:none

exe 'hi CursorLineConceal guifg='.'#ffffff'.' guibg='.s:none

exe 'hi GitGutterAdd guifg='.'#ffffff'.' guibg='.s:none

exe 'hi GitGutterChange guifg='.'#ffffff'.' guibg='.s:none

exe 'hi GitGutterDelete guifg='.'#ffffff'.' guibg='.s:none

exe 'hi GitGutterChangeDelete guifg='.'#ffffff'.' guibg='.s:none

exe 'hi diffAdded guifg='.s:accent_3.' guibg='.s:none

exe 'hi diffRemoved guifg='.s:secondary_4.' guibg='.s:none

exe 'hi BufferNrArrow guifg='.s:background.' guibg='.s:none

exe 'hi ActiveBufferNrArrow guifg='.s:background.' guibg='.s:neutral_0

exe 'hi ActiveFilename guifg='.s:neutral_11.' guibg='.s:neutral_0

exe 'hi ActiveFilenameArrow guifg='.s:neutral_0.' guibg='.s:none

exe 'hi Filename guifg='.s:neutral_0.' guibg='.s:neutral_9

exe 'hi FilenameArrow guifg='.s:neutral_9.' guibg='.s:none

exe 'hi FzfInvisible guifg='.'#ffffff'.' guibg='.s:none

exe 'hi IblScope guifg='.'#fff000'.' guibg='.s:none

exe 'hi IblWhitespace guifg='.s:neutral_10.' guibg='.s:none

exe 'hi IblIndent guifg='.s:neutral_10.' guibg='.s:none

exe 'hi htmlTag guifg='.s:primary_5.' guibg='.s:none
hi! link @tag.delimiter.tsx htmlTag

exe 'hi htmlTagName guifg='.s:primary_3.' guibg='.s:none

exe 'hi floatBorder guifg='.s:neutral_8.' guibg='.s:none

exe 'hi fugitiveHunk guifg='.s:neutral_7.' guibg='.s:none

exe 'hi BlameLineNvim guifg='.s:neutral_8.' guibg='.s:none

" ------------------------------------------------------------------------------
" flog
" ------------------------------------------------------------------------------

exe 'hi flogBranch1 guifg='.s:branch_1.' guibg='.s:none
hi! link flogBranch1AfterCommit flogBranch1
hi! link flogBranch1AfterMerge flogBranch1
hi! link flogBranch1ComplexMerge flogBranch1
hi! link flogBranch1ComplexMergeStart flogBranch1
hi! link flogBranch1MergeStart flogBranch1
hi! link flogMerge1Horizontal flogBranch1

exe 'hi flogBranch2 guifg='.s:branch_2.' guibg='.s:none
hi! link flogBranch2AfterCommit flogBranch2
hi! link flogBranch2AfterMerge flogBranch2
hi! link flogBranch2ComplexMerge flogBranch2
hi! link flogBranch2ComplexMergeStart flogBranch2
hi! link flogBranch2MergeStart flogBranch2
hi! link flogMerge2Horizontal flogBranch2
hi! link flogMerge1Branch2 flogBranch2
hi! link flogMerge1Branch2End flogBranch2
hi! link flogMerge2Branch2 flogBranch2
hi! link flogMerge2Branch2End flogBranch2
hi! link flogMerge3Branch2 flogBranch2
hi! link flogMerge3Branch2End flogBranch2
hi! link flogMerge4Branch2 flogBranch2
hi! link flogMerge4Branch2End flogBranch2
hi! link flogMerge5Branch2 flogBranch2
hi! link flogMerge5Branch2End flogBranch2
hi! link flogMerge6Branch2 flogBranch2
hi! link flogMerge6Branch2End flogBranch2
hi! link flogMerge7Branch2 flogBranch2
hi! link flogMerge7Branch2End flogBranch2
hi! link flogMerge8Branch2 flogBranch2
hi! link flogMerge8Branch2End flogBranch2
hi! link flogMerge9Branch2 flogBranch2
hi! link flogMerge9Branch2End flogBranch2

exe 'hi flogBranch3 guifg='.s:branch_3.' guibg='.s:none
hi! link flogBranch3AfterCommit flogBranch3
hi! link flogBranch3AfterMerge flogBranch3
hi! link flogBranch3ComplexMerge flogBranch3
hi! link flogBranch3ComplexMergeStart flogBranch3
hi! link flogBranch3MergeStart flogBranch3
hi! link flogMerge3Horizontal flogBranch3
hi! link flogMerge1Branch3 flogBranch3
hi! link flogMerge1Branch3End flogBranch3
hi! link flogMerge2Branch3 flogBranch3
hi! link flogMerge2Branch3End flogBranch3
hi! link flogMerge3Branch3 flogBranch3
hi! link flogMerge3Branch3End flogBranch3
hi! link flogMerge4Branch3 flogBranch3
hi! link flogMerge4Branch3End flogBranch3
hi! link flogMerge5Branch3 flogBranch3
hi! link flogMerge5Branch3End flogBranch3
hi! link flogMerge6Branch3 flogBranch3
hi! link flogMerge6Branch3End flogBranch3
hi! link flogMerge7Branch3 flogBranch3
hi! link flogMerge7Branch3End flogBranch3
hi! link flogMerge8Branch3 flogBranch3
hi! link flogMerge8Branch3End flogBranch3
hi! link flogMerge9Branch3 flogBranch3
hi! link flogMerge9Branch3End flogBranch3

exe 'hi flogBranch4 guifg='.s:branch_4.' guibg='.s:none
hi! link flogBranch4AfterCommit flogBranch4
hi! link flogBranch4AfterMerge flogBranch4
hi! link flogBranch4ComplexMerge flogBranch4
hi! link flogBranch4ComplexMergeStart flogBranch4
hi! link flogBranch4MergeStart flogBranch4
hi! link flogMerge4Horizontal flogBranch4
hi! link flogMerge1Branch4 flogBranch4
hi! link flogMerge1Branch4End flogBranch4
hi! link flogMerge2Branch4 flogBranch4
hi! link flogMerge2Branch4End flogBranch4
hi! link flogMerge3Branch4 flogBranch4
hi! link flogMerge3Branch4End flogBranch4
hi! link flogMerge4Branch4 flogBranch4
hi! link flogMerge4Branch4End flogBranch4
hi! link flogMerge5Branch4 flogBranch4
hi! link flogMerge5Branch4End flogBranch4
hi! link flogMerge6Branch4 flogBranch4
hi! link flogMerge6Branch4End flogBranch4
hi! link flogMerge7Branch4 flogBranch4
hi! link flogMerge7Branch4End flogBranch4
hi! link flogMerge8Branch4 flogBranch4
hi! link flogMerge8Branch4End flogBranch4
hi! link flogMerge9Branch4 flogBranch4
hi! link flogMerge9Branch4End flogBranch4

exe 'hi flogBranch5 guifg='.s:branch_5.' guibg='.s:none
hi! link flogBranch5AfterCommit flogBranch5
hi! link flogBranch5AfterMerge flogBranch5
hi! link flogBranch5ComplexMerge flogBranch5
hi! link flogBranch5ComplexMergeStart flogBranch5
hi! link flogBranch5MergeStart flogBranch5
hi! link flogMerge5Horizontal flogBranch5
hi! link flogMerge1Branch5 flogBranch5
hi! link flogMerge1Branch5End flogBranch5
hi! link flogMerge2Branch5 flogBranch5
hi! link flogMerge2Branch5End flogBranch5
hi! link flogMerge3Branch5 flogBranch5
hi! link flogMerge3Branch5End flogBranch5
hi! link flogMerge4Branch5 flogBranch5
hi! link flogMerge4Branch5End flogBranch5
hi! link flogMerge5Branch5 flogBranch5
hi! link flogMerge5Branch5End flogBranch5
hi! link flogMerge6Branch5 flogBranch5
hi! link flogMerge6Branch5End flogBranch5
hi! link flogMerge7Branch5 flogBranch5
hi! link flogMerge7Branch5End flogBranch5
hi! link flogMerge8Branch5 flogBranch5
hi! link flogMerge8Branch5End flogBranch5
hi! link flogMerge9Branch5 flogBranch5
hi! link flogMerge9Branch5End flogBranch5

exe 'hi flogBranch6 guifg='.s:branch_6.' guibg='.s:none
hi! link flogBranch6AfterCommit flogBranch6
hi! link flogBranch6AfterMerge flogBranch6
hi! link flogBranch6ComplexMerge flogBranch6
hi! link flogBranch6ComplexMergeStart flogBranch6
hi! link flogBranch6MergeStart flogBranch6
hi! link flogMerge6Horizontal flogBranch6
hi! link flogMerge1Branch6 flogBranch6
hi! link flogMerge1Branch6End flogBranch6
hi! link flogMerge2Branch6 flogBranch6
hi! link flogMerge2Branch6End flogBranch6
hi! link flogMerge3Branch6 flogBranch6
hi! link flogMerge3Branch6End flogBranch6
hi! link flogMerge4Branch6 flogBranch6
hi! link flogMerge4Branch6End flogBranch6
hi! link flogMerge5Branch6 flogBranch6
hi! link flogMerge5Branch6End flogBranch6
hi! link flogMerge6Branch6 flogBranch6
hi! link flogMerge6Branch6End flogBranch6
hi! link flogMerge7Branch6 flogBranch6
hi! link flogMerge7Branch6End flogBranch6
hi! link flogMerge8Branch6 flogBranch6
hi! link flogMerge8Branch6End flogBranch6
hi! link flogMerge9Branch6 flogBranch6
hi! link flogMerge9Branch6End flogBranch6

exe 'hi flogBranch7 guifg='.s:branch_7.' guibg='.s:none
hi! link flogBranch7AfterCommit flogBranch7
hi! link flogBranch7AfterMerge flogBranch7
hi! link flogBranch7ComplexMerge flogBranch7
hi! link flogBranch7ComplexMergeStart flogBranch7
hi! link flogBranch7MergeStart flogBranch7
hi! link flogMerge7Horizontal flogBranch7
hi! link flogMerge1Branch7 flogBranch7
hi! link flogMerge1Branch7End flogBranch7
hi! link flogMerge2Branch7 flogBranch7
hi! link flogMerge2Branch7End flogBranch7
hi! link flogMerge3Branch7 flogBranch7
hi! link flogMerge3Branch7End flogBranch7
hi! link flogMerge4Branch7 flogBranch7
hi! link flogMerge4Branch7End flogBranch7
hi! link flogMerge5Branch7 flogBranch7
hi! link flogMerge5Branch7End flogBranch7
hi! link flogMerge6Branch7 flogBranch7
hi! link flogMerge6Branch7End flogBranch7
hi! link flogMerge7Branch7 flogBranch7
hi! link flogMerge7Branch7End flogBranch7
hi! link flogMerge8Branch7 flogBranch7
hi! link flogMerge8Branch7End flogBranch7
hi! link flogMerge9Branch7 flogBranch7
hi! link flogMerge9Branch7End flogBranch7

exe 'hi flogBranch8 guifg='.s:branch_8.' guibg='.s:none
hi! link flogBranch8AfterCommit flogBranch8
hi! link flogBranch8AfterMerge flogBranch8
hi! link flogBranch8ComplexMerge flogBranch8
hi! link flogBranch8ComplexMergeStart flogBranch8
hi! link flogBranch8MergeStart flogBranch8
hi! link flogMerge8Horizontal flogBranch8
hi! link flogMerge1Branch8 flogBranch8
hi! link flogMerge1Branch8End flogBranch8
hi! link flogMerge2Branch8 flogBranch8
hi! link flogMerge2Branch8End flogBranch8
hi! link flogMerge3Branch8 flogBranch8
hi! link flogMerge3Branch8End flogBranch8
hi! link flogMerge4Branch8 flogBranch8
hi! link flogMerge4Branch8End flogBranch8
hi! link flogMerge5Branch8 flogBranch8
hi! link flogMerge5Branch8End flogBranch8
hi! link flogMerge6Branch8 flogBranch8
hi! link flogMerge6Branch8End flogBranch8
hi! link flogMerge7Branch8 flogBranch8
hi! link flogMerge7Branch8End flogBranch8
hi! link flogMerge8Branch8 flogBranch8
hi! link flogMerge8Branch8End flogBranch8
hi! link flogMerge9Branch8 flogBranch8
hi! link flogMerge9Branch8End flogBranch8

exe 'hi flogBranch9 guifg='.s:branch_9.' guibg='.s:none
hi! link flogBranch9AfterCommit flogBranch9
hi! link flogBranch9AfterMerge flogBranch9
hi! link flogBranch9ComplexMerge flogBranch9
hi! link flogBranch9ComplexMergeStart flogBranch9
hi! link flogBranch9MergeStart flogBranch9
hi! link flogMerge9Horizontal flogBranch9
hi! link flogMerge1Branch9 flogBranch9
hi! link flogMerge1Branch9End flogBranch9
hi! link flogMerge2Branch9 flogBranch9
hi! link flogMerge2Branch9End flogBranch9
hi! link flogMerge3Branch9 flogBranch9
hi! link flogMerge3Branch9End flogBranch9
hi! link flogMerge4Branch9 flogBranch9
hi! link flogMerge4Branch9End flogBranch9
hi! link flogMerge5Branch9 flogBranch9
hi! link flogMerge5Branch9End flogBranch9
hi! link flogMerge6Branch9 flogBranch9
hi! link flogMerge6Branch9End flogBranch9
hi! link flogMerge7Branch9 flogBranch9
hi! link flogMerge7Branch9End flogBranch9
hi! link flogMerge8Branch9 flogBranch9
hi! link flogMerge8Branch9End flogBranch9
hi! link flogMerge9Branch9 flogBranch9
hi! link flogMerge9Branch9End flogBranch9

exe 'hi flogRef guifg='.s:accent_4.' guibg='.s:none
exe 'hi flogRefHead guifg='.s:accent_7.' guibg='.s:none
exe 'hi flogRefTag guifg='.s:secondary_2.' guibg='.s:none
exe 'hi flogRefHeadBranch guifg='.s:accent_7.' guibg='.s:none
exe 'hi flogAuthor guifg='.s:primary_5.' guibg='.s:none
exe 'hi flogDate guifg='.s:neutral_7.' guibg='.s:none
exe 'hi flogHash guifg='.s:neutral_6.' guibg='.s:none