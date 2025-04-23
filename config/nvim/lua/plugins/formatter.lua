return {
  'mhartington/formatter.nvim',
  config = function()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    augroup("__formatter__", { clear = true })
    autocmd("BufWritePost", {
      group = "__formatter__",
      command = ":FormatWrite",
    })

    require('formatter').setup({
      filetype = {
        javascript = require("formatter.filetypes.javascript").prettier,
        javascriptreact = require("formatter.filetypes.javascript").prettier,
        ['javascript.jsx'] = require("formatter.filetypes.javascript").prettier,
        typescript = require("formatter.filetypes.typescript").prettier,
        typescriptreact = require("formatter.filetypes.typescript").prettier,
        ['typescript.tsx'] = require("formatter.filetypes.typescript").prettier,
        vue = require("formatter.filetypes.vue").prettier,
      },
      logging = false,
    })
  end
}
