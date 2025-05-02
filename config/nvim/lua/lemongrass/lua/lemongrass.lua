local Color = {
  BACKGROUND = '#252a2d',
  BACKGROUND_SEMIDARK = '#22272a',
  BACKGROUND_DARK = '#202528',
  BACKGROUND_DARKER = '#1b2022',
  BACKGROUND_LIGHTER = '#323940',
  BACKGROUND_LIGHT = '#2c3237',
  BOOLEAN = '#ced4da',
  CLASS_DECL = '#76c893',
  COLOR = '#fffffff',
  COMMENT = '#4a5759',
  COMMENT_LIGHT = '#768184',
  CONSTANT = '#90a8c3',
  CURSOR_LINE = '#292e32',
  NULL = '#607890',
  CONSTRUCTOR = '#34a0a4',
  ERROR = '#f25c54',
  FUNC_CALL = '#99d98c',
  FUNC_DECL = '#76c893',
  FUNC_PARAM = '#d9ed92',
  FUNC_PARAM_DECL = '#b5e48c',
  HINT = '#708d81',
  INFO = '#90a8c3',
  KEYWORD = '#607890',
  KEYWORD_DARK = '#4f5d75',
  NONE = 'NONE',
  NUMBER = '#f7b267',
  OPERATOR = '#90a8c3',
  PUNCTUATION = '#607890',
  STRING = '#ffe97f',
  TEXT_DEFAULT = '#e8eddf',
  TYPE_DECL = '#5684d6',
  TYPE_BUILTIN = '#916dd5',
  TYPE = '#5e60ce',
  UNDEFINED = 'magenta',
  VARIABLE = '#ced4da',
  VARIABLE_DECL = '#f8f9fa',
  WARNING = '#f7b267',
  SEARCH = '#ff4d6d',
}

local Colorscheme = {
  boolean = { fg = Color.BOOLEAN },
  comment = { fg = Color.COMMENT, bg = Color.NONE, italic = true },
  constant = { fg = Color.CONSTANT },
  null = { fg = Color.NULL },
  cursorLine = { fg = Color.NONE, bg = Color.CURSOR_LINE },
  cursorLineNr = { fg = Color.TEXT, bg = Color.CURSOR_LINE },
  -- classDecl = { fg = Color.CLASS_DECL },
  -- class = { fg = Color.CLASS },
  error = { fg = Color.ERROR },
  funcDecl = { fg = Color.FUNC_DECL },
  funcCall = { fg = Color.FUNC_CALL },
  constructor = { fg = Color.FUNC_CALL },
  funcParam = { fg = Color.FUNC_PARAM },
  funcParamDecl = { fg = Color.FUNC_PARAM_DECL },
  lineNr = { fg = Color.COMMENT },
  none = { fg = Color.NONE },
  number = { fg = Color.NUMBER },
  operator = { fg = Color.OPERATOR },
  punctuation = { fg = Color.PUNCTUATION },
  search = { fg = Color.SEARCH },
  searchCur = { fg = Color.BACKGROUND, bg = Color.SEARCH },
  silent = { fg = Color.BACKGROUND_LIGHTER },
  special = { fg = Color.SPECIAL },
  statementDark = { fg = Color.KEYWORD_DARK },
  statement = { fg = Color.KEYWORD },
  string = { fg = Color.STRING },
  text = { fg = Color.TEXT, bg = Color.BACKGROUND },
  type = { fg = Color.TYPE },
  typeDecl = { fg = Color.TYPE_DECL },
  typeBuiltIn = { fg = Color.TYPE_BUILTIN },
  undefined = { fg = Color.UNDEFINED },
  variable = { fg = Color.VARIABLE },
  variableDecl = { fg = Color.VARIABLE_DECL },
  winSeparator = { fg = Color.BACKGROUND_SEMIDARK },
  listSelect = { fg = Color.TYPE, bg = Color.BACKGROUND_DARK },
}

local hlGroups = {
  -- vim
  Comment                                               = Colorscheme.comment,
  Constant                                              = Colorscheme.constant,
  CurSearch                                             = Colorscheme.searchCur,
  Cursor                                                = Colorscheme.variable,
  CursorColumn                                          = Colorscheme.none,
  CursorLine                                            = Colorscheme.cursorLine,
  CursorLineNr                                          = Colorscheme.cursorLineNr,
  DiagnosticDeprecated                                  = Colorscheme.undefined,
  Function                                              = Colorscheme.funcCall,
  IncSearch                                             = Colorscheme.searchCur,
  LineNr                                                = Colorscheme.lineNr,
  NonText                                               = Colorscheme.silent,
  Normal                                                = Colorscheme.text,
  Operator                                              = Colorscheme.operator,
  PmenuSbar                                             = Colorscheme.undefined,
  PmenuThumb                                            = Colorscheme.undefined,
  Search                                                = Colorscheme.search,
  Special                                               = Colorscheme.special,
  Statement                                             = Colorscheme.statementDark,
  String                                                = Colorscheme.string,
  Structure                                             = Colorscheme.special,
  Type                                                  = Colorscheme.type,
  WinSeparator                                          = Colorscheme.winSeparator,
  htmlTag                                               = Colorscheme.punctuation,
  htmlTagName                                           = Colorscheme.statement,
  FloatBorder                                           = { fg = Color.BACKGROUND, bg = Color.BACKGROUND_DARKER },
  FloatTitle                                            = { fg = Color.BACKGROUND_DARKER, bg = Color.BACKGROUND_DARKER },
  NormalFloat                                           = { bg = Color.BACKGROUND_DARKER },
  StatusLine                                            = { fg = Color.VARIABLE, bg = Color.BACKGROUND_SEMIDARK },
  StatusLineNC                                          = { fg = Color.COMMENT, bg = Color.BACKGROUND },
  Visual                                                = { bg = Color.VARIABLE, fg = Color.BACKGROUND_DARKER },
  Pmenu                                                 = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARKER },
  PmenuSel                                              = Colorscheme.listSelect,
  DiagnosticError                                       = Colorscheme.error,
  DiagnosticHint                                        = { fg = Color.HINT },
  DiagnosticInfo                                        = { fg = Color.INFO },
  DiagnosticOk                                          = { fg = Color.UNDEFINED },
  DiagnosticUnderlineError                              = { undercurl = true, sp = Color.ERROR },
  DiagnosticUnderlineHint                               = { undercurl = true, sp = Color.HINT },
  DiagnosticUnderlineInfo                               = { undercurl = true, sp = Color.INFO },
  DiagnosticUnderlineOk                                 = { fg = 'magenta' },
  DiagnosticUnderlineWarn                               = { undercurl = true, sp = Color.WARNING },
  WinBar                                                = { fg = Color.COMMENT, bg = Color.BACKGROUND, italic = true },
  WinBarNC                                              = { fg = Color.COMMENT, bg = Color.BACKGROUND, italic = true },
  DiagnosticWarn                                        = { fg = Color.WARNING },
  Identifier                                            = { fg = Color.VARIABLE },

  Directory                                             = { fg = Color.CONSTANTTYPE },
  WildMenu                                              = Colorscheme.undefined,
  SignColumn                                            = Colorscheme.undefined,
  SpecialKey                                            = Colorscheme.undefined,
  SpellBad                                              = Colorscheme.undefined,
  SpellCap                                              = Colorscheme.undefined,
  SpellLocal                                            = Colorscheme.undefined,
  SpellRare                                             = Colorscheme.undefined,
  ColorColumn                                           = Colorscheme.undefined,
  Conceal                                               = Colorscheme.undefined,
  lCursor                                               = Colorscheme.undefined,
  qfLineNr                                              = Colorscheme.undefined,
  RedrawDebugClear                                      = Colorscheme.undefined,
  RedrawDebugComposed                                   = Colorscheme.undefined,
  RedrawDebugNormal                                     = Colorscheme.undefined,
  RedrawDebugRecompose                                  = Colorscheme.undefined,
  Todo                                                  = Colorscheme.undefined,

  FoldLabel                                             = { bg = Color.BACKGROUND_DARKER, fg = Color.COMMENT },
  FoldLabelSym                                          = { fg = Color.BACKGROUND_DARKER },

  MiniCursorword                                        = { underline = true },
  MiniCursorwordCurrent                                 = { underline = false },

  LspSignatureActiveParameter                           = { fg = Color.VARIABLE },
  LspSignatureHint                                      = { fg = Color.COMMENT, bg = Color.BACKGROUND, italic = true },

  TreesitterContext                                     = { bg = Color.BACKGROUND_LIGHT, italic = true },
  TreesitterContextLineNumber                           = { fg = Color.COMMENT, bg = Color.BACKGROUND_LIGHT },
  TreesitterContextSeparator                            = { fg = '#292e32', bg = Color.BACKGROUND_LIGHT },

  WinbarSeparator                                       = { fg = Color.BACKGROUND_SEMIDARK, bg = Color.BACKGROUND },
  WinbarFolder                                          = { fg = Color.COMMENT, bg = Color.BACKGROUND_SEMIDARK },
  WinbarFilename                                        = { fg = Color.COMMENT_LIGHT, bg = Color.BACKGROUND_SEMIDARK },
  StatuslineStart                             = { fg = Color.BACKGROUND_DARKER, bg = Color.BACKGROUND },
  StatuslineLocationCurrent                             = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARK },
  StatuslineLocation                                    = { fg = Color.KEYWORD, bg = Color.BACKGROUND_DARK },
  StatuslineLocationSeparator                           = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND },
  StatuslineMode                                        = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARKER },
  StatuslineModeSeparator                               = { fg = Color.BACKGROUND_DARKER, bg = Color.BACKGROUND_DARK },
  StatuslineFileInfo                                    = { fg = Color.COMMENT, bg = Color.BACKGROUND },
  StatuslineFileInfoSeparator                           = { fg = Color.BACKGROUND_LIGHTER, bg = Color.BACKGROUND },
  StatuslineReset                                       = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND },
  StatuslineError                                       = { fg = Color.ERROR, bg = Color.BACKGROUND_DARK },
  StatuslineWarn                                        = { fg = Color.WARNING, bg = Color.BACKGROUND_DARK },
  StatuslineInfo                                        = { fg = Color.INFO, bg = Color.BACKGROUND_DARK },
  StatuslineHint                                        = { fg = Color.HINT, bg = Color.BACKGROUND_DARK },
  StatuslineFolder                                      = { fg = Color.COMMENT, bg = Color.BACKGROUND_DARKER },
  StatuslineFolderInactive                              = { fg = Color.BACKGROUND_LIGHTER, bg = Color.BACKGROUND_DARK },
  StatuslineFilename                                    = { fg = Color.TYPE, bg = Color.BACKGROUND_DARKER },
  StatuslineFilenameInactive                            = { fg = Color.KEYWORD, bg = Color.BACKGROUND_DARK },
  StatuslineFilenameSeparator                           = { fg = Color.BACKGROUND_DARKER, bg = Color.BACKGROUND_DARK },
  StatuslineFilenameInactiveSeparator                   = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND_SEMIDARK },
  StatuslineFilenameNoDiagSeparator                     = { fg = Color.BACKGROUND_DARKER, bg = Color.BACKGROUND },
  StatuslineFilenameInactiveNoDiagSeparator             = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND },
  StatuslineDiagnosticSeparator                         = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND },
  StatuslineDiagnosticInactiveSeparator                 = { fg = Color.BACKGROUND_SEMIDARK, bg = Color.BACKGROUND },

  TelescopePromptPrefix                                 = { fg = Color.COMMENT, bg = Color.BACKGROUND_DARK },
  TelescopeBorder                                       = { fg = Color.BACKGROUND_DARKER, bg = Color.BACKGROUND_DARKER },
  TelescopeMatching                                     = { link = 'Search' },
  TelescopeMultiIcon                                    = { link = 'TelescopeMultiSelection' },
  TelescopeNormal                                       = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARKER },
  TelescopePreviewTitle                                 = { fg = Color.BACKGROUND, bg = Color.SEARCH },
  TelescopePreviewNormal                                = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARKER },
  TelescopePromptBorder                                 = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND_DARK },
  TelescopePromptCounter                                = { fg = Color.FUNC_DECL, bg = Color.BACKGROUND_DARK },
  TelescopePromptNormal                                 = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARK },
  TelescopePromptTitle                                  = { fg = Color.BACKGROUND, bg = Color.FUNC_CALL },
  TelescopeSelection                                    = Colorscheme.listSelect,

  LoremIpsum                                            = { fg = Color.ERROR, bg = Color.WARNING },

  -- LspInlayHint = { fg = '#415a77', italic = true },

  -- DiagnosticUnnecessary = { fg = OLD.comment, italic = false, undercurl = true },

  CmpItemKind                                           = { fg = Color.COMMENT },
  CmpItemAbbr                                           = { fg = Color.VARIABLE },
  CmpItemAbbrMatch                                      = Colorscheme.search,
  CmpItemAbbrMatchFuzzy                                 = Colorscheme.error,

  MiniIndentscopeSymbol                                 = { fg = Color.TYPE },

  IblIndent                                             = Colorscheme.silent,
  IblScope                                              = Colorscheme.silent,
  IblWhitespace                                         = Colorscheme.none,

  Folded                                                = { fg = Color.BACKGROUND_LIGHTER, italic = true },
  FoldColumn                                            = { fg = Color.BACKGROUND_LIGHTER },
  CursorLineFold                                        = { fg = Color.KEYWORD, bg = Color.CURSOR_LINE, italic = true },
  FoldColumnOpen                                        = { fg = Color.COMMENT },
  CursorLineFoldOpen                                    = { fg = Color.COMMENT, bg = Color.CURSOR_LINE, italic = true },
  FoldColumnClose                                       = { fg = Color.TYPE },
  CursorLineFoldClose                                   = { fg = Color.TYPE, bg = Color.CURSOR_LINE, italic = true },
  BlameLineNvim                                         = Colorscheme.comment,

  -- fugitive
  fugitiveHash                                          = { fg = Color.TYPE },
  fugitiveHelpTag                                       = { fg = Color.TYPE },

  fugitiveHeading                                       = Colorscheme.listSelect,
  fugitiveStagedHeading                                 = Colorscheme.listSelect,
  fugitiveUnstagedHeading                               = Colorscheme.listSelect,
  fugitiveUntrackedHeading                              = Colorscheme.listSelect,
  -- --
  fugitiveSymbolicRef                                   = { fg = Color.VARIABLE },

  fugitiveUnstagedSection                               = { fg = Color.VARIABLE },

  fugitiveCount                                         = { fg = Color.KEYWORD },
  fugitiveHunk                                          = { fg = Color.KEYWORD },
  fugitiveUnstagedModifier                              = { fg = Color.KEYWORD },
  fugitiveUntrackedSection                              = { fg = Color.KEYWORD },
  fugitiveStagedModifier                                = { fg = Color.KEYWORD },

  fugitiveHeader                                        = { fg = Color.KEYWORD_DARK },
  fugitiveUntrackedModifier                             = { fg = Color.KEYWORD_DARK },

  fugitiveStagedSection                                 = { fg = Color.FUNC_DECL },

  flogRefHead                                           = { fg = Color.SEARCH },
  flogRefHeadBranch                                     = { fg = Color.FUNC_CALL },
  flogDate                                              = { fg = Color.KEYWORD_DARK },
  flogHash                                              = { fg = Color.TYPE_BUILTIN },
  flogAuthor                                            = { fg = Color.TYPE },
  flogRefTag                                            = { fg = Color.STRING },
  flogRef                                               = { fg = Color.FUNC_DECL },

  -- typescript
  ['@constant.builtin.typescript']                      = Colorscheme.null,
  ['@boolean.typescript']                               = Colorscheme.constant,
  ['@constructor.lua']                                  = Colorscheme.punctuation,
  ['@constructor.typescript']                           = Colorscheme.constructor,
  ['@function.builtin.typescript']                      = Colorscheme.funcDecl,
  ['@function.call.typescript']                         = Colorscheme.funcCall,
  ['@function.method.call.typescript']                  = Colorscheme.funcCall,
  ['@keyword.conditional.ternary.typescript']           = Colorscheme.operator,
  ['@keyword.conditional.typescript']                   = Colorscheme.statement,
  ['@keyword.coroutine.typescript']                     = Colorscheme.statement,
  ['@keyword.exception.typescript']                     = Colorscheme.statement,
  ['@keyword.function.typescript']                      = Colorscheme.statement,
  ['@keyword.import.typescript']                        = Colorscheme.statementDark,
  ['@keyword.modifier.typescript']                      = Colorscheme.statement,
  ['@keyword.operator.typescript']                      = Colorscheme.operator,
  ['@keyword.repeat.typescript']                        = Colorscheme.statement,
  ['@keyword.return.typescript']                        = Colorscheme.statement,
  ['@keyword.typescript']                               = Colorscheme.statementDark,
  ['@keyword.type.typescript']                          = Colorscheme.statementDark,
  ['@number.typescript']                                = Colorscheme.number,
  ['@operator.typescript']                              = Colorscheme.operator,
  ['@punctuation.bracket.lua']                          = Colorscheme.punctuation,
  ['@punctuation.bracket.typescript']                   = Colorscheme.punctuation,
  ['@punctuation.delimiter.typescript']                 = Colorscheme.punctuation,
  ['@punctuation.special.typescript']                   = Colorscheme.punctuation,
  ['@string.escape.typescript']                         = Colorscheme.undefined,
  ['@type.builtin.typescript']                          = Colorscheme.typeBuiltIn,
  ['@type.typescript']                                  = Colorscheme.type,
  ['@variable']                                         = Colorscheme.variable,
  ['@variable.builtin.typescript']                      = Colorscheme.statement,
  ['@variable.parameter.typescript']                    = Colorscheme.funcParam,
  ['@module.builtin.typescript']                        = Colorscheme.variable,

  ['@lsp.type.class.typescript']                        = Colorscheme.type,
  ['@lsp.type.enum.typescript']                         = Colorscheme.variable,
  ['@lsp.type.enumMember.typescript']                   = Colorscheme.constant,
  ['@lsp.typemod.enumMember.declaration.typescript']    = Colorscheme.variable,
  ['@lsp.type.function.typescript']                     = Colorscheme.funcCall,
  ['@lsp.type.interface.typescript']                    = Colorscheme.none,
  ['@lsp.type.parameter.typescript']                    = Colorscheme.funcParam,
  ['@lsp.type.property.typescript']                     = Colorscheme.none,
  ['@lsp.type.type.typescript']                         = Colorscheme.none,
  ['@lsp.type.typeParameter.typescript']                = Colorscheme.none,
  ['@lsp.type.variable.typescript']                     = Colorscheme.none,
  ['@lsp.typemod.class.declaration.typescript']         = Colorscheme.typeDecl,
  ['@lsp.typemod.class.defaultLibrary.typescript']      = Colorscheme.typeBuiltIn,
  ['@lsp.typemod.interface.defaultLibrary.typescript']  = Colorscheme.typeBuiltIn,
  ['@lsp.typemod.function.declaration.typescript']      = Colorscheme.funcDecl,
  ['@lsp.typemod.type.declaration.typescript']          = Colorscheme.typeDecl,
  ['@lsp.typemod.parameter.declaration.typescript']     = Colorscheme.funcParamDecl,
  ['@lsp.typemod.typeParameter.declaration.typescript'] = Colorscheme.typeDecl,
  ['@lsp.typemod.interface.declaration.typescript']     = Colorscheme.typeDecl,
  ['@lsp.typemod.property.declaration.typescript']      = Colorscheme.variableDecl,
  ['@lsp.typemod.variable.declaration.typescript']      = Colorscheme.variableDecl,
  ['@lsp.typemod.variable.defaultLibrary.typescript']   = Colorscheme.none,

  -- vue
  -- ['@tag.attribute.tsx'] = { fg = OLD.text_medium },
  ['@tag.delimiter.typescript']                         = { fg = Color.PUNCTUATION },
  ['@tag.typescript']                                   = Colorscheme.statementDark,
  ['@tag.attribute.typescript']                         = Colorscheme.variable,
  ['@variable.member.typescript']                       = { fg = Color.VARIABLE },
  ['@function.method.typescript']                       = Colorscheme.funcCall,
  ['@tag.builtin.vuescript']                            = { fg = Color.UNDEFINED },

  -- lua
  -- ['@keyword.lua'] = { link = "Statement" },

  -- lsp
}



-- local host = {
--   DiffAdd = { fg = OLD.add, reverse = true },
--   DiffChange = { fg = OLD.none },
--   DiffDelete = { fg = OLD.remove, reverse = true },
--   diffFile = { fg = OLD.accent },
--   diffIndexLine = { fg = OLD.accent },
--   diffNewFile = { fg = OLD.accent },
--   diffOldFile = { fg = OLD.accent },
--   DiffText = { fg = OLD.text_light, reverse = true },
--   EndOfBuffer = { fg = OLD.background },
--   ErrorMsg = { fg = OLD.error },
--   ModeMsg = { fg = OLD.text_medium },
--   MoreMsg = { fg = OLD.text_medium },
--   Question = { fg = OLD.text_medium },
--   TabLine = { fg = OLD.text_medium, bg = OLD.background_light },
--   TabLineFill = { fg = OLD.background_light, bg = OLD.background_light },
--   TabLineSel = { fg = OLD.text_medium },
--   TermCursor = { fg = OLD.background, bg = OLD.text_light },
--   Title = { fg = OLD.text_medium },
--   WarningMsg = { fg = OLD.warning },
--
-- }

-- local syntax = {
--   ActiveTab = { fg = OLD.background, bg = OLD.text_dark },
--   CursorLineConceal = { fg = OLD.undefined },
--   diffAdded = { fg = OLD.add },
--   diffRemoved = { fg = OLD.remove },
--   Error = { fg = OLD.error },
--   EyelinerDimmed = { fg = OLD.text_dark },
--   EyelinerPrimary = { fg = OLD.operator },
--   EyelinerSecondary = { fg = OLD.accent },
--   gitcommitFirstLine = { link = 'Normal' },
--   gitcommitOverflow = { fg = OLD.text_light },
--   gitcommitSummary = { link = 'Normal' },
--   HopNextKey = { fg = OLD.operator },
--   HopNextKey1 = { fg = OLD.accent },
--   HopNextKey2 = { fg = OLD.accent },
--   HopUnmatched = { fg = OLD.text_dark },
--   jsonKeywordMatch = { fg = OLD.punctuation },
--   LongLineWarning = { fg = OLD.warning },
--   MatchParen = { bg = OLD.highlight, fg = OLD.text_light },
--   NvimInternalError = { fg = OLD.error },
--   NvimInvalidSpacing = { link = 'ErrorMsg' },
--   PreProc = { fg = OLD.text_light },
--   tsxAttrib = { fg = OLD.text_medium },

--   -- ibl

--   Underlined = { fg = OLD.accent },
--   WinBar = { fg = OLD.undefined },

--   -- flog
-- }

local overrideHlGroups = {
  ['@variable.member.vue'] = { fg = Color.FUNC_PARAM, nocombine = true },
}

local M = {}

M.apply = function()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "lemongrass"

  for group_name, description in pairs(hlGroups) do
    vim.api.nvim_set_hl(0, group_name, description)
    local k = group_name:match "(.*)%.typescript$"

    if k then
      for _, t in ipairs({ 'tsx', 'typescript.tsx', 'vue' }) do
        vim.api.nvim_set_hl(0, k .. "." .. t, { link = group_name })
      end
    end
  end


  for group_name, description in pairs(overrideHlGroups) do
    vim.api.nvim_set_hl(0, group_name, description)
  end
end

return M
