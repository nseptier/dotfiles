return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.6',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'desdic/telescope-rooter.nvim',
  },
  config = function()
    local actions = require('telescope.actions')
    local lga_actions = require('telescope-live-grep-args.actions')

    require('telescope').setup {
      defaults = {
        selection_caret = '> ',
        entry_prefix = '  ',
        multi_icon = '+ ',

        path_display = function(opts, path)
          local dirs = vim.split(path, '/')
          local filename = table.remove(dirs, #dirs)

          local tail = table.concat(dirs, '/')
          -- Trim prevents a top-level filename to have a trailing white space
          local transformed_path = vim.trim(filename .. " " .. tail)
          local path_style = { { { #filename, #transformed_path }, "Comment" } }

          return transformed_path, path_style
        end,
        -- path_display = {
        --   "filename_first"
        -- },
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ['<C-?>'] = actions.which_key,
            ['<esc>'] = actions.close,
            ['<C-h>'] = actions.preview_scrolling_left,
            ['<C-j>'] = actions.preview_scrolling_down,
            ['<C-k>'] = actions.preview_scrolling_up,
            ['<C-l>'] = actions.preview_scrolling_right,
          }
        },
        layout_config = {
          -- height = { padding = 0 },
          -- width = { padding = 0 },
          horizontal = {
            width = 0.90,
            preview_width = 0.6,
            preview_cutoff = 200,
          }
          -- other layout configuration here
        },
        layout_strategy = 'flex',
      },
      pickers = {
        git_branches = {
          default_text = '!origin '
        },
        find_files = {
          disable_devicons = true,
          find_command = {
            "rg",
            "--files",
            "--ignore-case",
            "--path-separator",
            "/",
          },
          hidden = true,
        },
        grep_string = {
          additional_args = { '--hidden' },
          disable_devicons = true,
        },
        live_grep = {
          additional_args = { '--hidden' },
          disable_devicons = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = 'smart_case',       -- or 'ignore_case' or 'respect_case'
          -- the default case_mode is 'smart_case'
        },

        live_grep_args = {
          auto_quoting = false, -- enable/disable auto-quoting
          mappings = {          -- extend mappings
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
              ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
              -- ['<C-space>'] = lga_actions.to_fuzzy_refine
            },
          },
        },

        rooter = {
          enable = true,
          patterns = { '.git', 'package.json' }
        },
      },
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fT', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
    require('telescope').load_extension('rooter')
  end
}
