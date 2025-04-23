local Color = {
  BACKGROUND = '#252a2d',
  BACKGROUND_DARK = '#1f2427',
  BACKGROUND_LIGHT = '#323940',
  BOOLEAN = '#ced4da',
  CLASS_DECL = '#76c893',
  COLOR = '#fffffff',
  COMMENT = '#4a5759',
  CONSTANT = '#90a8c3',
  NULL = '#607890',
  CONSTRUCTOR = '#34a0a4',
  ERROR = '#ff6361',
  FUNC_CALL = '#99d98c',
  FUNC_DECL = '#76c893',
  FUNC_PARAM = '#d9ed92',
  FUNC_PARAM_DECL = '#d9ed92',
  HINT = '#98c9a3',
  INFO = '#82a1bf',
  KEYWORD = '#607890',
  KEYWORD_DARK = '#4f5d75',
  NONE = 'NONE',
  NUMBER = '#ffdd00',
  OPERATOR = '#90a8c3',
  PUNCTUATION = '#607890',
  STRING = '#ffe97f',
  TEXT_DEFAULT = '#e8eddf',
  TYPE_DECL = '#5390d9',
  TYPE_BUILTIN = '#916dd5',
  TYPE = '#5e60ce',
  VARIABLE = '#ced4da',
  VARIABLE_DECL = '#f8f9fa',
  WARNING = '#fbfd79',
  SEARCH = '#ff4d6d',
}

local Colorscheme = {
  boolean = { fg = Color.BOOLEAN },
  comment = { fg = Color.COMMENT, bg = Color.NONE, italic = true },
  constant = { fg = Color.CONSTANT },
  null = { fg = Color.NULL },
  cursorLine = { fg = Color.NONE, bg = Color.BACKGROUND_DARK },
  cursorLineNr = { fg = Color.TEXT, bg = Color.BACKGROUND_DARK },
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
  silent = { fg = Color.BACKGROUND_LIGHT },
  special = { fg = Color.SPECIAL },
  statementDark = { fg = Color.KEYWORD_DARK },
  statement = { fg = Color.KEYWORD },
  string = { fg = Color.STRING },
  text = { fg = Color.TEXT },
  type = { fg = Color.TYPE },
  typeDecl = { fg = Color.TYPE_DECL },
  typeBuiltIn = { fg = Color.TYPE_BUILTIN },
  undefined = { fg = 'magenta' },
  variable = { fg = Color.VARIABLE },
  variableDecl = { fg = Color.VARIABLE_DECL },
  winSeparator = { fg = Color.BACKGROUND_DARK },
  listSelect = { fg = Color.TYPE_BUILTIN, bg = Color.BACKGROUND },
}

local hlGroups = {
  -- vim
  Comment = Colorscheme.comment,
  Constant = Colorscheme.constant,
  CurSearch = Colorscheme.searchCur,
  Cursor = Colorscheme.variable,
  CursorColumn = Colorscheme.none,
  CursorLine = Colorscheme.cursorLine,
  CursorLineNr = Colorscheme.cursorLineNr,
  DiagnosticDeprecated = Colorscheme.undefined,
  Function = Colorscheme.funcCall,
  IncSearch = Colorscheme.searchCur,
  LineNr = Colorscheme.lineNr,
  NonText = Colorscheme.silent,
  Normal = Colorscheme.text,
  Operator = Colorscheme.operator,
  PmenuSbar = Colorscheme.undefined,
  PmenuThumb = Colorscheme.undefined,
  Search = Colorscheme.search,
  Special = Colorscheme.special,
  Statement = Colorscheme.statementDark,
  String = Colorscheme.string,
  Structure = Colorscheme.special,
  Type = Colorscheme.type,
  WinSeparator = Colorscheme.winSeparator,
  htmlTag = Colorscheme.punctuation,
  htmlTagName = Colorscheme.statement,
  FloatBorder = { fg = Color.BACKGROUND_DARK, reverse = true },
  NormalFloat = { bg = Color.BACKGROUND_DARK },
  StatusLine = { fg = Color.VARIABLE, bg = Color.BACKGROUND },
  Visual = { bg = Color.VARIABLE, fg = Color.BACKGROUND_DARK },
  Pmenu = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARK },
  PmenuSel = Colorscheme.listSelect,
  DiagnosticError = Colorscheme.error,
  DiagnosticHint = { fg = Color.HINT },
  DiagnosticInfo = { fg = Color.INFO },
  DiagnosticOk = { fg = Color.UNDEFINED },
  DiagnosticUnderlineError = { undercurl = true, sp = Color.ERROR },
  DiagnosticUnderlineHint = { undercurl = true, sp = Color.HINT },
  DiagnosticUnderlineInfo = { undercurl = true, sp = Color.INFO },
  DiagnosticUnderlineOk = { fg = 'magenta' },
  DiagnosticUnderlineWarn = { undercurl = true, sp = Color.WARNING },
  -- DiagnosticWarn = { fg = OLD.warning },
  Identifier = { fg = Color.VARIABLE },
  LspReferenceRead = { underdouble = true },
  LspReferenceText = { underdouble = true },

  Directory = { fg = Color.CONSTANTTYPE },
  WildMenu = Colorscheme.undefined,
  SignColumn = Colorscheme.undefined,
  SpecialKey = Colorscheme.undefined,
  SpellBad = Colorscheme.undefined,
  SpellCap = Colorscheme.undefined,
  SpellLocal = Colorscheme.undefined,
  SpellRare = Colorscheme.undefined,
  ColorColumn = Colorscheme.undefined,
  Conceal = Colorscheme.undefined,
  lCursor = Colorscheme.undefined,
  qfLineNr = Colorscheme.undefined,
  RedrawDebugClear = Colorscheme.undefined,
  RedrawDebugComposed = Colorscheme.undefined,
  RedrawDebugNormal = Colorscheme.undefined,
  RedrawDebugRecompose = Colorscheme.undefined,
  Todo = Colorscheme.undefined,

  FoldLabel = { bg = Color.BACKGROUND_DARK, fg = Color.COMMENT },
  FoldLabelSym = { fg = Color.BACKGROUND_DARK },

  -- LspSignatureActiveParameter = { fg = OLD.accent, bg = OLD.text_light },

  TelescopeBorder = { fg = Color.BACKGROUND_DARK, bg = Color.BACKGROUND_DARK },
  TelescopeMatching = { link = 'Search' },
  TelescopeMultiIcon = { link = 'TelescopeMultiSelection' },
  TelescopeNormal = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARK },
  TelescopePreviewNormal = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARK },
  -- TelescopePreviewTitle = { fg = Color.BACKGROUND_DARK, bg = Color.NUMBER },
  TelescopePromptBorder = { fg = Color.BACKGROUND_LIGHT, bg = Color.BACKGROUND_LIGHT },
  TelescopePromptCounter = { fg = Color.VARIABLE, bg = Color.BACKGROUND_LIGHT },
  TelescopePromptNormal = { fg = Color.VARIABLE, bg = Color.BACKGROUND_LIGHT },
  TelescopePromptTitle = { fg = Color.BACKGROUND_DARK, bg = Color.TYPE },
  TelescopeSelection = Colorscheme.listSelect,

  LualineA = { fg = Color.BACKGROUND_DARK, bg = Color.VARIABLE },
  LualineB = { fg = Color.VARIABLE, bg = Color.BACKGROUND_DARK },
  -- LualineC = { fg = OLD.line_nr, },

  -- LspInlayHint = { fg = '#415a77', italic = true },

  -- DiagnosticUnnecessary = { fg = OLD.comment, italic = false, undercurl = true },

  CmpItemKind = { fg = Color.COMMENT },
  CmpItemAbbr = { fg = Color.VARIABLE },
  CmpItemAbbrMatch = Colorscheme.search,
  CmpItemAbbrMatchFuzzy = Colorscheme.error,

  MiniIndentscopeSymbol = Colorscheme.type,
  IblIndent = Colorscheme.silent,
  IblScope = Colorscheme.silent,
  IblWhitespace = Colorscheme.none,

  Folded = { fg = Color.BACKGROUND_LIGHT, italic = true },
  FoldColumn = { fg = Color.KEYWORD },
  FoldColumnOpen = { fg = Color.COMMENT },
  FoldColumnClose = { fg = Color.CONSTANT },
  CursorLineFold = { fg = Color.KEYWORD, bg = Color.BACKGROUND_DARK, italic = true },
  BlameLineNvim = Colorscheme.comment,

  -- fugitive
  fugitiveHash = { fg = Color.TYPE },
  fugitiveHelpTag = { fg = Color.TYPE },

  fugitiveHeading = Colorscheme.listSelect,
  fugitiveStagedHeading = Colorscheme.listSelect,
  fugitiveUnstagedHeading = Colorscheme.listSelect,
  fugitiveUntrackedHeading = Colorscheme.listSelect,
  -- --
  fugitiveSymbolicRef = { fg = Color.VARIABLE },

  fugitiveUnstagedSection = { fg = Color.VARIABLE },

  fugitiveCount = { fg = Color.KEYWORD },
  fugitiveHunk = { fg = Color.KEYWORD },
  fugitiveUnstagedModifier = { fg = Color.KEYWORD },
  fugitiveUntrackedSection = { fg = Color.KEYWORD },
  fugitiveStagedModifier = { fg = Color.KEYWORD },

  fugitiveHeader = { fg = Color.KEYWORD_DARK },
  fugitiveUntrackedModifier = { fg = Color.KEYWORD_DARK },

  fugitiveStagedSection = { fg = Color.FUNC_DECL },

  -- typescript
  ['@constant.builtin.typescript'] = Colorscheme.null,
  ['@boolean.typescript'] = Colorscheme.constant,
  ['@constructor.lua'] = Colorscheme.punctuation,
  ['@constructor.typescript'] = Colorscheme.constructor,
  ['@function.builtin.typescript'] = Colorscheme.funcDecl,
  ['@function.call.typescript'] = Colorscheme.funcCall,
  ['@function.method.call.typescript'] = Colorscheme.funcCall,
  ['@keyword.conditional.ternary.typescript'] = Colorscheme.operator,
  ['@keyword.conditional.typescript'] = Colorscheme.statement,
  ['@keyword.coroutine.typescript'] = Colorscheme.statement,
  ['@keyword.exception.typescript'] = Colorscheme.statement,
  ['@keyword.function.typescript'] = Colorscheme.statement,
  ['@keyword.import.typescript'] = Colorscheme.statementDark,
  ['@keyword.modifier.typescript'] = Colorscheme.statement,
  ['@keyword.operator.typescript'] = Colorscheme.operator,
  ['@keyword.repeat.typescript'] = Colorscheme.statement,
  ['@keyword.return.typescript'] = Colorscheme.statement,
  ['@keyword.typescript'] = Colorscheme.statementDark,
  ['@keyword.type.typescript'] = Colorscheme.statementDark,
  ['@number.typescript'] = Colorscheme.number,
  ['@operator.typescript'] = Colorscheme.operator,
  ['@punctuation.bracket.lua'] = Colorscheme.punctuation,
  ['@punctuation.bracket.typescript'] = Colorscheme.punctuation,
  ['@punctuation.delimiter.typescript'] = Colorscheme.punctuation,
  ['@punctuation.special.typescript'] = Colorscheme.punctuation,
  ['@string.escape.typescript'] = Colorscheme.undefined,
  ['@type.builtin.typescript'] = Colorscheme.typeBuiltIn,
  ['@type.typescript'] = Colorscheme.type,
  ['@variable'] = Colorscheme.variable,
  ['@variable.builtin.typescript'] = Colorscheme.statement,
  ['@variable.parameter.typescript'] = Colorscheme.funcParam,
  ['@module.builtin.typescript'] = Colorscheme.variable,

  ['@lsp.type.class.typescript'] = Colorscheme.type,
  ['@lsp.type.enum.typescript'] = Colorscheme.variable,
  ['@lsp.type.enumMember.typescript'] = Colorscheme.constant,
  ['@lsp.typemod.enumMember.declaration.typescript'] = Colorscheme.variable,
  ['@lsp.type.function.typescript'] = Colorscheme.funcCall,
  ['@lsp.type.interface.typescript'] = Colorscheme.none,
  ['@lsp.type.parameter.typescript'] = Colorscheme.funcParam,
  ['@lsp.type.property.typescript'] = Colorscheme.none,
  ['@lsp.type.type.typescript'] = Colorscheme.none,
  ['@lsp.type.typeParameter.typescript'] = Colorscheme.none,
  ['@lsp.type.variable.typescript'] = Colorscheme.none,
  ['@lsp.typemod.class.declaration.typescript'] = Colorscheme.typeDecl,
  ['@lsp.typemod.class.defaultLibrary.typescript'] = Colorscheme.typeBuiltIn,
  ['@lsp.typemod.interface.defaultLibrary.typescript'] = Colorscheme.typeBuiltIn,
  ['@lsp.typemod.function.declaration.typescript'] = Colorscheme.funcDecl,
  ['@lsp.typemod.type.declaration.typescript'] = Colorscheme.typeDecl,
  ['@lsp.typemod.parameter.declaration.typescript'] = Colorscheme.funcParamDecl,
  ['@lsp.typemod.typeParameter.declaration.typescript'] = Colorscheme.typeDecl,
  ['@lsp.typemod.interface.declaration.typescript'] = Colorscheme.typeDecl,
  ['@lsp.typemod.property.declaration.typescript'] = Colorscheme.variableDecl,
  ['@lsp.typemod.variable.declaration.typescript'] = Colorscheme.variableDecl,
  ['@lsp.typemod.variable.defaultLibrary.typescript'] = Colorscheme.none,

  -- vue
  -- ['@tag.attribute.tsx'] = { fg = OLD.text_medium },
  ['@tag.delimiter.typescript'] = { fg = Color.PUNCTUATION },
  ['@tag.typescript'] = Colorscheme.statementDark,
  ['@tag.attribute.typescript'] = Colorscheme.variable,
  ['@variable.member.typescript'] = { fg = Color.VARIABLE },
  ['@function.method.typescript'] = Colorscheme.funcCall,
  ['@tag.builtin.vuescript'] = { fg = Color.UNDEFINED },

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
--   StatusLineNC = { fg = OLD.text_light, bg = OLD.background_dark },
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
--   flogRef = { fg = OLD.accent },
--   flogRefHead = { fg = OLD.type },
--   flogRefTag = { fg = OLD.operator },
--   flogRefHeadBranch = { fg = OLD.type },
--   flogAuthor = { fg = OLD.text_dark },
--   flogDate = { fg = OLD.accent },
--   flogHash = { fg = OLD.text_dark },
-- }

local overrideHlGroups = {
  ['@variable.member.vue'] = { fg = Color.FUNC_PARAM, nocombine = true },
}

local M = {}

M.apply = function()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "ipsum"

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
