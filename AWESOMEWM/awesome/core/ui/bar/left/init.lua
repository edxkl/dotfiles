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
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- -- -- -- -- -- -- -- -- --

  -- Clock widget
  local clock = wibox.widget{
    {
      widget = wibox.widget.textclock,
      format = "%H",
      font = beautiful.font_name .. "Bold 12",
      valign = "center",
      align = "center"
    },
    {
      widget = wibox.widget.textclock,
      format = "%M",
      font = beautiful.font_name .. "Bold 12",
      valign = "center",
      align = "center"
    },
    layout = wibox.layout.fixed.vertical,
  }

  -- Calendar popup on clock
  local month_calendar = awful.widget.calendar_popup.month({
    date = os.date('*t'),
    margin = dpi(6),
    spacing = dpi(10),
    style_month = {
      border_width = dpi(0),
      shape = helpers.rrect(beautiful.border_radius),
    },
    style_header = {
      border_width = dpi(0),
    },
    style_weekday = {
      border_width = dpi(0),
    },
    style_normal = {
      border_width = dpi(0),
    },
    style_focus = {
      border_width = dpi(0),
      fg_color = beautiful.red,
    },
  })
  month_calendar:attach(clock, "bl", { on_hover = false })

  -- -- -- -- -- -- -- -- -- --

  -- Systray
	s.systray = wibox.widget({
		base_size = dpi(25),
		horizontal = false,
		screen = s,
		widget = wibox.widget.systray,
	})

  -- -- -- -- -- -- -- -- -- --

  -- Taglist widget
  s.mytaglist = require("configs.ui.bar.left.taglist")(s)

  local taglist = wibox.widget {
    s.mytaglist,
    shape = helpers.rrect(beautiful.border_radius),
    bg = beautiful.border_focus,
    widget = wibox.container.background
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
    position = "left",
    width = beautiful.bar_width,
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    {
      expand = "none",
      layout = wibox.layout.align.vertical,

      { -- Left widgets
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(4),
        taglist,
        s.mypromptbox,
      },

      { -- Middle widgets
        layout = wibox.layout.fixed.vertical,
      },

      { -- Right widgets
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(2),
        s.systray,
        s.mylayoutbox,
        clock,
        powermenu,
      },
    },
    margins = dpi(4),
    widget = wibox.container.margin,
  }
end)
