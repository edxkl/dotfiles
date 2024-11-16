-- Titlebars -------------------------------------
--

-- Importing libraries --
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- -- -- -- -- -- -- -- -- --

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = 24}) : setup {
        {
            {
                -- Left
                awful.titlebar.widget.iconwidget(c),
                {
                    {
                        -- Title
                        align  = "center",
                        widget = awful.titlebar.widget.titlewidget(c)
                    },
                    left = dpi(4),
                    widget = wibox.container.margin 
                },
                buttons = buttons,
                layout  = wibox.layout.fixed.horizontal,
            },
            {
                -- Middle
                buttons = buttons,
                layout  = wibox.layout.flex.horizontal
            },
            {
                -- Right
                layout = wibox.layout.fixed.horizontal(),
                awful.titlebar.widget.closebutton(c),
            },
            layout = wibox.layout.align.horizontal,
        },
        margins = dpi(2),
        widget = wibox.container.margin
    }
end)
