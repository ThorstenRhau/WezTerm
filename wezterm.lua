-- Importing the wezterm module
local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("links").setup(config)

-- Function to set the color scheme based on the appearance (dark or light)
local function light_or_dark(appearance)
    if appearance:find("Dark") then
        -- Dark theme
        return "Catppuccin Macchiato"
    else
        -- Light theme
        return "Catppuccin Latte"
    end
end

-- [[ PragmataPro ]] --
--  https://fsd.it/pragmatapro/Handbook.png
config.font = wezterm.font_with_fallback({
    {
        family = "PragmataPro Liga",
        weight = "Regular",
        harfbuzz_features = {
            "calt", -- Ligatures !=
            "ss13", -- Better git tree lines
        },
    },
    { family = "Symbols Nerd Font", weight = "Regular" },
    { family = "Noto Color Emoji", weight = "Regular" },
})

-- Detect current appearance and apply the corresponding color scheme and tab style
config.color_scheme_dirs = { "~/git/catppuccin-wezterm/dist" }
local appearance = wezterm.gui.get_appearance()
config.color_scheme = light_or_dark(appearance)

config.font_size = 14
config.bold_brightens_ansi_colors = true

-- Cursor config
config.default_cursor_style = "SteadyBlock"
config.force_reverse_video_cursor = false
config.cursor_thickness = 3

-- General configuration settings
config.initial_rows = 30
config.initial_cols = 100
config.scrollback_lines = 4200
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.audible_bell = "Disabled"
config.window_close_confirmation = "AlwaysPrompt"
config.window_background_opacity = 1 -- Full opacity
config.window_decorations = "TITLE|RESIZE"
config.use_fancy_tab_bar = false
config.term = "wezterm"
config.underline_thickness = 1
config.window_padding = { left = 5, right = 5, top = 5, bottom = 5 }
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

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

-- Return the final configuration
return config

-- Below follow inactive font configurations

-- -- [[ Iosevka ]] --
-- -- https://github.com/be5invis/Iosevka/blob/main/doc/stylistic-sets.md
-- -- https://github.com/be5invis/Iosevka/blob/main/doc/character-variants.md
-- -- https://github.com/be5invis/Iosevka/blob/main/doc/language-specific-ligation-sets.md
-- config.font = wezterm.font_with_fallback({
--     {
--         family = "Iosevka Custom",
--         weight = "Book",
--         stretch = "SemiExpanded",
--         harfbuzz_features = {
--             "calt=on", -- Ligatures
--             "dlig=on", -- Discretionary ligatures -<< <==> >>==
--             "VSAD=2", -- () (  )
--             "VSAE=3", -- {} {  }
--             "VSAI=2", -- @
--             "VSAJ=3", -- $ $SHELL
--             "VLAB=5", -- !=
--             "VLAC=1", -- == ===  (small gap between double equal-sign)
--             "VLAA=1", -- <= >=
--             "VLAE=2", -- ==> =>
--             "cv38=8", -- m
--             "cv85=6", -- 0 1234567890
--             "cv92=3", -- 7 1234567890
--             "cv96=2", -- .,:;?!
--             "cv98=12", -- * ** ***
--         },
--     },
--     { family = "Symbols Nerd Font Mono", scale = 0.9, weight = "Regular" },
--     { family = "Apple Color Emoji", weight = "Regular" },
-- })

-- ###########################################################################
-- [[ Berkeley Mono ]] --
-- https://berkeleygraphics.com/typefaces/berkeley-mono/
-- config.font = wezterm.font_with_fallback({
--     {
--         family = "Berkeley Mono Variable",
--         weight = 450,
--         harfbuzz_features = {
--             "ss01=0", -- Plain zero
--             "ss02=0", -- Dotted zero
--             "ss03=1", -- Slashed zero
--             "ss04=0", -- Striped zero
--             "ss05=1", -- Regular 7
--             "ss06=0", -- Fancy 7
--         },
--     },
--     { family = "Symbols Nerd Font Mono", weight = "Regular" },
--     { family = "Noto Color Emoji",       weight = "Regular" },
-- })

-- ###########################################################################
-- [[ MonoLisa ]] --
-- https://www.monolisa.dev/specimen
-- config.font = wezterm.font_with_fallback({
--     {
--         family = "MonoLisa Variable",
--         weight = 350, -- 450 is between Regular and Medium
--         harfbuzz_features = {
--             "calt",
--             "liga",
--             "ss02=0", -- Script
--             "ss07",   -- {} {  }
--             "ss08",   -- () (  )
--             "ss09",   -- <= >= (double width ligatures)
--             "ss11",   -- 0xF (formatting for hex codes)
--             "ss17",   -- .=
--         },
--     },
--     { family = "Symbols Nerd Font Mono", weight = "Regular" },
--     { family = "Noto Color Emoji",       weight = "Regular" },
-- })

-- ###########################################################################
-- [[ MonaSpace ]] --
-- https://github.com/githubnext/monaspace
-- Variants are: Neon, Argon, Xenon, Radon, Krypton
-- config.font = wezterm.font_with_fallback({
--     {
--         family = "Monaspace Neon",
--         weight = 300,
--         stretch = "Normal",
--         style = "Normal",
--         harfbuzz_features = {
--             "calt",
--             "liga",
--             "dlig",
--             "ss01", -- ===
--             "ss02", -- >= <=
--             "ss03", -- -> --> <~>
--             "ss04", -- </ /> /\ </>
--             "ss05", -- |> <|
--             "ss06", -- ## ###
--             "ss07", -- ***
--             "ss08", -- .=
--         },
--     },
--     { family = "Symbols Nerd Font Mono", weight = "Regular" },
--     { family = "Noto Color Emoji",       weight = "Regular" },
-- })
--
-- config.font_rules = {
--
--     { -- Italic
--         intensity = "Normal",
--         italic = true,
--         font = wezterm.font({
--             family = "Monaspace Radon",
--             weight = 300,
--             stretch = "Normal",
--             style = "Normal",
--             harfbuzz_features = {
--                 "calt",
--                 "liga",
--                 "dlig",
--                 "ss01",
--                 "ss02",
--                 "ss03",
--                 "ss04",
--                 "ss05",
--                 "ss06",
--                 "ss07",
--                 "ss08",
--             },
--         }),
--     },
--     { -- Bold
--         intensity = "Bold",
--         italic = false,
--         font = wezterm.font({
--             family = "Monaspace Neon",
--             weight = 500,
--             stretch = "Normal",
--             style = "Normal",
--             harfbuzz_features = {
--                 "calt",
--                 "liga",
--                 "dlig",
--                 "ss01",
--                 "ss02",
--                 "ss03",
--                 "ss04",
--                 "ss05",
--                 "ss06",
--                 "ss07",
--                 "ss08",
--             },
--         }),
--     },
--     { -- Bold Italic
--         intensity = "Bold",
--         italic = true,
--         font = wezterm.font({
--             family = "Monaspace Neon",
--             weight = 500,
--             stretch = "Normal",
--             style = "Normal",
--             harfbuzz_features = {
--                 "calt",
--                 "liga",
--                 "dlig",
--                 "ss01",
--                 "ss02",
--                 "ss03",
--                 "ss04",
--                 "ss05",
--                 "ss06",
--                 "ss07",
--                 "ss08",
--             },
--         }),
--     },
-- }

-- ###########################################################################
-- [[ Fira Code]] --
-- https://github.com/tonsky/FiraCode
-- config.font = wezterm.font_with_fallback({
--     {
--         family = "Fira Code",
--         weight = 450, -- 450 is between Regular and Medium
--         harfbuzz_features = {
--             "liga", -- === ->
--             "zero", -- 0
--             "cv14", -- 3
--             "ss05", -- @
--             "ss04", -- $
--             "ss03", -- &
--         },
--     },
--     { family = "Symbols Nerd Font Mono", weight = "Regular" },
--     { family = "Noto Color Emoji",       weight = "Regular" },
-- })
-- ###########################################################################
