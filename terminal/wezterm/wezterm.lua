local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font('PragmataPro Liga')
config.font_size = 15
config.color_scheme = 'Campbell'

config.enable_tab_bar = false


return config
