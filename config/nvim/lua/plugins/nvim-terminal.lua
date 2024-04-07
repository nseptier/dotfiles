return {
  's1n7ax/nvim-terminal',
  config = function()
    vim.o.hidden = true
    require('nvim-terminal').setup({
      -- keymap to disable all the default keymaps
      disable_default_keymaps = false,

      -- keymap to toggle open and close terminal window
      toggle_keymap = 'tt',

      terminals = {
        -- keymaps to open nth terminal
        { keymap = 't1' },
        { keymap = 't2' },
        { keymap = 't3' },
        { keymap = 't4' },
        { keymap = 't5' },
      },
    })
  end,
  init = function()
    vim.api.nvim_create_autocmd('TermOpen', {
      command = 'setlocal listchars= nonumber norelativenumber nocursorline',
    })
  end
}
