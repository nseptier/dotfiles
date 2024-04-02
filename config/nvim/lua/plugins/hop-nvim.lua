return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {},
  config = function()
    local hop = require('hop')
    hop.setup({})
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'ff', function()
      hop.hint_char1()
    end, {remap=true})
  end
}
