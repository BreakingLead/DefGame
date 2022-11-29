-- conf.lua
-- LÖVE configuration file
local cs = require("src.util.constant")
love.conf = function(t)
  t.title = cs.game_name
  t.version = "11.3"
  t.console = true        -- Enable the debug console for Windows.
  t.window.width = 1280   -- Game's screen width (number of pixels)
  t.window.height = 720   -- Game's screen height (number of pixels)
end