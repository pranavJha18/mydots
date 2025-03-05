local wezterm = require("wezterm")

-- Basic Configuration for terminal:->
local config = wezterm.config_builder()
config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	default_cursor_style = "BlinkingBar",
	force_reverse_video_cursor = true,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "ExtraBold" }),
	font_size = 14,
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 12,
	bottom = 0,
}

--TABS:->
config.enable_tab_bar = false
config.scrollback_lines = 35000

--GPU Acceleration:->
config.front_end = "WebGpu"
config.enable_wayland = false
webgpu_preferred_adapter = {
	name = "Intel(R) UHD Graphics", -- Make sure this matches your GPU name
	backend = "Dx12", -- Use DirectX 12 for best performance
}
--Smooth Scrolling & rendering optimizations:->
config.animation_fps = 120
config.max_fps = 120
prefer_egl = true

--WINDOW-STYLE:->
config.window_background_opacity = 1
config.initial_rows = 31
config.initial_cols = 128
config.adjust_window_size_when_changing_font_size = false
config.hide_mouse_cursor_when_typing = true

config.window_decorations = "RESIZE"

--Windows Specific Settings:->
--config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--cd", "/home/pranav" }
config.default_prog = { "pwsh" }
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_position(50, 4)
end)

-- This is used to set an image as my background
config.background = {
	{
		source = { File = { path = "C:/Users/prana/mydots/Pictures/pastelMountain.jpg", speed = 0.2 } },
		opacity = 1,
		width = "100%",
		hsb = {
			brightness = 0.03,
			hue = 1,
			saturation = 1,
		},
	},
}

-- Enable the kitty graphics module
config.enable_kitty_graphics = true

-- Command Palette:->
config.command_palette_font_size = 15
config.command_palette_bg_color = "#181825"
config.command_palette_fg_color = "#cdd6f4"
config.command_palette_rows = 20

config.color_scheme = "catppuccin-mocha"

return config
