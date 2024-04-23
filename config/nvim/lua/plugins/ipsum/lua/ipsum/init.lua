local background = '#252a2e'
local background_light = '#323940'
local background_dark = '#222429'
local undefined = '#ff00ff'
local none = 'NONE'
local text_light = '#dde4f2'
local text_lighter = '#c7d2d4'
local text_medium = '#91a6aa'
local text_dark = '#758797'
local hint = '#829d9b'
local info = '#82a1bf'
local warning = '#fbfd79'
local error = '#ff6361'
local add = '#99d98c'
local remove = '#fb878e'
local highlight = '#168aad'
local accent = '#b786e0'
local accent_2 = '#9385e3'
local accent_3 = '#769bd1'
local punctuation = '#6a7991'
local secondary_2 = '#52b69a'
local operator = '#d9ed92'
local comment = '#515a62'
local line_nr = '#515a62'
local type = '#99d98c'

local host = {
  -- diagnostic
  ErrorMsg = { fg = error },
  WarningMsg = { fg = warning },

  -- search
  IncSearch = { fg = highlight, bg = text_light },
  Search = { fg = text_light, bg = highlight },
  CurSearch = { link = 'IncSearch' },

  -- spelling
  SpellBad = { fg = undefined },
  SpellCap = { fg = undefined },
  SpellLocal = { fg = undefined },
  SpellRare = { fg = undefined },

  -- diff
  DiffAdd = { fg = add, reverse = true },
  DiffChange = { fg = none },
  DiffDelete = { fg = remove, reverse = true },
  DiffText = { fg = text_light, reverse = true },

  -- fold
  FoldColumn = { fg = undefined },
  Folded = { fg = text_dark },

  -- menu
  Pmenu = { fg = text_medium, bg = background },
  PmenuSbar = { fg = undefined, reverse = true },
  PmenuSel = { fg = text_medium, reverse = true },
  PmenuThumb = { fg = text_medium, reverse = true },

  -- line number
  CursorLineNr = { fg = text_light, bg = background_dark },
  LineNr = { fg = line_nr },

  -- cursor
  CursorColumn = { fg = none },
  CursorLine = { fg = none, bg = background_dark },

  -- status line
  StatusLine = { fg = text_medium, bg = background },
  StatusLineNC = { fg = text_light, bg = background_dark },

  -- tab line
  TabLine = { fg = text_medium, bg = background_light },
  TabLineFill = { fg = background_light, bg = background_light },
  TabLineSel = { fg = text_medium },

  -- ???
  ColorColumn = { fg = undefined },
  Conceal = { fg = undefined },
  Directory = { fg = text_medium },
  ModeMsg = { fg = text_medium },
  MoreMsg = { fg = text_medium },
  NonText = { fg = background_light },
  EndOfBuffer = { fg = background },
  Question = { fg = text_medium },
  SignColumn = { fg = undefined },
  SpecialKey = { fg = undefined },
  TermCursor = { fg = background, bg = text_light },
  Title = { fg = text_medium },
  VertSplit = { fg = background_dark, bg = background_dark },
  Visual = { fg = text_light, bg = highlight },
  WildMenu = { fg = undefined },
}

local syntax = {
  BlameLineNvim = { fg = line_nr },
  Comment = { fg = comment, standout = true },
  Constant = { fg = accent },
  Cursor = { fg = text_light },
  CursorLineConceal = { fg = undefined },
  DiagnosticDeprecated = { fg = none },
  DiagnosticError = { fg = error },
  DiagnosticHint = { fg = hint },
  DiagnosticInfo = { fg = info },
  DiagnosticOk = { fg = undefined },
  DiagnosticUnderlineError = { fg = error, reverse = true },
  DiagnosticUnderlineHint = { underline = true },
  DiagnosticUnderlineInfo = { fg = text_medium },
  DiagnosticUnderlineOk = { fg = undefined },
  DiagnosticUnderlineWarn = { fg = warning, reverse = true },
  DiagnosticWarn = { fg = warning },
  diffAdded = { fg = add },
  diffRemoved = { fg = remove },
  Error = { fg = error },
  floatBorder = { fg = text_medium },
  FloatShadow = { fg = undefined, bg = undefined, blend = 90 },
  FloatShadowThrough = { fg = undefined, bg = background, blend = 90 },
  fugitiveHunk = { fg = text_medium },
  Function = { fg = text_light },
  HopNextKey = { fg = operator },
  HopNextKey1 = { fg = accent },
  HopNextKey2 = { fg = accent_2 },
  HopUnmatched = { fg = text_dark },
  htmlTag = { fg = punctuation },
  htmlTagName = { fg = accent },
  IblIndent = { fg = background_light, default = true },
  IblScope = { fg = hint },
  IblWhitespace = { fg = none },
  IblScopeHighlight = { bg = background_light, standout = true, underline = false },
  Identifier = { fg = text_light },
  lCursor = { fg = undefined },
  LongLineWarning = { fg = warning },
  MatchParen = { fg = none, reverse = true },
  Normal = { fg = text_light },
  NvimInternalError = { fg = error },
  Operator = { fg = operator },
  PreProc = { fg = text_light },
  qfLineNr = { fg = undefined },
  RedrawDebugClear = { fg = undefined },
  RedrawDebugComposed = { fg = undefined },
  RedrawDebugNormal = { fg = undefined },
  RedrawDebugRecompose = { fg = undefined },
  Special = { fg = text_medium },
  Statement = { fg = text_light },
  String = { fg = accent },
  Structure = { fg = text_medium },
  Todo = { fg = undefined },
  Type = { fg = text_light },
  ['@lsp.type.type.typescriptreact'] = { fg = type },
  Underlined = { fg = accent_3 },
  WinBar = { fg = undefined },


  fugitiveHash = { fg = accent_2 },
  fugitiveHeading = { fg = text_dark },
  fugitiveCount = { fg = text_medium },
  fugitiveUntrackedSection = { fg = text_medium },
  fugitiveUnstagedSection = { fg = text_light },
  fugitiveStagedSection = { fg = add },
  fugitiveUntrackedModifier = { fg = text_dark },
  fugitiveUnstagedModifier = { fg = text_medium },
  fugitiveStagedModifier = { fg = secondary_2 },
  fugitiveHelpTag = { fg = accent_3 },
  fugitiveUntrackedHeading = { fg = text_dark },
  fugitiveUnstagedHeading = { fg = text_dark },
  fugitiveSymbolicRef = { fg = text_light },
  fugitiveHeader = { fg = text_dark },
  fugitiveStagedHeading = { fg = text_dark },
  ['@variable'] = { fg = text_light },
  ['@keyword.lua'] = { fg = text_medium },
  ['@keyword.tsx'] = { fg = text_dark },
  ['@keyword.import.tsx'] = { fg = text_dark },
  ['@keyword.operator.tsx'] = { fg = text_medium },
  -- ['@function.method.call.tsx'] = { fg = accent_3 },
  -- ['@lsp.type.function.typescriptreact'] = { fg = accent_3 },
  ['@lsp.type.class.typescriptreact'] = { fg = text_light },
  ['@lsp.typemod.class.defaultLibrary.typescriptreact'] = { fg = text_medium },
  ['@lsp.typemod.property.declaration.typescriptreact'] = { fg = text_lighter },
  ['@keyword.function.tsx'] = { fg = accent_2 },
  ['@keyword.return.tsx'] = { fg = accent_2 },
  ['@keyword.conditional.tsx'] = { fg = accent_3 },
  ['@keyword.coroutine.tsx'] = { fg = accent_2 },
  -- ['@constant.builtin.tsx'] = { fg = accent_2 },
  ['@punctuation.bracket.lua'] = { fg = punctuation },
  ['@constructor.lua'] = { fg = punctuation },
  ['@punctuation.bracket.tsx'] = { fg = punctuation },
  ['@punctuation.delimiter.tsx'] = { fg = punctuation },
  ['@punctuation.special.javascript'] = { fg = punctuation },
  ['@punctuation.special.tsx'] = { fg = punctuation },
  ['@tag.builtin.tsx'] = { fg = accent },
  ['@lsp.typemod.variable.defaultLibrary.typescriptreact'] = { fg = text_dark },
  ['@string.escape.tsx'] = { fg = text_light },
  ['@tag.tsx'] = { fg = accent },
  ['@tag.attribute.tsx'] = { fg = text_medium },
  ['@type.builtin.tsx'] = { fg = type },
  tsxTagName = { fg = accent },
  tsxAttrib = { fg = text_medium },
  LspSignatureActiveParameter = { fg = accent, bg = text_light },
  EyelinerPrimary = { fg = operator },
  EyelinerSecondary = { fg = accent },
  EyelinerDimmed = { fg = text_dark },
  TelescopeBorder = { fg = text_dark },
  TelescopeMatching = { link = 'Search' },
  gitcommitOverflow = { fg = text_light },
  NvimInvalidSpacing = { link = 'ErrorMsg' },
  ['@tag.delimiter.tsx'] = { link = 'htmlTag' },
  ['@lsp.type.interface.typescriptreact'] = { link = 'Type' },
  TelescopeSelection = { link = 'CursorLine' },
  TelescopeMultiIcon = { link = 'TelescopeMultiSelection' },
  gitcommitSummary = { link = 'Normal' },
  gitcommitFirstLine = { link = 'Normal' },
  ActiveTab = { fg = background, bg = text_dark },
  jsonKeywordMatch = { fg = punctuation },
  WhiteSpace = { fg = none, standout = true },

  -- flog
  flogRef = { fg = accent },
  flogRefHead = { fg = type },
  flogRefTag = { fg = operator },
  flogRefHeadBranch = { fg = type },
  flogAuthor = { fg = text_dark },
  flogDate = { fg = accent_2 },
  flogHash = { fg = text_dark },
}

local M = {}

M.apply = function()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "ipsum"

  for group_name, description in pairs(host) do
    vim.api.nvim_set_hl(0, group_name, description)
  end
  for group_name, description in pairs(syntax) do
    vim.api.nvim_set_hl(0, group_name, description)
  end
end

return M
