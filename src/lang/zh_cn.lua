-- 这是默认字体
love.graphics.setFont(FONT_MAY7)
local font = love.graphics.getFont()

M = {}

M.mainmenu_start = love.graphics.newText(font,{{1,0,0},"1开始游戏"})

return M
