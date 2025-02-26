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

    -- local prettier = function(parser)
    --   return
    --     {
    --       exe = "prettier",
    --       args = {
    --         "--stdin-filepath",
    --         vim.fs.normalize(vim.api.nvim_buf_get_name(0)),
    --       },
    --       stdin = true,
    --       try_node_modules = true,
    --     }
    -- end


    require('formatter').setup({
      filetype = {
        javascript = require("formatter.filetypes.javascript").prettier,
        javascriptreact = require("formatter.filetypes.javascript").prettier,
        typescript = require("formatter.filetypes.typescript").prettier,
        typescriptreact = require("formatter.filetypes.typescript").prettier,
        vue = require("formatter.filetypes.vue").prettier,
      }
    })
  end
}
