return {
  'arithran/vim-delete-hidden-buffers',
  'christoomey/vim-tmux-navigator',
  'gerw/vim-HiLinkTrace',
  'haya14busa/incsearch.vim',
  'machakann/vim-sandwich',
  'michaeljsmith/vim-indent-object',
  'moll/vim-bbye',
  'preservim/vimux',
  {
    'prettier/vim-prettier',
    init = function()
      vim.g['prettier#autoformat'] = 1
      vim.g['prettier#autoformat_require_pragma'] = 0
    end
  },
  'reisub0/hot-reload.vim',
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-unimpaired',
  'vifm/vifm.vim',
  'vim-test/vim-test',
  'wavded/vim-stylus',
}
