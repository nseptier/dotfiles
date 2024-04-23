return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  config = function()
    require("telescope").load_extension("live_grep_args")
    vim.keymap.set("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
  end,
}
