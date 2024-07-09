local wezterm = require 'wezterm'

local config = {}

config.color_scheme = 'carbonfox'
config.font = wezterm.font 'Fira Code'
config.font_size = 16
config.initial_cols = 120
config.initial_rows = 36

config.keys = {
  {
    key = 'f',
    mods = 'CTRL|SUPER',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
