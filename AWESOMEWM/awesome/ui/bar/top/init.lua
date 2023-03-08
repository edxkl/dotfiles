-- Bar Settings ----------------------------------
--

-- Importing libraries 
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")

-- -- -- -- -- -- -- -- -- --

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end)
)

awful.screen.connect_for_each_screen(function(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    style = { 
      -- shape = helpers.rrect(beautiful.border_radius)
      shape = gears.shape.rounded_rect 
    },
    layout = { spacing = dpi(10), layout = wibox.layout.fixed.horizontal },
    widget_template = {
      {
        {
          id = "text_role",
          widget = wibox.widget.textbox,
        },
        margins = dpi(4),
        widget = wibox.container.margin,
      },
      id = "background_role",
      widget = wibox.container.background
    },
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
  }

  -- -- -- -- -- -- -- -- -- --

  -- Powermenu
  local powermenu = wibox.widget {
    image = gears.color.recolor_image(beautiful.power_icon, beautiful.red),
    widget = wibox.widget.imagebox
  }

  powermenu:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.spawn.with_shell("~/.config/awesome/scripts/powermenu.sh &")
    end)
  ))

  -- -- -- -- -- -- -- -- -- --

  -- Create the wibox
  s.mywibox = awful.wibar({
    screen = s,
    position = "top",
    height = 25
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    {
      expand = "none",
      layout = wibox.layout.align.horizontal,

      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(4),
        s.mytaglist,
        s.mylayoutbox,
        s.mypromptbox,
      },

      { -- Middle widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytasklist,
      },

      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(4),
        wibox.widget.systray(),
        mytextclock,
        powermenu,
      },
    },
    margins = dpi(3),
    widget = wibox.container.margin
  }
end)
