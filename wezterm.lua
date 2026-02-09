local wezterm = require 'wezterm'
local weztmux = require 'wez-tmux'
local workspace_switcher = wezterm.plugin.require('https://github.com/MLFlexer/smart_workspace_switcher.wezterm')
local tabline = wezterm.plugin.require 'https://github.com/michaelbrusegard/tabline.wez'

wezterm.plugin.update_all()

local theme = {
  foreground = '#ced4da',
  background = '#252A2D',

  cursor_bg = '#f8f9fa',
  cursor_fg = '#1f2427',
  cursor_border = '#f8f9fa',

  split = '#1f2427',

  compose_cursor = '#5e60ce',

  tab_bar = {
    background = '#252A2E',
    active_tab = {
      bg_color = 'white',
      fg_color = 'red',
    },
    inactive_tab = {
      bg_color = '#252A2E',
      fg_color = 'yellow',
    },
  },
}

-- default

local c = {
  rosewater = '#f5e0dc',
  flamingo = '#f2cdcd',
  pink = '#f5c2e7',
  mauve = '#cba6f7',
  red = '#f38ba8',
  maroon = '#eba0ac',
  peach = '#fab387',
  yellow = '#f9e2af',
  green = '#a6e3a1',
  teal = '#94e2d5',
  sky = '#89dceb',
  sapphire = '#74c7ec',
  blue = '#89b4fa',
  lavender = '#b4befe',
  text = '#cdd6f4',
  subtext1 = '#bac2de',
  subtext0 = '#a6adc8',
  overlay2 = '#9399b2',
  overlay1 = '#7f849c',
  overlay0 = '#6c7086',
  surface2 = '#585b70',
  surface1 = '#45475a',
  surface0 = '#313244',
  base = '#1e1e2e',
  mantle = '#181825',
  crust = '#11111b',
}

theme.ansi = {
  c.surface1,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.pink,
  c.teal,
  c.subtext1,
}

theme.brights = {
  c.surface2,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.pink,
  c.teal,
  c.subtext0,
}

local config = {
  automatically_reload_config    = true,
  cell_width                     = 0.9,
  colors                         = theme,
  command_palette_bg_color       = '#1b2022',
  command_palette_fg_color       = '#ced4da',
  command_palette_font           = wezterm.font { family = 'Iosevka Custom Semi-Extended' },
  -- command_palette_font_size      = 12,
  command_palette_rows           = 12,
  default_cwd                    = '~',
  -- default_prog                   = { 'pwsh.exe' },
  font                           = wezterm.font { family = 'Iosevka Custom Semi-Extended' },
  font_size                      = 13,
  inactive_pane_hsb              = {
    saturation = 0.7,
    brightness = 0.9,
  },
  keys                           = {
    { key = 'h',          mods = 'LEADER',     action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'l',          mods = 'LEADER',     action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'j',          mods = 'LEADER',     action = wezterm.action { ActivatePaneDirection = 'Down' } },
    { key = 'k',          mods = 'LEADER',     action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 's',          mods = 'LEADER',     action = workspace_switcher.switch_workspace() },
    { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left', },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right', },
    { key = 'UpArrow',    mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up', },
    { key = 'DownArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down', },
  },
  leader                         = { key = 'a', mods = 'CTRL' },
  line_height                    = 1.2,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom              = true,
  tab_max_width                  = 999,
  treat_left_ctrlalt_as_altgr    = true,
  underline_position             = '-4px',
  underline_thickness            = '1px',
  -- unzoom_on_switch_pane          = false,
  use_fancy_tab_bar              = false,
  use_dead_keys                  = false,
  window_close_confirmation      = 'NeverPrompt',
  window_decorations             = 'RESIZE',
  window_padding                 = {
    left = 40,
    right = 40,
    top = 20,
    bottom = 20,
  }
}

local function cwd_component(win)
  local cwd = win:active_pane():get_current_working_dir()

  if (cwd ~= nil) then
    local str = wezterm.to_string(cwd)
    local url = wezterm.url.parse(str)
    local path = url.file_path:gsub('^/(%w:)', '%1')

    local success, git_root = wezterm.run_child_process({ 'git', '-C', path, 'rev-parse', '--show-toplevel' })

    local result = path:gsub(wezterm.home_dir:gsub('\\', '/'), '~'):gsub('^%u', string.lower) .. ' '

    if success then
      git_root = git_root:match('/([^/]*)$'):gsub('[\n\r]', '')
      local before, after = result:match('^(.+)' .. git_root:gsub('%-', '%%-') .. '(.+)$')

      return wezterm.format {
        { Foreground = { Color = '#4a5759' } },
        { Text = '   ' },
        { Foreground = { Color = '#4a5759' } },
        { Text = before },
        { Foreground = { Color = '#768184' } },
        { Text = git_root },
        { Foreground = { Color = '#4a5759' } },
        { Text = after },
      }
    else
      return '   ' .. result
    end
  end
  return ''
end

local function git_branch_component(win)
  local cwd = win:active_pane():get_current_working_dir()
  if (cwd ~= nil) then
    local str = wezterm.to_string(cwd)
    local url = wezterm.url.parse(str)
    local path = url.file_path:gsub('^/(%w:)', '%1')

    local _, git_branch_raw = wezterm.run_child_process { 'git', '-C', path, 'branch', '--show-current' }
    local git_branch = git_branch_raw:gsub('[\n\r]', '')
    return git_branch ~= '' and ('   ' .. git_branch .. ' ') or ''
  end
  return ''
end

local tablineconfig = {
  options = {
    icons_enabled = true,
    tabs_enabled = true,
    theme = config.colors,
    theme_overrides = {
      normal_mode = {
        a = { fg = '#5e60ce', bg = '#1b2022' },
        b = { fg = '#5e60ce', bg = '#202528' },
        z = { fg = '#4a5759', bg = '#1b2022' },
      },
      copy_mode = {
        a = { fg = '#5e60ce', bg = '#1b2022' },
        b = { fg = '#5e60ce', bg = '#202528' },
      },
      search_mode = {
        a = { fg = '#5e60ce', bg = '#1b2022' },
        b = { fg = '#5e60ce', bg = '#202528' },
      },
      tab = {
        active = { fg = '#ced4da', bg = '#252a2d' },
        inactive = { fg = '#4a5759', bg = '#252a2d' },
        inactive_hover = { fg = '#4a5759', bg = '#252a2d' },
      },
    },
    section_separators = {
      left = '',
      right = '',
    },
    component_separators = {
      left = '',
      right = '',
    },
    tab_separators = {
      left = '',
      right = '',
    },
  },
  sections = {
    tabline_a = {
      -- {
      --   'workspace',
      --   icon = '󰨝 ',
      -- },
      cwd_component,
    },
    tabline_b = {
      git_branch_component,
    },
    tabline_c = {
      '  ',
    },
    tab_active = {
      {
        'tab',
        icon = { '󰓩 ' },
      },
    },
    tab_inactive = {
      {
        'tab',
        icon = { '󰓪 ' },
      },
    },
    tabline_x = {},
    tabline_y = {
    },
    tabline_z = {
      {
        'datetime',
        hour_to_icon = false,
        icon = '󰔚 ',
      }
    },
  },
  extensions = {},
}

weztmux.apply_to_config(config, {})
tabline.setup(tablineconfig)

-- wezterm.on('gui-startup', function(cmd)
--   -- allow `wezterm start -- something` to affect what we spawn
--   -- in our initial window
--   local args = {}
--   if cmd then
--     args = cmd.args
--   end

--   -- Set a workspace for coding on a current project
--   -- Top pane is for the editor, bottom pane is for the build tool
--   local project_dir = wezterm.home_dir
--   local tab, build_pane, window = mux.spawn_window {
--     workspace = 'coding',
--     cwd = project_dir,
--     args = args,
--   }
--   local editor_pane = build_pane:split {
--     direction = 'Top',
--     size = 0.6,
--     cwd = project_dir,
--   }
--   -- may as well kick off a build in that pane
--   build_pane:send_text 'cargo build\n'

--   -- A workspace for interacting with a local machine that
--   -- runs some docker containers for home automation
--   local tab, pane, window = mux.spawn_window {
--     workspace = 'automation',
--     args = { 'ssh', 'vault' },
--   }

--   -- We want to startup in the coding workspace
--   mux.set_active_workspace 'coding'
-- end)

return config
