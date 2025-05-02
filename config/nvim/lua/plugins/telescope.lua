return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local actions = require('telescope.actions')

    local function split_path(path)
      local dirs = vim.split(path, '/')
      local filename = vim.trim(table.remove(dirs, #dirs))
      local tail = vim.trim(table.concat(dirs, '/'))

      return filename, tail
    end

    local entry_display = require('telescope.pickers.entry_display')

    require('telescope').setup {
      defaults = {
        entry_prefix = '   ',

        layout_config = {
          -- height = { padding = 0 },
          -- width = { padding = 0 },

          prompt_position = 'top',

          horizontal = {
            width = 0.90,
            preview_width = 0.6,
            preview_cutoff = 200,
          },

          vertical = {
            mirror = true,
          },
        },

        layout_strategy = 'flex',

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

        multi_icon = '󰿦  ', -- '󰻃',

        path_display = function(opts, path)
          local filename, tail = split_path(path)

          local transformed_path = filename .. ' ' .. tail
          local path_style = { { { #filename, #transformed_path }, 'Comment' } }

          return transformed_path, path_style
        end,

        prompt_prefix = '  ',

        selection_caret = '  ', -- '󰴲'

        sorting_strategy = 'ascending',

        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--column',
          '--hidden',
          '--line-number',
          '--no-heading',
          '--path-separator=/',
          '--smart-case',
          '--with-filename',
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = 'smart_case',       -- or 'ignore_case' or 'respect_case'
        },

        -- live_grep_args = {
        --   auto_quoting = false, -- enable/disable auto-quoting
        --   mappings = {          -- extend mappings
        --     i = {
        --       ['<C-k>'] = lga_actions.quote_prompt(),
        --       ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
        --       -- ['<C-space>'] = lga_actions.to_fuzzy_refine
        --     },
        --   },
        -- },

        ['ui-select'] = {
          require('telescope.themes').get_dropdown {
            layout_strategy = 'vertical',
          }
        },
      },

      pickers = {
        find_files = {
          disable_devicons = true,

          find_command = {
            'rg',
            '--files',
            '--smart-case',
            '--path-separator=/',
          },

          hidden = true,
        },

        git_branches = {
          default_text = '!origin ',
          previewer = false,
          theme = 'dropdown',
        },

        grep_string = {
          disable_devicons = true,
        },

        live_grep = {
          disable_devicons = true,

          entry_maker = function(result)
            local displayer = entry_display.create {
              separator = " ",
              items = {
                { width = nil },
                { remaining = true },
              },
            }

            local path, lnum, col = result:match('^([^:]+):(%d+):(%d+)')

            return {
              value = path,
              valid = true,
              ordinal = path,
              display = function()
                local filename, tail = split_path(path)
                return displayer {
                  filename,
                  { tail, 'Comment' },
                }
              end,
              filename = path,
              lnum = tonumber(lnum),
              col = tonumber(col),
              path = path,
            }
          end,

          on_input_filter_cb = function(prompt)
            return { prompt = prompt:gsub('%s', '.*') }
          end,
        },

        lsp_document_symbols = {
          -- entry_maker = function(entry)
          --   -- entry.valid = not entry.text:find(' callback$')
          --   return entry
          -- end,
          -- symbols = {
          --   'function',
          --   'interface',
          --   'variable',
          -- },
        },
      },
    }

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
    -- vim.keymap.set('n', '<leader>ft', require('telescope').extensions.live_grep_args.live_grep_args)
    vim.keymap.set('n', '<leader>fT', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    vim.keymap.set('n', '<leader>gb',
      function()
        local opts = require('telescope.themes').get_dropdown({ layout_strategy = 'vertical' })
        require('telescope.builtin').git_branches(opts)
      end)


    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
    require('telescope').load_extension('ui-select')
  end
}
