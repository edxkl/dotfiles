-- Signals ---------------------------------------
--

-- Importing libraries --
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local helpers = require("helpers")

-- -- -- -- -- -- -- -- -- --

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
require("awful.autofocus")
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

-- Disable screen edges snapping
awful.mouse.snap.edge_enabled = false

-- Set border color of focused client
client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)

-- Disable maximize & minimize option
client.connect_signal("property::maximized", function(c) c.maximized = false end)
client.connect_signal("property::minimized", function(c) c.minimized = false end)

-- Add rounded corners to clients
local function enable_rounding()
  if beautiful.border_radius > 0 then
    client.connect_signal("manage", function (c)
      if not c.fullscreen and not c.maximized then
        c.shape = helpers.rrect(beautiful.border_radius)
      end
    end)

    local function no_round_corners (c)
      if c.fullscreen then
        c.shape = nil
      elseif c.maximized then
        c.shape = nil
      else
        c.shape = helpers.rrect(beautiful.border_radius)
      end
    end
    client.connect_signal("property::fullscreen", no_round_corners)
    client.connect_signal("property::maximized", no_round_corners)
  end
end
enable_rounding()

-- Floating windows on top
client.connect_signal("property::floating", function(c)
  if not c.fullscreen then
    if c.floating then
      c.ontop = true
    else
      c.ontop = false
    end
  end
end)
