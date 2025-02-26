return {
  'AlexvZyl/nordic.nvim',
  'arithran/vim-delete-hidden-buffers',
  'christoomey/vim-tmux-navigator',
  'desdic/telescope-rooter.nvim',
  'gerw/vim-HiLinkTrace',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'lukas-reineke/cmp-rg',
  'lukas-reineke/lsp-format.nvim',
  'machakann/vim-sandwich',
  'michaeljsmith/vim-indent-object',
  'moll/vim-bbye',
  'preservim/vimux',
  'prettier/vim-prettier', -- { 'do': 'yarn install --frozen-lockfile --production' }
  'reisub0/hot-reload.vim',
  'saadparwaiz1/cmp_luasnip',
  'stevearc/dressing.nvim',
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  {
    'tpope/vim-fugitive',

    init = function()
      -- keymaps
      vim.keymap.set('n', '<leader>gg', ':G<CR>')
    end
  },
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'vifm/vifm.vim',
  'vim-test/vim-test',
  { dir = '~/.config/nvim/lua/plugins/ipsum' },
}
