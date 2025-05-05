return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local treesitter_context = require("treesitter-context")

    treesitter_context.setup({
      multiline_threshold = 1,
      -- separator = '', -- '▄',
    })

    vim.keymap.set("n", "[C", function()
      treesitter_context.go_to_context(vim.v.count1)
    end, { silent = true })
  end
}
