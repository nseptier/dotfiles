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
  ['!']     = 'shell',
  ['R']     = 'replace',
  ['Rc']    = 'replace',
  ['Rv']    = 'v-replace',
  ['Rvc']   = 'v-replace',
  ['Rvx']   = 'v-replace',
  ['Rx']    = 'replace',
  ['S']     = 's-line',
  ['V']     = 'v-line',
  ['Vs']    = 'v-line',
  ['\19']   = 's-block',
  ['\22']   = 'v-block',
  ['\22s']  = 'v-block',
  ['c']     = 'command',
  ['ce']    = 'ex',
  ['cv']    = 'ex',
  ['i']     = 'insert',
  ['ic']    = 'insert',
  ['ix']    = 'insert',
  ['n']     = 'normal',
  ['niI']   = 'normal',
  ['niR']   = 'normal',
  ['niV']   = 'normal',
  ['no']    = 'o-pending',
  ['noV']   = 'o-pending',
  ['no\22'] = 'o-pending',
  ['nov']   = 'o-pending',
  ['nt']    = 'normal',
  ['ntT']   = 'normal',
  ['r']     = 'replace',
  ['r?']    = 'confirm',
  ['rm']    = 'more',
  ['s']     = 'select',
  ['t']     = 'terminal',
  ['v']     = 'visual',
  ['vs']    = 'visual',
}

M.ModeHighlights = {
  ['VISUAL'] = '_visual',
  ['V-BLOCK'] = '_visual',
  ['V-LINE'] = '_visual',
  ['SELECT'] = '_visual',
  ['S-LINE'] = '_visual',
  ['S-BLOCK'] = '_visual',
  ['REPLACE'] = '_replace',
  ['V-REPLACE'] = '_replace',
  ['INSERT'] = '_insert',
  ['COMMAND'] = '_command',
  ['EX'] = '_command',
  ['MORE'] = '_command',
  ['CONFIRM'] = '_command',
  ['TERMINAL'] = '_terminal',
}

M.renderWinBar = function()
  local f = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
  local c = vim.fs.normalize(vim.fn.getcwd()) .. '/'
  local filename = f:gsub(c:gsub('%-', '%%-'), '')

  return '%= %#WinbarSeparator#%#WinbarPath# ' .. filename .. '  %M%#WinbarSeparator# '
end

M.renderStatusLine = function(is_inactive)
  local lsp_diagnostic = vim.b.lsp_diagnostic or ''
  local mode = vim.b.mode or M.get_mode()
  local modified = vim.bo.modified and ' *' or ''

  local string = ''
      .. (is_inactive and '%#StatuslineFolderInactive#' or '%#StatuslineFolder#')
      .. '   '
      .. vim.fn.expand('%:p:h:t')
      .. '/'
      .. (is_inactive and '%#StatuslineFilenameInactive#' or '%#StatuslineFilename#')
      .. '%t'
      .. modified
      .. ' '
      .. (lsp_diagnostic ~= ''
        and (is_inactive and '%#StatuslineFilenameInactiveSeparator#' or '%#StatuslineFilenameSeparator#')
        or (is_inactive and '%#StatuslineFilenameInactiveNoDiagSeparator#' or '%#StatuslineFilenameNoDiagSeparator#')
      )
      .. ''
      .. (lsp_diagnostic ~= '' and (' ' .. lsp_diagnostic .. ' ') or '')
      .. (is_inactive and '%#StatuslineDiagnosticInactiveSeparator#' or '%#StatuslineDiagnosticSeparator#')
      .. (lsp_diagnostic ~= '' and '' or '')

      .. '%#StatuslineReset#'
      .. '%='

  if not is_inactive then
    string = string
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
        .. '%l'
        .. '%#StatuslineLocation#'
        .. '/%L '
        .. ' '
        .. '%#StatuslineLocationCurrent#'
        .. '%2v'
        .. '%#StatuslineLocation#'
        .. '/%-2{virtcol("$") - 1} '

        .. '%#StatuslineModeSeparator#'
        .. ''
        .. '%#StatuslineMode#'
        .. ' ' .. mode .. ' '
  end

  return string
end

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

M.get_mode = function()
  return M.Mode[vim.api.nvim_get_mode().mode]
end

M.get_modified = function(bufnr)
  return vim.api.nvim_get_option_value('modified', { buf = 0 })
end

M.setup = function()
  local e_group = vim.api.nvim_create_augroup('statusline.events', { clear = true })
  vim.api.nvim_create_autocmd(
    {
      'BufModifiedSet',
      'DiagnosticChanged',
      'ModeChanged',
      'TextChanged',
      'TextChangedI',
      'BufRead',
      -- 'WinLeave',
    },
    {
      callback = function(args)
        local ft = vim.api.nvim_get_option_value('filetype', { buf = args.buf })

        if args.event == 'DiagnosticChanged' then vim.b.lsp_diagnostic = M.get_lsp_diagnostic() end
        if args.event == 'ModeChanged' then vim.b.mode = M.get_mode() end
        if args.event == 'BufModifiedSet' then vim.b.modified = M.get_modified() end

        vim.o.statusline = M.renderStatusLine()

        vim.cmd('silent! lua vim.wo.winbar = "' .. M.renderWinBar() .. '"')
      end,
      group = e_group,
    })
end

return M
