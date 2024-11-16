--    ___      _____ ___  ___  __  __ _____      ____  __
--   /_\ \    / / __/ __|/ _ \|  \/  | __\ \    / /  \/  |
--  / _ \ \/\/ /| _|\__ \ (_) | |\/| | _| \ \/\/ /| |\/| |
-- /_/ \_\_/\_/ |___|___/\___/|_|  |_|___| \_/\_/ |_|  |_|
--

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Awesome libraries -----------------------------
local gears = require("gears") -- Standard awesome library 
local beautiful = require("beautiful") -- Theme handling library

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "core/theme/init.lua")

-- Loading configs
require("core")

-- Default apps ----------------------------------
terminal   = "alacritty"
editor     = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Garbage Collection ----------------------------
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
