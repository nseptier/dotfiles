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

M.active = function()
  local git_branch = vim.b.git_branch or ''
  local lsp_diagnostic = vim.b.lsp_diagnostic or ''

  return '' -- git_branch
      -- .. ' >>> '
      .. '%#StatuslineFilename#'
      .. '   ' .. '%f' .. ' '
      .. '%#StatuslineFilenameSeparator#'
      .. ''
      .. ' ' .. lsp_diagnostic .. ' '
      .. '%#StatuslineDiagnosticSeparator#'
      .. (lsp_diagnostic ~= '' and '' or '')
      .. '%#StatuslineReset#'
  -- .. ''
end

-- M.get_git_branch = function()
--   return vim.fn.system("git branch --show-current"):gsub('[\n\r]', '') or ''
-- end

-- M.get_filename = function()
--   return vim.fs.normalize(vim.api.nvim_buf_get_name(0))
-- end
--
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
