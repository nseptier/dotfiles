return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {},
  config = function()
    local hop = require('hop')
    hop.setup({
      keys = 'abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()',
      dim_unmatched = false
    })
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'gt', function()
      hop.hint_char1()
    end, { remap = true })
  end
}
