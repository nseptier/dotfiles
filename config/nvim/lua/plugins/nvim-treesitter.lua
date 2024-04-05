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
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = {
        'Fastfile', 'Appfile', 'Matchfile', 'Pluginfile',
      },
      command = "set filetype=ruby",
    })
  end
}
