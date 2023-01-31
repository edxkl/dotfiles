-- Autostart -------------------------------------
--

-- Importing libraries --
local awful = require("awful")

-- -- -- -- -- -- -- -- -- --

local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

run_once({
  "picom --config ~/.config/awesome/apps/picom/picom.conf",
  "lxpolkit",
})
