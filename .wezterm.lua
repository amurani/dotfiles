local wezterm = require("wezterm")

-- color scheme: Rosé Pine for WezTerm install
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").moon

local themed_window_frame_config = theme.window_frame()

local key_mappings = {
	-- Word navigation
	{ key = "LeftArrow", mos = "OPT", action = wezterm.action.SendKey({ key = "b", mods = "ALT" }) }, -- opt + left: move one word to the left
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendKey({ key = "f", mods = "ALT" }) }, -- opt + right: move one word to the right
	-- Pane splitting
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal },
	{ key = "d", mods = "SHIFT|CMD", action = wezterm.action.SplitVertical },
	-- Pane navigation
	{ key = "UpArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
	-- Pane closing
	{ key = "w", mods = "CMD", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) }, -- close pane, not entire tab
	-- Clear terminal
	{ key = "k", mods = "CMD", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
}

return {
	font_size = 13.0,
	-- font = wezterm.font 'Monaco Nerd Font', -- enable to keep consistent with iTerm

	colors = theme.colors(),

	window_frame = themed_window_frame_config, -- needed only if using fancy tab bar

	keys = key_mappings,
}
