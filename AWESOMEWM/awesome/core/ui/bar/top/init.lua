-- Bar Settings ----------------------------------
--

-- Importing libraries
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")

local volume_widget = require('core.ui.bar.top.widgets.volume.volume')

-- -- -- -- -- -- -- -- -- --

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
    local fancy_taglist = require("core.ui.bar.top.widgets.fancy_taglist")
    s.mytaglist = fancy_taglist.new({
        screen = s,
        taglist = { buttons = taglist_buttons },
        tasklist = { buttons = mytasklistbuttons }
    })

    -- -- -- -- -- -- -- -- -- --

    -- Powermenu
    local powermenu = wibox.widget {
        image = gears.color.recolor_image(beautiful.power_icon, beautiful.red),
        widget = wibox.widget.imagebox
    }
    powermenu:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.spawn.with_shell("~/.config/awesome/core/scripts/powermenu.sh &")
        end)
    ))

    -- -- -- -- -- -- -- -- -- --

    -- Launcher
    local launcher = wibox.widget {
        image = gears.color.recolor_image(beautiful.launcher_icon, beautiful.normal),
        widget = wibox.widget.imagebox
    }
    launcher:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.spawn(helpers.launch_rofi)
        end)
    ))

    -- -- -- -- -- -- -- -- -- --

    -- Create a textclock widget
    local mytextclock = wibox.widget {
        {
            widget = wibox.widget.textclock,
            format = "%a %d %b, %H:%M",
            font = beautiful.font_name .. "Bold 10",
            valign = "center",
            align = "center",
        },
        layout = wibox.layout.fixed.horizontal,
    }

    -- -- -- -- -- -- -- -- -- --

    -- Create the wibox
    s.mywibox = awful.wibar({
        screen = s,
        position = "top",
        height = dpi(26)
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        {
            expand = "none",
            layout = wibox.layout.align.horizontal,

            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(4),
                launcher,
                {
                    widget = wibox.container.background,
                    bg = beautiful.bg_02,
                    shape = helpers.rrect(beautiful.border_radius),
                    s.mytaglist,
                },
                s.mypromptbox,
            },

            { -- Middle widgets
                layout = wibox.layout.fixed.horizontal,
                mytextclock,
            },

            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(4),
                wibox.widget.systray(),
                s.mylayoutbox,
                volume_widget(),
                powermenu,
            },
        },
        margins = dpi(3),
        widget = wibox.container.margin
    }
end)
