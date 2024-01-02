local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
	{ family = "SFMono Nerd Font", scale = 1.3 },
})
-- Bg opacity
config.window_background_opacity = 1
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_background_image = "/Users/yassine/Pictures/Wallpaper/879383.jpg"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.08,
	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,
	saturation = 1.0,
}
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

-- No tab bar
config.enable_tab_bar = false

return config
