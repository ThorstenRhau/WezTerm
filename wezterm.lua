-- Importing the wezterm module
local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("links").setup(config)

-- Function to set the color scheme based on the appearance (dark or light)
local function light_or_dark(appearance)
    if appearance:find("Dark") then
        -- Dark theme
        return "tokyonight_night"
    else
        -- Light theme
        return "tokyonight_day"
    end
end

config.font = wezterm.font_with_fallback({
    {
        family = "Iosevka Custom",
        weight = 450,
        harfbuzz_features = {
            -- All the features can be found here: https://typeof.net/Iosevka/
            "calt=1", -- Ligatures like != -> ==>
            "dlig=1", -- Discretionary ligatures

            -- Style sets, only one can be enabled (1) at a time
            -- Disable all to get the default look and feel
            "ss01=0", -- Andale Mono
            "ss02=0", -- Anonymous Pro
            "ss03=0", -- Consolas
            "ss04=0", -- Menlo
            "ss05=0", -- Fira Mono
            "ss06=0", -- Liberation Mono
            "ss07=0", -- Monaco
            "ss08=0", -- Pragmata Pro
            "ss09=0", -- Source Code Pro
            "ss10=0", -- Envy Code R
            "ss11=0", -- X Window Style
            "ss12=0", -- Ubuntu Mono
            "ss13=0", -- Lucida
            "ss14=0", -- JetBrains Mono
            "ss15=0", -- IBM Plex Mono
            "ss16=0", -- PT Mono
            "ss17=0", -- Recursive Mono
            "ss18=0", -- Input Mono
            -- 19 seems to be missing for some reason unknown to me
            "ss20=0", -- Curly Style
        },
    },
    { family = "Symbols Nerd Font", weight = "Regular" },
    { family = "Noto Color Emoji", weight = "Regular" },
})
config.font_size = 14
config.bold_brightens_ansi_colors = true

-- Detect current appearance and apply the corresponding color scheme and tab style
config.color_scheme_dirs = { "~/.config/wezterm/themes" }
local appearance = wezterm.gui.get_appearance()
config.color_scheme = light_or_dark(appearance)

-- Cursor config
config.default_cursor_style = "SteadyBlock"
config.force_reverse_video_cursor = false
config.cursor_thickness = 3

-- General configuration settings
config.initial_rows = 45
config.initial_cols = 110
config.scrollback_lines = 4200
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.audible_bell = "Disabled"
config.window_close_confirmation = "AlwaysPrompt"
config.window_background_opacity = 1 -- Full opacity is 1
config.window_decorations = "TITLE|RESIZE"
config.use_fancy_tab_bar = false
config.term = "wezterm"
config.underline_thickness = 1
config.window_padding = { left = 5, right = 5, top = 5, bottom = 5 }
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.max_fps = 120
config.animation_fps = 60

-- Moving tabs
config.keys = {}
for i = 1, 8 do
    -- CTRL+ALT + number to move to that position
    table.insert(config.keys, {
        key = tostring(i),
        mods = "CTRL|ALT",
        action = wezterm.action.MoveTab(i - 1),
    })
end

-- Spawn a fish shell in login mode
-- config.default_prog = { "/opt/homebrew/bin/fish", "--login" }

-- Return the final configuration
return config
