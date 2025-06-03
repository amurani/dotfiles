local wezterm = require("wezterm")

-- color scheme: Rosé Pine for WezTerm install
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").moon

local themed_window_frame_config = theme.window_frame()

return {
	font_size = 13.0,
	-- font = wezterm.font 'Monaco Nerd Font', -- enable to keep consistent with iTerm

	colors = theme.colors(),

	window_frame = themed_window_frame_config, -- needed only if using fancy tab bar
}
