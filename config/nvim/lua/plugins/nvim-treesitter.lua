return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "tsx", "typescript" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  init = function()
    -- local treesitter_parsers = require('nvim-treesitter.parsers')

    -- if treesitter_parsers.has_parser "tsx" then
    -- vim.treesitter.query.set("tsx", "highlights",
    --   [[; extends

    --   ((identifier) @variable (#set! priority 110))]]
    -- )
    -- end
  end
}
