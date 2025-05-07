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
      local cwd = vim.fs.normalize(vim.fn.getcwd()):gsub('-', '%%-')
      local tail = vim.trim(table.concat(dirs, '/')):gsub(cwd, '')

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

        path_display = function(_, path)
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
        buffers = {
          entry_maker = function(result)
            local displayer = entry_display.create {
              separator = " ",
              items = {
                -- { width = nil },
                -- { width = 4 },
                -- { width = icon_width },
                { width = nil },
                { width = nil },
                { remaining = true },
              },
            }

            local path = vim.fs.normalize(result.info.name)

            return {
              -- col = tonumber(col),
              display = function()
                local filename, tail = split_path(path)
                return displayer {
                  '[' .. result.bufnr .. ']',
                  filename,
                  { tail, 'Comment' },
                }
              end,
              filename = path,
              -- lnum = result.info.lnum,
              ordinal = path,
              path = path,
              valid = true,
              value = path,
            }
          end,
        },

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

          -- mappings = {
          --   i = {
          --     ["C-q"] = function() end,
          --     ["M-q"] = function() end,
          --     ["<tab>"] = function() end,
          --     ["<s-tab>"] = function() end,
          --   },
          -- },

          -- selection_caret = '  ',

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
              col = tonumber(col),
              display = function()
                local filename, tail = split_path(path)
                return displayer {
                  filename,
                  { tail, 'Comment' },
                }
              end,
              filename = path,
              lnum = tonumber(lnum),
              ordinal = path,
              path = path,
              valid = true,
              value = path,
            }
          end,

          on_input_filter_cb = function(prompt)
            return { prompt = prompt:gsub('%s', '.*') }
          end,
        },

        lsp_document_symbols = {
          default_text = '!\\ callback !<function> ',
          -- entry_maker = function(entry)
          --   entry.valid =  not (entry.text:find(' callback$') and entry.kind == 'Function')
          --   entry.value = entry.text
          --
          --   return entry
          -- end,
          previewer = false,
          symbols = {
            'function',
            'interface',
            'variable',
          },
        },
      },
    }

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
    -- vim.keymap.set('n', '<leader>ft', require('telescope').extensions.live_grep_args.live_grep_args)
    vim.keymap.set('n', '<leader>fT', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    vim.keymap.set('n', '<leader>fs',
      function()
        local opts = require('telescope.themes').get_dropdown({ layout_strategy = 'vertical' })
        require('telescope.builtin').lsp_document_symbols(opts)
      end)


    require('telescope').load_extension('fzf')

    vim.keymap.set('n', '<leader>gb',
      function()
        local opts = require('telescope.themes').get_dropdown({ layout_strategy = 'vertical' })
        require('telescope.builtin').git_branches(opts)
      end)


    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
    require('telescope').load_extension('ui-select')

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopePrompt",
      callback = function(ctx)
        local backdropName = "TelescopeBackdrop"
        local telescopeBufnr = ctx.buf

        -- `Telescope` does not set a zindex, so it uses the default value
        -- of `nvim_open_win`, which is 50: https://neovim.io/doc/user/api.html#nvim_open_win()
        local telescopeZindex = 50

        local backdropBufnr = vim.api.nvim_create_buf(false, true)
        local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
          relative = "editor",
          border = "none",
          row = 0,
          col = 0,
          width = vim.o.columns,
          height = vim.o.lines,
          focusable = false,
          style = "minimal",
          zindex = telescopeZindex - 1, -- ensure it's below the reference window
        })

        vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
        vim.wo[winnr].winhighlight = "Normal:" .. backdropName
        vim.wo[winnr].winblend = 20
        vim.bo[backdropBufnr].buftype = "nofile"

        -- close backdrop when the reference buffer is closed
        vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
          once = true,
          buffer = telescopeBufnr,
          callback = function()
            if vim.api.nvim_win_is_valid(winnr) then vim.api.nvim_win_close(winnr, true) end
            if vim.api.nvim_buf_is_valid(backdropBufnr) then
              vim.api.nvim_buf_delete(backdropBufnr, { force = true })
            end
          end,
        })
      end,
    })
  end
}
