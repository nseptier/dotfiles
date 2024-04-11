local background = '#252a2e'
local background_light = '#2e3236'
local background_dark = '#222429'
local undefined = '#ffff00'
local neutral = '#979daa'
local none = 'NONE'
local text_light = '#dde4f2'
local text_medium = '#7c8488'
local text_dark = '#4a535b'
local hint = '#829d9b'
local info = undefined
local warning = '#ffea60'
local error = '#ff6361'
local add = '#99d98c'
local remove = '#fb878e'
local highlight = '#168aad'
local accent = '#b5e48c'

local host = {
  -- diagnostic
  ErrorMsg = { fg = error, bg = none },
  WarningMsg = { fg = warning, bg = none },

  -- search
  IncSearch = { fg = highlight, bg = text_light },
  Search = { fg = text_light, bg = highlight },

  -- spelling
  SpellBad = { fg = undefined, bg = none },
  SpellCap = { fg = undefined, bg = none },
  SpellLocal = { fg = undefined, bg = none },
  SpellRare = { fg = undefined, bg = none },

  -- diff
  DiffAdd = { fg = add, bg = none, reverse = true },
  DiffChange = { fg = none, bg = none },
  DiffDelete = { fg = remove, bg = none, reverse = true },
  DiffText = { fg = text_light, bg = none, reverse = true },

  -- fold
  FoldColumn = { fg = undefined, bg = none },
  Folded = { fg = text_dark, bg = none },

  -- menu
  Pmenu = { fg = text_medium, bg = background },
  PmenuSbar = { fg = undefined, bg = none, reverse = true },
  PmenuSel = { fg = text_medium, bg = none, reverse = true },
  PmenuThumb = { fg = text_medium, bg = none, reverse = true },

  -- line number
  CursorLineNr = { fg = text_light, bg = background_dark },
  LineNr = { fg = text_medium, bg = none },

  -- cursor
  CursorColumn = { fg = none, bg = none },
  CursorLine = { fg = none, bg = background_dark },

  -- status line
  StatusLine = { fg = text_medium, bg = background_dark },
  StatusLineNC = { fg = text_light, bg = background_dark },

  -- tab line
  TabLine = { fg = text_medium, bg = background_light },
  TabLineFill = { fg = background_light, bg = background_light },
  TabLineSel = { fg = text_medium, bg = none },

  -- ???
  ColorColumn = { fg = undefined, bg = none },
  Conceal = { fg = undefined, bg = none },
  Directory = { fg = text_medium, bg = none },
  ModeMsg = { fg = text_medium, bg = none },
  MoreMsg = { fg = text_medium, bg = none },
  NonText = { fg = background_dark, bg = none },
  Question = { fg = text_medium, bg = none },
  SignColumn = { fg = undefined, bg = none },
  SpecialKey = { fg = accent, bg = none },
  TermCursor = { fg = text_medium, bg = none },
  Title = { fg = text_medium, bg = none },
  VertSplit = { fg = background_dark, bg = none },
  Visual = { fg = text_medium, bg = none, reverse = true },
  WildMenu = { fg = undefined, bg = none },
}

local syntax = {
  BlameLineNvim = { fg = text_medium, bg = none },
  Comment = { fg = text_medium, bg = none, standout = true },
  Constant = { fg = accent, bg = none },
  Cursor = { fg = undefined, bg = none },
  CursorLineConceal = { fg = undefined, bg = none },
  DiagnosticDeprecated = { fg = undefined, bg = none },
  DiagnosticError = { fg = error, bg = none },
  DiagnosticHint = { fg = hint, bg = none },
  DiagnosticInfo = { fg = info, bg = none },
  DiagnosticOk = { fg = undefined, bg = none },
  DiagnosticUnderlineError = { fg = error, bg = none, reverse = true },
  DiagnosticUnderlineHint = { fg = none, bg = none },
  DiagnosticUnderlineInfo = { fg = text_medium, bg = none },
  DiagnosticUnderlineOk = { fg = undefined, bg = none },
  DiagnosticUnderlineWarn = { fg = warning, bg = none, reverse = true },
  DiagnosticWarn = { fg = warning, bg = none },
  diffAdded = { fg = accent, bg = none },
  diffRemoved = { fg = remove, bg = none },
  Error = { fg = error, bg = none },
  floatBorder = { fg = text_medium, bg = none },
  FloatShadow = { fg = undefined, bg = undefined, blend = 90 },
  FloatShadowThrough = { fg = undefined, bg = background, blend = 90 },
  fugitiveHunk = { fg = text_medium, bg = none },
  Function = { fg = text_light, bg = none },
  FzfInvisible = { fg = undefined, bg = none },
  GitGutterAdd = { fg = undefined, bg = none },
  GitGutterChange = { fg = undefined, bg = none },
  GitGutterChangeDelete = { fg = undefined, bg = none },
  GitGutterDelete = { fg = undefined, bg = none },
  HopNextKey = { fg = accent, bg = none },
  HopNextKey1 = { fg = accent, bg = none },
  HopNextKey2 = { fg = accent, bg = none },
  HopUnmatched = { fg = text_medium, bg = none },
  htmlTag = { fg = text_medium, bg = none },
  htmlTagName = { fg = accent, bg = none },
  IblIndent = { fg = text_dark, bg = none },
  IblScope = { fg = undefined, bg = none },
  IblWhitespace = { fg = undefined, bg = none },
  Identifier = { fg = text_light, bg = none },
  lCursor = { fg = undefined, bg = none },
  LongLineWarning = { fg = warning, bg = none },
  MatchParen = { fg = none, bg = none, reverse = true },
  Normal = { fg = text_light, bg = background },
  NvimInternalError = { fg = error, bg = none },
  Operator = { fg = text_medium, bg = none },
  PreProc = { fg = text_light, bg = none },
  qfLineNr = { fg = undefined, bg = none },
  RedrawDebugClear = { fg = undefined, bg = none },
  RedrawDebugComposed = { fg = undefined, bg = none },
  RedrawDebugNormal = { fg = undefined, bg = none },
  RedrawDebugRecompose = { fg = undefined, bg = none },
  Special = { fg = text_medium, bg = none },
  Statement = { fg = text_light, bg = none },
  String = { fg = accent, bg = none },
  Structure = { fg = text_medium, bg = none },
  Todo = { fg = undefined, bg = none },
  Type = { fg = accent, bg = none },
  Underlined = { fg = undefined, bg = none },
  WinBar = { fg = undefined, bg = none },


  fugitiveHash = { fg = text_medium, bg = none },
  fugitiveUnstagedSection = { fg = text_light, bg = none },
  fugitiveStagedSection = { fg = text_medium, bg = none },
  fugitiveUnstagedModifier = { fg = text_medium, bg = none },
  fugitiveHelpTag = { fg = text_medium, bg = none },
  fugitiveUnstagedHeading = { fg = text_medium, bg = none },
  fugitiveSymbolicRef = { fg = text_light, bg = none },
  fugitiveHeader = { fg = text_medium, bg = none },
  fugitiveStagedHeading = { fg = text_medium, bg = none },
  ['@variable'] = { fg = text_light, bg = none },
  ['@keyword.tsx'] = { fg = text_medium, bg = none },
  ['@keyword.import.tsx'] = { fg = text_medium, bg = none },
  ['@keyword.return.tsx'] = { fg = accent, bg = none },
  ['@keyword.conditional.tsx'] = { fg = text_medium, bg = none },
  ['@keyword.coroutine.tsx'] = { fg = accent, bg = none },
  ['@punctuation.bracket.tsx'] = { fg = text_medium, bg = none },
  ['@punctuation.delimiter.tsx'] = { fg = text_medium, bg = none },
  ['@punctuation.special.javascript'] = { fg = text_medium, bg = none },
  ['@tag.builtin.tsx'] = { fg = accent, bg = none },
  ['@tag.tsx'] = { fg = accent, bg = none },
  ['@tag.attribute.tsx'] = { fg = text_medium, bg = none },
  ['@type.builtin.tsx'] = { fg = accent, bg = none },
  tsxTagName = { fg = accent, bg = none },
  tsxAttrib = { fg = text_medium, bg = none },
  LspSignatureActiveParameter = { fg = accent, bg = text_light },
  EyelinerPrimary = { fg = accent, bg = none },
  EyelinerSecondary = { fg = accent, bg = none },
  EyelinerDimmed = { fg = text_medium, bg = none },
  TelescopeBorder = { fg = text_medium, bg = none },
  TelescopeMatching = { fg = text_light, bg = accent },
  gitcommitOverflow = { fg = text_light, bg = none },
  NvimInvalidSpacing = { link = 'ErrorMsg' },
  ['@tag.delimiter.tsx'] = { link = 'htmlTag' },
  ['@lsp.type.interface.typescriptreact'] = { link = 'Type' },
  TelescopeSelection = { link = 'CursorLine' },
  TelescopeMultiIcon = { link = 'TelescopeMultiSelection' },
  gitcommitSummary = { link = 'Normal' },
  gitcommitFirstLine = { link = 'Normal' },
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
