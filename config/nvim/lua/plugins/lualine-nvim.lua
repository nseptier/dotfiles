return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          {
            'filename', path = 1,
          },
        },
        lualine_b = { 'location', 'progress' },
        lualine_c = {
          'mode',
          {
            'diagnostics',
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = ' ',
            }
          }
        },
        lualine_x = { 'encoding', { 'filetype', icons_enabled = false } },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {
          {
            'filename', path = 1,
          },
        },
        lualine_c = { 'location' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_x = {
          {
            'tabs',
            cond = function()
              return #vim.fn.gettabinfo() > 1
            end,
            use_mode_colors = false,
            show_modified_status = false,
            tabs_color = {
              -- Same values as the general color option can be used here.
              active = 'ActiveTab', -- Color for active tab.
              -- inactive = '', -- Color for inactive tab.
            },
          }
        },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
