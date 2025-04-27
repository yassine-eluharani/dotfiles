local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.max_fps = 120
-- Settings
-- config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
  { family = "SFMono Nerd Font", scale = 1.3 },
})
-- Bg opacity
config.window_background_opacity = 1
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.color_scheme = "Bitmute"
config.window_background_opacity = 1
-- config.macos_window_background_blur = 50
-- config.window_background_image = "/Users/yassine/Pictures/Wallpaper/879383.jpg"
-- config.window_background_image_hsb = {
-- 	brightness = 0.08,
-- 	hue = 1.0,
-- 	saturation = 1.0,
-- }
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- No tab bar
config.enable_tab_bar = false

return config
