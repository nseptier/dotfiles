local M = {}

M.separators = {
  component = '',
  section = { left = '', right = '' },
}

M.HighlightGroups = {
  [vim.diagnostic.severity.ERROR] = 'StatuslineError',
  [vim.diagnostic.severity.WARN] = 'StatuslineWarn',
  [vim.diagnostic.severity.INFO] = 'StatuslineInfo',
  [vim.diagnostic.severity.HINT] = 'StatuslineHint',
}

M.Mode = {
  ['n']     = 'NORMAL',
  ['no']    = 'O-PENDING',
  ['nov']   = 'O-PENDING',
  ['noV']   = 'O-PENDING',
  ['no\22'] = 'O-PENDING',
  ['niI']   = 'NORMAL',
  ['niR']   = 'NORMAL',
  ['niV']   = 'NORMAL',
  ['nt']    = 'NORMAL',
  ['ntT']   = 'NORMAL',
  ['v']     = 'VISUAL',
  ['vs']    = 'VISUAL',
  ['V']     = 'V-LINE',
  ['Vs']    = 'V-LINE',
  ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  ['s']     = 'SELECT',
  ['S']     = 'S-LINE',
  ['\19']   = 'S-BLOCK',
  ['i']     = 'INSERT',
  ['ic']    = 'INSERT',
  ['ix']    = 'INSERT',
  ['R']     = 'REPLACE',
  ['Rc']    = 'REPLACE',
  ['Rx']    = 'REPLACE',
  ['Rv']    = 'V-REPLACE',
  ['Rvc']   = 'V-REPLACE',
  ['Rvx']   = 'V-REPLACE',
  ['c']     = 'COMMAND',
  ['cv']    = 'EX',
  ['ce']    = 'EX',
  ['r']     = 'REPLACE',
  ['rm']    = 'MORE',
  ['r?']    = 'CONFIRM',
  ['!']     = 'SHELL',
  ['t']     = 'TERMINAL',
}

M.active = function()
  local git_branch = vim.b.git_branch or ''
  local lsp_diagnostic = vim.b.lsp_diagnostic or ''

  return ''
    .. '%#StatuslineFolder#'
    .. '   '
    .. vim.fn.expand('%:p:h:t')
    .. '/'
    .. '%#StatuslineFilename#'
    .. '%t'
    .. ' '
    .. '%#StatuslineFilenameSeparator#'
    .. ''
    .. ' ' .. lsp_diagnostic .. ' '
    .. '%#StatuslineDiagnosticSeparator#'
    .. (lsp_diagnostic ~= '' and '' or '')
    .. '%#StatuslineReset#'

    .. '%='

    -- .. '%#StatuslineFileInfoSeparator#'
    -- .. ''
    .. '%#StatuslineFileInfo#'
    .. ' ' .. vim.bo.filetype .. ' '
    .. '│'
    .. ' ' .. vim.bo.fileformat .. ' '
    .. '│'
    .. ' ' .. vim.bo.fileencoding .. ' '

    .. '%#StatuslineLocationSeparator#'
    .. ''
    .. '%#StatuslineLocation#'
    .. ' '
    .. '%#StatuslineLocationCurrent#'
    .. ' %l'
    .. '%#StatuslineLocation#'
    .. '/%L '
    .. ' '
    .. '%#StatuslineLocationCurrent#'
    .. ' %2v'
    .. '%#StatuslineLocation#'
    .. '/%-2{virtcol("$") - 1} '

    .. '%#StatuslineModeSeparator#'
    .. ''
    .. '%#StatuslineMode#'
    .. ' ' .. M.Mode[vim.fn.mode()] .. ' '
end

-- M.get_git_branch = function()
--   return vim.fn.system("git branch --show-current"):gsub('[\n\r]', '') or ''
-- end

M.get_lsp_diagnostic = function()
  local diagnostic = vim.diagnostic.count(0)
  local config = vim.diagnostic.config()
  local hl = M.HighlightGroups
  local icons = config.signs.text
  local t = {}

  if diagnostic == nil then
    return ''
  end

  for severity, count in pairs(diagnostic) do
    table.insert(t, string.format('%%#%s#%s %d', hl[severity], icons[severity], count))
  end

  return table.concat(t, ' ') or ''
end

M.setup = function()
  vim.api.nvim_create_autocmd("DiagnosticChanged", {
    callback = function()
      vim.b.lsp_diagnostic = M.get_lsp_diagnostic()
      vim.opt.statusline = M.active()
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
    callback = function()
      -- vim.b.git_branch = M.get_git_branch()
      vim.opt.statusline = M.active()
    end,
  })

  -- vim.opt.statusline = M.active()
end

return M
