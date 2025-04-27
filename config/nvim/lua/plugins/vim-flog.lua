return {
  'rbong/vim-flog',
  init = function()
    -- keymaps
    vim.keymap.set('n', '<leader>gt', ':botright vert Flogsplit -auto-update<CR>')

    -- options
    vim.g.flog_enable_dynamic_branch_hl = false
    vim.g.flog_enable_dynamic_commit_hl = true
    -- vim.g.flog_enable_extended_chars = true
    vim.g.flog_permanent_default_opts = {
      format = '%ad %h %an%d %s',
      date = 'short',
    }

    -- branches colorscheme
    local rainbow = {
      '#d9ed92',
      '#b5e48c',
      '#99d98c',
      '#76c893',
      '#52b69a',
      '#34a0a4',
      '#168aad',
      '#1a759f',
      '#1e6091',
      '#184e77',

      -- '#8187c7',
      -- '#5daad8',
      -- '#a5de94',
      -- '#d7e586',
      -- '#feea80',
      -- '#fec979',
      -- '#fea671',
      -- '#fb8066',
      -- '#f65356',
    }

    local branch_highlights = {
      'AfterCommit',
      'AfterMerge',
      -- 'Commit',
      'ComplexMerge',
      'ComplexMergeStart',
      'MergeStart',
    }

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = { 'flog-*' },
      callback = function()
        vim.opt.shellcmdflag = ''
      end,
    })

    vim.api.nvim_create_autocmd('BufLeave', {
      pattern = { 'flog-*' },
      callback = function()
        vim.opt.shellcmdflag = '-c'
      end,
    })

    vim.api.nvim_create_autocmd(
      'ColorScheme',
      {
        callback = function()
          for index = 0, 9 do
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
