return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      signs = {
        left = "",
        right = "",
        diag = " ",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └",
      },
      blend = {
        factor = 0.22,
      },
      options = {
        use_icons_from_diagnostic    = true,
        show_all_diags_on_cursorline = false,
        show_diags_only_under_cursor = true,
        show_code                    = false,
        add_messages                 = {
          show_multiple_glyphs = false,
        },
        -- multilines                   = {
        --   enabled = true,
        --   always_show = true,
        -- },
        show_related                 = {
          enabled = false, -- Enable displaying related diagnostics
        },
      }
    })
    vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
  end,
}
