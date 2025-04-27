local wezterm = require 'wezterm'
local weztmux = require 'wez-tmux'

local tabline = wezterm.plugin.require 'https://github.com/michaelbrusegard/tabline.wez'

wezterm.plugin.update_all()

local theme = {
  foreground = '#ced4da',
  background = '#252A2E',

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

local palette = {
  latte = {
    rosewater = "#dc8a78",
    flamingo = "#dd7878",
    pink = "#ea76cb",
    mauve = "#8839ef",
    red = "#d20f39",
    maroon = "#e64553",
    peach = "#fe640b",
    yellow = "#df8e1d",
    green = "#40a02b",
    teal = "#179299",
    sky = "#04a5e5",
    sapphire = "#209fb5",
    blue = "#1e66f5",
    lavender = "#7287fd",
    text = "#4c4f69",
    subtext1 = "#5c5f77",
    subtext0 = "#6c6f85",
    overlay2 = "#7c7f93",
    overlay1 = "#8c8fa1",
    overlay0 = "#9ca0b0",
    surface2 = "#acb0be",
    surface1 = "#bcc0cc",
    surface0 = "#ccd0da",
    crust = "#dce0e8",
    mantle = "#e6e9ef",
    base = "#eff1f5",
  },
  frappe = {
    rosewater = "#f2d5cf",
    flamingo = "#eebebe",
    pink = "#f4b8e4",
    mauve = "#ca9ee6",
    red = "#e78284",
    maroon = "#ea999c",
    peach = "#ef9f76",
    yellow = "#e5c890",
    green = "#a6d189",
    teal = "#81c8be",
    sky = "#99d1db",
    sapphire = "#85c1dc",
    blue = "#8caaee",
    lavender = "#babbf1",
    text = "#c6d0f5",
    subtext1 = "#b5bfe2",
    subtext0 = "#a5adce",
    overlay2 = "#949cbb",
    overlay1 = "#838ba7",
    overlay0 = "#737994",
    surface2 = "#626880",
    surface1 = "#51576d",
    surface0 = "#414559",
    base = "#303446",
    mantle = "#292c3c",
    crust = "#232634",
  },
  macchiato = {
    rosewater = "#f4dbd6",
    flamingo = "#f0c6c6",
    pink = "#f5bde6",
    mauve = "#c6a0f6",
    red = "#ed8796",
    maroon = "#ee99a0",
    peach = "#f5a97f",
    yellow = "#eed49f",
    green = "#a6da95",
    teal = "#8bd5ca",
    sky = "#91d7e3",
    sapphire = "#7dc4e4",
    blue = "#8aadf4",
    lavender = "#b7bdf8",
    text = "#cad3f5",
    subtext1 = "#b8c0e0",
    subtext0 = "#a5adcb",
    overlay2 = "#939ab7",
    overlay1 = "#8087a2",
    overlay0 = "#6e738d",
    surface2 = "#5b6078",
    surface1 = "#494d64",
    surface0 = "#363a4f",
    base = "#24273a",
    mantle = "#1e2030",
    crust = "#181926",
  },
  mocha = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
    text = "#cdd6f4",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#6c7086",
    surface2 = "#585b70",
    surface1 = "#45475a",
    surface0 = "#313244",
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b",
  },
}

local flavor = 'mocha'
local c = palette[flavor]
-- shorthand to check for the Latte flavor
local isLatte = palette == "latte"

theme.ansi = {
  isLatte and c.subtext1 or c.surface1,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.pink,
  c.teal,
  isLatte and c.surface2 or c.subtext1,
}

theme.brights = {
  isLatte and c.subtext0 or c.surface2,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.pink,
  c.teal,
  isLatte and c.surface1 or c.subtext0,
}

local config = {
  automatically_reload_config    = true,
  cell_width                     = 0.9,
  colors                         = theme,
  -- colors                         = {
  --   background = '#252A2E',
  --   cursor_bg = '#ffffff',
  --   cursor_border = '#dddddd',

  -- -- the foreground color of selected text
  -- selection_fg = 'black',
  -- -- the background color of selected text
  -- selection_bg = '#fffacd',

  -- -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  -- scrollbar_thumb = '#222222',

  -- -- Colors for copy_mode and quick_select
  -- -- available since: 20220807-113146-c2fee766
  -- -- In copy_mode, the color of the active text is:
  -- -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- -- 2. selection_* otherwise
  -- copy_mode_active_highlight_bg = { Color = '#000000' },
  -- -- use `AnsiColor` to specify one of the ansi color palette values
  -- -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  -- --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  -- copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  -- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  -- copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  -- quick_select_label_bg = { Color = 'peru' },
  -- quick_select_label_fg = { Color = '#ffffff' },
  -- quick_select_match_bg = { AnsiColor = 'Navy' },
  -- quick_select_match_fg = { Color = '#ffffff' },

  -- input_selector_label_bg = { AnsiColor = 'Black' }, -- (*Since: Nightly Builds Only*)
  -- input_selector_label_fg = { Color = '#ffffff' }, -- (*Since: Nightly Builds Only*)
  --   tab_bar = {
  --     background = '#252A2E',
  --   },
  -- },
  default_cwd                    = "c:/gitroot/neo-product/neo/NeoUI",
  default_prog                   = { 'pwsh.exe' },
  -- enable_tab_bar = false,
  font                           = wezterm.font { family = 'Iosevka Custom Semi-Extended' },
  -- font                           = wezterm.font('FiraCode Nerd Font', { weight = 'Regular', italic = false }),
  -- font = wezterm.font('UbuntuSansMono Nerd Font', { weight = 'Regular', italic = false }),
  -- font = wezterm.font('DroidSansM Nerd Font', { weight = 'Regular', italic = false }),
  -- font = wezterm.font('FantasqueSansM Nerd Font', { weight = 'Regular', italic = false }),
  font_size                      = 12,
  inactive_pane_hsb              = {
    saturation = 1, --0.67,
    brightness = 1, -- 0.67,
  },
  -- hide_tab_bar_if_only_one_tab = true,
  keys                           = {
    -- { key = 'v', mods = 'CTRL',   action = act.PasteFrom 'Clipboard' },
    { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },
  },
  leader                         = { key = "a", mods = "CTRL" },
  line_height                    = 1.2,
  -- set_environment_variables      = {
  --   TERM = 'xterm-256color',
  -- },
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom              = true,
  tab_max_width                  = 999,
  -- term                           = "wezterm",
  treat_left_ctrlalt_as_altgr    = true,
  underline_position             = '-4px',
  underline_thickness            = '1px',
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
        { Foreground = { Color = '#5684d6' } },
        { Text = ' 󰍎  ' },
        { Foreground = { Color = '#4a5759' } },
        { Text = before },
        { Foreground = { Color = '#5684d6' } },
        { Text = git_root },
        { Foreground = { Color = '#5e60ce' } },
        { Text = after },
      }
    else
      return ' 󰍎  ' .. result
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
        a = { fg = '#5684d6', bg = '#1b2022' },
        b = { fg = '#202528', bg = '#f25c54' },
        -- c = { fg = '#252a2d', bg = '#252a2d' },
      },
      copy_mode = {
        a = { fg = '#5684d6', bg = '#1b2022' },
        b = { fg = '#202528', bg = '#f25c54' },
        -- c = { fg = '#252a2d', bg = '#252a2d' },
      },
      search_mode = {
        a = { fg = '#5684d6', bg = '#1b2022' },
        b = { fg = '#202528', bg = '#f25c54' },
        -- c = { fg = '#252a2d', bg = '#252a2d' },
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
      left = '',
      right = '',
    },
    tab_separators = {
      left = '',
      right = '',
    },
  },
  sections = {
    tabline_a = {
      cwd_component,
    },
    tabline_b = {
      git_branch_component,
    },
    tabline_c = {
    },
    tab_active = {
      {
        'tab',
        icon = { wezterm.nerdfonts.md_tab .. ' ' },
      },
    },
    tab_inactive = {
      {
        'tab',
        icon = { '󰓪 ' },
      },
    },
    tabline_x = {},
    tabline_y = {},
    tabline_z = {},
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
