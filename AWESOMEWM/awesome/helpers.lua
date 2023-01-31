-- Helpers ---------------------------------------
-- Functions that you use more than once and in different files would be nice to define here.
--

-- Importing libraries --
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local naughty = require("naughty")

local helpers = {}

-- -- -- -- -- -- -- -- -- --

-- Launcher
helpers.launch_rofi = "rofi -no-config -no-lazy-grab -show drun -modi drun -theme ~/.config/awesome/apps/rofi/launcher.rasi"

-- Create rounded rectangle shape (in one line)
helpers.rrect = function(radius)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, radius)
  end
end

return helpers
