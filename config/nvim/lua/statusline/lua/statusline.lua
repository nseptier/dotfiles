local M = {}

M.separators = {
  component = '',
  section = { left = '', right = '' },
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

M.renderWinBar = function(is_inactive, winid, bufnr)
  local lsp_diagnostic = vim.w[winid].lsp_diagnostic or ''
  local path = vim.split(vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr)), '/')
  local folder = path[#path - 1] or ''

  return '%='
      .. (is_inactive and '%#StatuslineInactiveDiagnosticSeparator#' or '%#StatuslineDiagnosticSeparator#')
      .. (lsp_diagnostic ~= '' and '' or '')
      .. (is_inactive and '%#StatuslineInactiveDiagnostic#' or '%#StatuslineDiagnostic#')
      .. (lsp_diagnostic ~= '' and ' ' or '')
      .. (lsp_diagnostic ~= '' and lsp_diagnostic or '')
      .. (lsp_diagnostic ~= '' and ' ' or '')

      .. (lsp_diagnostic ~= ''
        and (is_inactive and '%#StatuslineInactiveFilenameSeparator#' or '%#StatuslineFilenameSeparator#')
        or (is_inactive and '%#StatuslineInactiveFilenameNoDiagSeparator#' or '%#StatuslineFilenameNoDiagSeparator#')
      )
      .. ''
      .. (is_inactive and '%#StatuslineInactiveFolder#' or '%#StatuslineFolder#')
      .. '   '
      .. folder
      .. '/'
      .. (is_inactive and '%#StatuslineInactiveFilename#' or '%#StatuslineFilename#')
      .. '%t'
      .. '%M'
      .. ' '
end

M.renderStatusLine = function(is_inactive, winid, bufnr)
  local mode = vim.b[bufnr].mode or M.get_mode()

  local string = ''
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
    .. ' '
    .. ''
    .. '%#StatuslineLocationCurrent#'
    .. '%l'
    .. '%#StatuslineLocation#'
    .. '/%L '
    .. ''
    .. '%#StatuslineLocationCurrent#'
    .. '%v'
    .. '%#StatuslineLocation#'
    .. '/%-2{virtcol("$") - 1}'

    .. '%#StatuslineModeSeparator#'
    .. ''
    .. '%#StatuslineMode#'
    .. ' ' .. mode .. ' '
  end

  return string
end

M.get_lsp_diagnostic = function(bufnr, is_inactive)
  local diagnostic = vim.diagnostic.count(bufnr)
  local config = vim.diagnostic.config()
  local icons = config.signs.text
  local hl = {
    [vim.diagnostic.severity.ERROR] = is_inactive and 'StatuslineInactiveDiagnosticError' or 'StatuslineDiagnosticError',
    [vim.diagnostic.severity.WARN] = is_inactive and 'StatuslineInactiveDiagnosticWarn' or 'StatuslineDiagnosticWarn',
    [vim.diagnostic.severity.INFO] = is_inactive and 'StatuslineInactiveDiagnosticInfo' or 'StatuslineDiagnosticInfo',
    [vim.diagnostic.severity.HINT] = is_inactive and 'StatuslineInactiveDiagnosticHint' or 'StatuslineDiagnosticHint',
  }
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
      'WinLeave',
    },
    {
      callback = function(args)
        local ft = vim.api.nvim_get_option_value('filetype', { buf = args.buf })

        vim.tbl_map(function(winid)
          local bufnr = vim.api.nvim_win_get_buf(winid)
          local blacklist = { fugitive = true, lazy = true, TelescopePrompt = true }

          vim.schedule(function()
            if bufnr == args.buf and vim.api.nvim_win_is_valid(winid) then
              if not blacklist[ft] and ft ~= '' then
                local is_inactive = winid ~= vim.fn.win_getid()

                vim.w[winid].lsp_diagnostic = M.get_lsp_diagnostic(bufnr, is_inactive)
                vim.wo[winid][0].winbar = M.renderWinBar(is_inactive, winid, bufnr)
              else
                vim.wo[winid].winbar = ''
              end
            end
          end)
        end, vim.api.nvim_tabpage_list_wins(0))

        vim.b[args.buf].mode = M.get_mode()
        vim.o.statusline = M.renderStatusLine(false, vim.api.nvim_get_current_win(), args.buf)
      end,
      group = e_group,
    })
end

return M
