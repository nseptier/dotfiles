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
  local filename = '%#WinbarFolder#'
      .. vim.fn.expand('%:p:h:t')
      .. '/'
      .. '%#WinbarFilename#'
      .. '%t'

  return '%= %#WinbarSeparator#' .. filename .. '%M%#WinbarSeparator# '
end

M.renderStatusLine = function(is_inactive)
  local lsp_diagnostic = vim.b.lsp_diagnostic or ''
  local mode = vim.b.mode or M.get_mode()

  local string = ''
      .. '%#StatuslineStart#'
      .. ''
      .. (is_inactive and '%#StatuslineFolderInactive#' or '%#StatuslineFolder#')
      .. '  ' -- ''
      .. vim.fn.expand('%:p:h:t')
      .. '/'
      .. (is_inactive and '%#StatuslineFilenameInactive#' or '%#StatuslineFilename#')
      .. '%t'
      .. '%M'
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
        .. '%#StatuslineFileInfoSeparator#'
        .. ''
        .. '%#StatuslineFileInfo#'
        .. ' ' .. vim.bo.fileformat .. ' '
        .. '%#StatuslineFileInfoSeparator#'
        .. ''
        .. '%#StatuslineFileInfo#'
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
        .. ' ' .. mode
        .. '%#StatuslineStart#'
        .. ''
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

M.setup = function()
  local e_group = vim.api.nvim_create_augroup('statusline.events', { clear = true })
  vim.api.nvim_create_autocmd(
    {
      'DiagnosticChanged',
      'ModeChanged',
      'TextChanged',
      'TextChangedI',
      'BufRead',
      'WinEnter',
      -- 'WinLeave',
    },
    {
      callback = function(args)
        local ft = vim.api.nvim_get_option_value('filetype', { buf = args.buf })

        if args.event == 'DiagnosticChanged' then vim.b.lsp_diagnostic = M.get_lsp_diagnostic() end
        if args.event == 'ModeChanged' then vim.b.mode = M.get_mode() end

        vim.o.statusline = M.renderStatusLine()

        local winid = vim.api.nvim_get_current_win()

        vim.tbl_map(function(winid)
          local bufnr = vim.api.nvim_win_get_buf(winid)

          if (bufnr == args.buf and ft ~= 'TelescopePrompt' and ft ~= '') then
            vim.schedule(function()
              -- vim.wo[winid][0].statusline = M.renderStatusLine()
              if vim.api.nvim_win_is_valid(winid) then
                vim.wo[winid][0].winbar = M.renderWinBar()
              end
            end)
          end
        end, vim.api.nvim_tabpage_list_wins(0))
      end,
      group = e_group,
    })
end

return M
