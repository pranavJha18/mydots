-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	default_cursor_style = "BlinkingBlock",
	force_reverse_video_cursor = true,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "Bold" }),
	font_size = 14,
}
config.window_padding = {
	left = 0,
	right = 4,
	top = 18,
	bottom = 0,
}

--TABS:
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.scrollback_lines = 35000
--config.tab_bar_at_bottom = true

config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 120

--WINDOW-STYLE:

--config.window_background_opacity = 0.90
config.initial_rows = 30
config.initial_cols = 128
config.adjust_window_size_when_changing_font_size = false
config.hide_mouse_cursor_when_typing = true

--config.window_decorations = "None"

--config.window_background_image = "/home/pranav/Pictures/285886.jpg"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.02,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,

	-- You can adjust the saturation also.
	saturation = 1.0,
}

-- config.window_frame = {
-- 	border_left_width = "0.47cell",
-- 	border_right_width = "0.47cell",
-- 	border_bottom_height = "0.20cell",
-- 	border_top_height = "0.20cell",
-- 	border_left_color = "#f2cdcd",
-- 	border_right_color = "#f2cdcd",
-- 	border_bottom_color = "#f2cdcd",
-- 	border_top_color = "#f2cdcd",
-- }

-- Command Palette
config.command_palette_font_size = 17
config.command_palette_fg_color = "#c3e88d"
config.command_palette_bg_color = "#1f2335"

-- For example, changing the color scheme:
--config.color_scheme = "Aura (Gogh)"
config.color_scheme = "tokyonight"

-- and finally, return the configuration to wezterm
return config
