return {
  'tpope/vim-fugitive',
  init = function()
    -- keymaps
    vim.keymap.set('n', '<leader>gg', ':vertical G<CR>')
  end
}
