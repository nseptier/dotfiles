return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- Text editing
    require('mini.ai').setup()
    require('mini.comment').setup()
    require('mini.completion').setup()
    require('mini.pairs').setup()
    require('mini.snippets').setup()
    require('mini.splitjoin').setup()
    require('mini.surround').setup()

    -- General workflow
    require('mini.bracketed').setup()
    require('mini.bufremove').setup()
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    require('mini.misc').setup()
    require('mini.sessions').setup({
      autoread = true,
    })

    -- Appearance
    require('mini.colors').setup()
    require('mini.cursorword').setup()
    require('mini.hipatterns').setup()
    require('mini.icons').setup()
    require('mini.indentscope').setup({
      draw = {
        animation = function() return 0 end
      },
      options = {
        indent_at_cursor = false,
      },
    })
    require('mini.notify').setup()
    require('mini.statusline').setup()

    -- Others
    require('mini.test').setup()
  end
}
