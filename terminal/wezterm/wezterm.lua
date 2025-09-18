local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/nu' }

config.font = wezterm.font('PragmataPro Liga')
config.font_size = 16
config.color_scheme = 'Campbell'

config.enable_tab_bar = false


config.keys = {
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
  },
  {
    key = 'Delete',
    mods = 'OPT',
    action = wezterm.action.SendKey { key = 'd', mods = 'ALT' },
  },
}

return config
