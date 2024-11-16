-- Theme config ----------------------------------
--

-- Importing libraries --
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local themes_path = "~/.config/awesome/core/theme/"

local theme = {}

-- -- -- -- -- -- -- -- -- --

--[[

-- Variables:
taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
tasklist_[bg|fg]_[focus|urgent]
titlebar_[bg|fg]_[normal|focus]
tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
mouse_finder_[color|timeout|animate_timeout|radius|factor]
prompt_[fg|bg|fg_cursor|bg_cursor|font]
hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
Example: theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
notification_font
notification_[bg|fg]
notification_[width|height|margin]
notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
menu_[bg|fg]_[normal|focus]
menu_[border_color|border_width]

--]]

-- -- -- -- -- -- -- -- -- --

-- Define the icon theme for application default. If not set then the default
-- from /usr/share/default and /usr/share/default/hicolor will be used.
theme.icon_theme = nil

-- fonts
theme.font_name = "Iosevka Nerd Font "
theme.font = theme.font_name .. "Medium 10"

-- wallpaper
theme.wallpaper = themes_path.."wallpapers/bg-02.png"

-- gaps
theme.useless_gap = dpi(2)

-- border size
theme.border_width = dpi(2)

-- border radius
theme.border_radius = dpi(8)

--------------------
-- Colors
--

theme.normal = "#ffffff"
theme.red = "#ea6962"
theme.blue = "#9dbee4" --"#5294e2"
theme.yellow = "#d8a657"
theme.black = "#000000"
theme.bg_01 = "#1c1c1c"
theme.bg_02 = "#303030"
theme.bg_03 = "#404040"
theme.bg_04 = "#444444"

-- titlebar colors
theme.titlebar_bg_normal = theme.bg_02
theme.titlebar_bg_focus = theme.bg_03

-- border colors
theme.border_normal = theme.bg_02
theme.border_focus = theme.bg_03
theme.border_marked = "#91231c"


theme.bg_normal = theme.bg_01
--theme.bg_focus = "#535d6c"
theme.bg_urgent = theme.normal
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#cccccc"
theme.fg_focus = theme.normal
theme.fg_urgent = theme.red
theme.fg_minimize = theme.normal



-- top bar taglist
theme.taglist_bg_focus = theme.blue
theme.taglist_bg_occupied = theme.bg_04
-- theme.taglist_bg_empty = theme.bg_03
theme.taglist_fg_focus = theme.bg_01

-- -- -- -- -- -- -- -- -- --

-- menu
theme.menu_submenu_icon = themes_path.."submenu.png"
theme.menu_height       = dpi(15)
theme.menu_width        = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

--- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Titlebar buttons
theme.titlebar_close_button_normal              = themes_path.."icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = themes_path.."icons/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = themes_path.."icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = themes_path.."icons/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = themes_path.."icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = themes_path.."icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = themes_path.."icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = themes_path.."icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = themes_path.."icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = themes_path.."icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = themes_path.."icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = themes_path.."icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = themes_path.."icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = themes_path.."icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = themes_path.."icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = themes_path.."icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path.."icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path.."icons/titlebar/maximized_focus_active.png"

-- Layout icons:
theme.layout_tile     = themes_path.."icons/layouts/tile/tilew.png"
theme.layout_floating = themes_path.."icons/layouts/floating/floatingw.png"
theme.layout_dwindle  = themes_path.."icons/layouts/dwindle/dwindlew.png"

-- Powermenu
theme.power_icon = themes_path.."icons/power.png"

-- launcher
theme.launcher_icon = themes_path.."icons/launcher.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
