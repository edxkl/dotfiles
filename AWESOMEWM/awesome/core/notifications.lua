-- Notifications ---------------------------------
--

-- Importing libraries --
local naughty = require("naughty")
local beautiful = require("beautiful")
local awful = require("awful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")


-- Theme Definitions
--
naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 3
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.margin = dpi(16)
naughty.config.defaults.border_width = 0
naughty.config.defaults.position = "top_right"
naughty.config.defaults.shape = helpers.rrect(beautiful.border_radius)

naughty.config.padding = dpi(7)
naughty.config.spacing = dpi(7)
naughty.config.icon_dirs = {
    "/usr/share/icons/",
    "/usr/share/pixmaps/"
}
naughty.config.icon_formats = {"png", "svg"}

-- Timeouts
naughty.config.presets.low.timeout = 8
naughty.config.presets.critical.timeout = 0

naughty.config.presets.normal = {
    font = beautiful.font,
    fg = beautiful.normal,
    bg = beautiful.bg_03,
    position = "top_right"
}

naughty.config.presets.low = {
    font = beautiful.font,
    fg = beautiful.normal,
    bg = beautiful.bg_03,
    position = "top_right"
}

naughty.config.presets.critical = {
    font = "Open Sans 10",
    fg = "#ffffff",
    bg = "#ff0000",
    position = "top_right",
    timeout = 0
}

naughty.config.presets.ok = naughty.config.presets.normal
naughty.config.presets.info = naughty.config.presets.normal
naughty.config.presets.warn = naughty.config.presets.critical
