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
  diffFile = { fg = accent },
  diffIndexLine = { fg = accent_2 },
  diffNewFile = { fg = accent_3 },
  diffOldFile = { fg = accent_3 },

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
  ['@constant.builtin.typescript'] = { fg = accent_2 },                          --
  ['@constructor.lua'] = { fg = punctuation },
  ['@function.method.call.tsx'] = { link = '@function.call.typescript' },        --
  ['@function.method.call.typescript'] = { link = '@function.call.typescript' }, --
  ['@function.call.typescript'] = { fg = accent_2 },                             --
  ['@keyword.conditional.tsx'] = { link = '@keyword.conditional.typescript' },
  ['@keyword.conditional.typescript'] = { fg = accent_3 },
  ['@keyword.coroutine.tsx'] = { link = '@keyword.coroutine.typescript' },
  ['@keyword.coroutine.typescript'] = { fg = accent_2 },
  ['@keyword.function.tsx'] = { link = '@keyword.function.typescript' },
  ['@keyword.function.typescript'] = { fg = accent_2 },
  ['@keyword.import.tsx'] = { link = '@keyword.import.typescript' },
  ['@keyword.import.typescript'] = { fg = text_dark },
  ['@keyword.lua'] = { fg = text_medium },
  ['@keyword.operator.tsx'] = { link = '@keyword.operator.typescript' },
  ['@keyword.operator.typescript'] = { fg = text_medium },
  ['@keyword.return.tsx'] = { link = '@keyword.return.typescript' },
  ['@keyword.return.typescript'] = { fg = accent_2 },
  ['@keyword.tsx'] = { link = '@keyword.typescript' },
  ['@keyword.typescript'] = { fg = text_dark },
  ['@keyword.type.typescript'] = { link = '@keyword.typescript' },
  ['@lsp.type.class.typescriptreact'] = { fg = text_light },
  ['@lsp.type.class.vue'] = { link = '@lsp.typemod.property.declaration.typescriptreact' },
  ['@lsp.type.function.typescriptreact'] = { fg = accent_3 },          --
  ['@lsp.type.function.vue'] = { link = '@function.call.typescript' }, --
  ['@lsp.type.interface.typescriptreact'] = { link = 'Type' },
  ['@lsp.type.type.typescriptreact'] = { fg = type },
  ['@lsp.type.typeParameter.typescriptreact'] = { link = '@lsp.type.interface.typescriptreact' },
  ['@lsp.typemod.class.defaultLibrary.typescriptreact'] = { fg = text_medium },
  ['@lsp.typemod.property.declaration.typescriptreact'] = { fg = text_lighter },
  ['@lsp.typemod.variable.defaultLibrary.typescriptreact'] = { fg = text_dark },
  ['@punctuation.bracket.lua'] = { fg = punctuation },
  ['@punctuation.bracket.tsx'] = { link = '@punctuation.bracket.typescript' },
  ['@punctuation.bracket.typescript'] = { fg = punctuation },
  ['@punctuation.delimiter.tsx'] = { link = '@punctuation.delimiter.typescript' },
  ['@punctuation.delimiter.typescript'] = { fg = punctuation },
  ['@punctuation.special.javascript'] = { fg = punctuation },
  ['@punctuation.special.tsx'] = { link = '@punctuation.special.typescript' },
  ['@punctuation.special.vue'] = { link = '@punctuation.special.typescript' },
  ['@punctuation.special.typescript'] = { fg = punctuation },
  ['@string.escape.tsx'] = { link = '@string.escape.typescript' },
  ['@string.escape.typescript'] = { fg = text_light },
  ['@tag.attribute.tsx'] = { link = '@tag.attribute.typescript' },
  ['@tag.attribute.vue'] = { link = '@tag.attribute.typescript' },
  ['@variable.member.vue'] = { link = '@tag.attribute.typescript' },
  ['@function.method.vue'] = { link = '@tag.attribute.typescript' },
  ['@tag.attribute.typescript'] = { fg = text_medium },
  ['@tag.builtin.tsx'] = { link = '@tag.builtin.typescript' },
  ['@tag.builtin.vueescript'] = { fg = accent },
  ['@tag.delimiter.tsx'] = { link = '@tag.delimiter.typescript' },
  ['@tag.delimiter.typescript'] = { link = 'htmlTag' },

  ['@tag.delimiter.vue'] = { link = '@tag.delimiter.typescript' },
  ['@tag.tsx'] = { link = '@tag.typescript' },
  ['@tag.vue'] = { link = '@tag.typescript' },
  ['@tag.typescript'] = { fg = accent },
  ['@type.builtin.tsx'] = { link = '@type.builtin.typescript' },
  ['@type.builtin.typescript'] = { fg = secondary_2 },
  ['@type.typescript'] = { link = '@variable' },
  ['@type.tsx'] = { link = '@variable' },
  ['@variable'] = { fg = text_light },
  ActiveTab = { fg = background, bg = text_dark },
  BlameLineNvim = { fg = line_nr },
  Comment = { fg = comment, standout = false },
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
  EyelinerDimmed = { fg = text_dark },
  EyelinerPrimary = { fg = operator },
  EyelinerSecondary = { fg = accent },
  floatBorder = { fg = text_medium },
  FloatShadow = { fg = undefined, bg = undefined, blend = 90 },
  FloatShadowThrough = { fg = undefined, bg = background, blend = 90 },
  fugitiveCount = { fg = text_medium },
  fugitiveHash = { fg = accent_2 },
  fugitiveHeader = { fg = text_dark },
  fugitiveHeading = { fg = text_dark },
  fugitiveHelpTag = { fg = accent_3 },
  fugitiveHunk = { fg = text_medium },
  fugitiveStagedHeading = { fg = text_dark },
  fugitiveStagedModifier = { fg = secondary_2 },
  fugitiveStagedSection = { fg = add },
  fugitiveSymbolicRef = { fg = text_light },
  fugitiveUnstagedHeading = { fg = text_dark },
  fugitiveUnstagedModifier = { fg = text_medium },
  fugitiveUnstagedSection = { fg = text_light },
  fugitiveUntrackedHeading = { fg = text_dark },
  fugitiveUntrackedModifier = { fg = text_dark },
  fugitiveUntrackedSection = { fg = text_medium },
  Function = { fg = text_light },
  gitcommitFirstLine = { link = 'Normal' },
  gitcommitOverflow = { fg = text_light },
  gitcommitSummary = { link = 'Normal' },
  HopNextKey = { fg = operator },
  HopNextKey1 = { fg = accent },
  HopNextKey2 = { fg = accent_2 },
  HopUnmatched = { fg = text_dark },
  htmlTag = { fg = punctuation },
  htmlTagName = { fg = accent },
  IblIndent = { fg = background_light, default = true },
  IblScope = { fg = hint },
  IblScopeHighlight = { bg = background_light, standout = false, underline = false },
  IblWhitespace = { fg = none },
  Identifier = { fg = text_light },
  jsonKeywordMatch = { fg = punctuation },
  lCursor = { fg = undefined },
  LongLineWarning = { fg = warning },
  LspSignatureActiveParameter = { fg = accent, bg = text_light },
  MatchParen = { fg = none, reverse = true },
  Normal = { fg = text_light },
  NvimInternalError = { fg = error },
  NvimInvalidSpacing = { link = 'ErrorMsg' },
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
  TelescopeBorder = { fg = text_dark },
  TelescopeMatching = { link = 'Search' },
  TelescopeMultiIcon = { link = 'TelescopeMultiSelection' },
  TelescopeSelection = { link = 'CursorLine' },
  Todo = { fg = undefined },
  tsxAttrib = { fg = text_medium },
  tsxTagName = { fg = accent },
  Type = { fg = type },
  Underlined = { fg = accent_3 },
  WinBar = { fg = undefined },

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
