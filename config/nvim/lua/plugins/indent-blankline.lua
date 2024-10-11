return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup {
      indent = { char = "▏" },
      whitespace = {
        highlight = {
          "Whitespace",
        },
      },
      scope = {
        enabled = true,
      },
    }

    vim.api.nvim_create_autocmd(
      'ColorScheme',
      {
        callback = function()
          vim.cmd.highlight('clear @ibl.scope.underline.1')
          vim.cmd.highlight('link @ibl.scope.underline.1 IblScopeHighlight')
        end
      }
    )
    vim.api.nvim_set_hl(0, '@ibl.scope.underline.1', { bg = '#ff00ff' })

    local hooks = require("ibl.hooks")
    hooks.register(
      hooks.type.WHITESPACE,
      hooks.builtin.hide_first_space_indent_level
    )
  end,
}
