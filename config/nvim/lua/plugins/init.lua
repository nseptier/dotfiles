return {
  'arithran/vim-delete-hidden-buffers',
  'christoomey/vim-tmux-navigator',
  'gerw/vim-HiLinkTrace',
  'haya14busa/incsearch.vim',
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  'lukas-reineke/cmp-rg',
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
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_enable = false
    },
    config = function(_, opts)
      require 'lsp_signature'.setup(opts)
    end
  },
  {
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
  },
  'reisub0/hot-reload.vim',
  'saadparwaiz1/cmp_luasnip',
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'vifm/vifm.vim',
  'vim-test/vim-test',
  'wavded/vim-stylus',
}
