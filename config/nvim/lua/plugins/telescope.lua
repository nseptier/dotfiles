return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.6',
  branch = 'master',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local actions = require("telescope.actions")

    require('telescope').setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-?>"] = actions.which_key,
            ["<esc>"] = actions.close,
            ['<C-h>'] = actions.preview_scrolling_left,
            ['<C-j>'] = actions.preview_scrolling_down,
            ['<C-k>'] = actions.preview_scrolling_up,
            ['<C-l>'] = actions.preview_scrolling_right,
          }
        },
        layout_config = {
          horizontal = {
            width = 0.90,
            preview_width = 0.6
          }
          -- other layout configuration here
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        grep_string = {
          additional_args = { "--hidden" }
        },
        live_grep = {
          additional_args = { "--hidden" }
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fT', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

    require('telescope').load_extension('fzf')
  end
}
