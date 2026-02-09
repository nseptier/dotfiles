return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local imap_expr = function(lhs, rhs)
      vim.keymap.set('i', lhs, rhs, { expr = true })
    end

    imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
    imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

    -- require('mini.pairs').setup()
    require('mini.ai').setup()
    require('mini.bracketed').setup({
      diagnostic = { suffix = 'd', options = { float = false } },
    })
    require('mini.bufremove').setup()
    require('mini.comment').setup()
    -- require('mini.completion').setup()
    require('mini.cursorword').setup({ delay = 500 })
    require('mini.hipatterns').setup()
    require('mini.icons').setup()
    require('mini.indentscope').setup({
      draw = {
        animation = function()
          return 0
        end
      },
      options = {
        indent_at_cursor = false,
      },
    })
    require('mini.jump').setup({
      delay = {
        highlight = 50,
        idle_stop = 5000,
      }
    })
    require('mini.misc').setup()
    require('mini.notify').setup({
      content = {
        format = function(notif)
          return notif.msg
        end
      },
      window = {
        config = {
          title = '',
        },
        winblend = 0,
      }
    })
    require('mini.operators').setup()
    require('mini.sessions').setup({
      autoread = true,
    })
    require('mini.snippets').setup()
    require('mini.splitjoin').setup()
    require('mini.surround').setup()
    require('mini.test').setup()


    vim.api.nvim_create_autocmd('Filetype', {
      pattern = 'lazy',
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end
}
