return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },
    { 'onsails/lspkind.nvim' }
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()

    require("luasnip/loaders/from_vscode").lazy_load()
    local lspkind = require('lspkind')

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,noinsert',
        scrollbar = false,
      },
      -- formatting = lsp_zero.cmp_format({ details = true }),
      formatting = {
        format = lspkind.cmp_format(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        -- { name = 'rg' }
      })
    })
  end
}
