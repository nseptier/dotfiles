return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",              -- optional
    -- "nvim-mini/mini.pick",           -- optional
    -- "folke/snacks.nvim",             -- optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
  },
  config = function()
    require('neogit').setup {
      auto_refresh = false,
      disable_hint = true,
      disable_context_highlighting = true,
      filewatcher = {
        interval = 10000,
        enabled = false,
      },
      prompt_force_push = false,
      graph_style = "kitty",
      kind = "tab",
      signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { "+", "-" },
        section = { "+", "-" },
      },
      status = {
        show_head_commit_hash = false,
      },
      commit_editor = {
        kind = "auto",
        show_staged_diff = false,
        staged_diff_split_kind = "auto",
        spell_check = true,
      },
    }
  end,
}
