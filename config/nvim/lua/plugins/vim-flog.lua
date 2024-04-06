return {
  'rbong/vim-flog',
  init = function()
    vim.keymap.set('n', 'fc', ':Flog<CR>')
    vim.g.flog_permanent_default_opts = {
      format = '[%h] %ad {%an}%d %s',
      date = 'short',
    }

    vim.api.nvim_create_autocmd("Filetype", {
      command = 'syn clear flogMerge1Horizontal'
          .. ' flogMerge2Horizontal'
          .. ' flogMerge3Horizontal'
          .. ' flogMerge4Horizontal'
          .. ' flogMerge5Horizontal'
          .. ' flogMerge6Horizontal'
          .. ' flogMerge7Horizontal'
          .. ' flogMerge8Horizontal'
          .. ' flogMerge9Horizontal',
      pattern = 'floggraph'
    })
  end
}
