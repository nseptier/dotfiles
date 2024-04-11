return {
  'rbong/vim-flog',
  init = function()
    -- keymaps
    vim.keymap.set('n', '<leader>gg', ':Flog<CR>')

    -- options
    vim.g.flog_permanent_default_opts = {
      format = '[%h] %ad {%an}%d %s',
      date = 'short',
    }

    -- clear specific highlights
    vim.api.nvim_create_autocmd(
      'TextChanged',
      {
        command = 'syn clear flogMerge1Horizontal'
            .. ' flogMerge2Horizontal'
            .. ' flogMerge3Horizontal'
            .. ' flogMerge4Horizontal'
            .. ' flogMerge5Horizontal'
            .. ' flogMerge6Horizontal'
            .. ' flogMerge7Horizontal'
            .. ' flogMerge8Horizontal'
            .. ' flogMerge9Horizontal',
        pattern = 'flog-*'
      })

    -- branches colorscheme
    local rainbow = {
      '#8187c7',
      '#5daad8',
      '#a5de94',
      '#d7e586',
      '#feea80',
      '#fec979',
      '#fea671',
      '#fb8066',
      '#f65356',
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
          for index = 1, 9 do
            local opts = { link = 'flogBranch' .. index }

            vim.api.nvim_set_hl(0, 'flogBranch' .. index, { fg = rainbow[index] })
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
