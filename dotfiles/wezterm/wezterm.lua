local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.audible_bell = 'Disabled'
config.color_scheme = 'Everforest Dark (Gogh)'
config.enable_tab_bar = false
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
