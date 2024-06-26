return {
  'arithran/vim-delete-hidden-buffers',
  'christoomey/vim-tmux-navigator',
  'gerw/vim-HiLinkTrace',
  'lukas-reineke/cmp-rg',
  'machakann/vim-sandwich',
  'michaeljsmith/vim-indent-object',
  'moll/vim-bbye',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup {
      }
    end
  },
  'preservim/vimux',
  'reisub0/hot-reload.vim',
  'saadparwaiz1/cmp_luasnip',
  'stevearc/dressing.nvim',
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'vifm/vifm.vim',
  'vim-test/vim-test',
  { dir = '~/.config/nvim/lua/plugins/ipsum' },
}
