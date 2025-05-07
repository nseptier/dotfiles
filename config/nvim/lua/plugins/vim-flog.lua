return {
  'rbong/vim-flog',
  init = function()
    -- keymaps
    vim.keymap.set('n', '<leader>gt', ':botright vert Flogsplit -auto-update<CR>')

    -- options
    local branch_colors = {
      '#d9ed92',
      '#b5e48c',
      '#99d98c',
      '#76c893',
      '#52b69a',
      '#34a0a4',
      '#168aad',
      '#1a759f',
      '#1e6091',
      '#1a759f',
      '#168aad',
      '#34a0a4',
      '#52b69a',
      '#76c893',
      '#99d98c',
      '#b5e48c',
    }

    vim.g.flog_enable_dynamic_branch_hl = false
    vim.g.flog_enable_dynamic_commit_hl = true
    vim.g.flog_enable_extended_chars = true
    vim.g.flog_num_branch_colors = #branch_colors
    vim.g.flog_permanent_default_opts = {
      format = '%ad %h %an%d %s',
      date = 'short',
    }

    local branch_highlights = {
      'AfterCommit',
      'AfterMerge',
      'ComplexMerge',
      'ComplexMergeStart',
      'MergeStart',
    }

    vim.api.nvim_create_autocmd(
      'ColorScheme',
      {
        callback = function()
          for index = 1, vim.g.flog_num_branch_colors do
            local opts = { link = 'flogBranch' .. index }

            vim.api.nvim_set_hl(0, 'flogBranch' .. index, { fg = branch_colors[index] })
            for i, name in ipairs(branch_highlights) do
              vim.api.nvim_set_hl(0, 'flogBranch' .. index .. name, opts)
            end
            for i = index, 9 do
              vim.api.nvim_set_hl(0, 'flogMerge' .. i .. 'branch' .. index, opts)
              vim.api.nvim_set_hl(0, 'flogMerge' .. i .. 'branchEnd' .. index, opts)
            end
          end
        end,
      })
  end
}
