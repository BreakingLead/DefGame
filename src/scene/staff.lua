require("src.object.button")
local util = require("src.util.util")

local M = {}
local y=0

function M:load()
end

function M:update(dt)
    y=y+240*dt
    if y>800 then
        ChangeScene("mainmenu")
        y=0
    end
end

function M:draw()
    love.graphics.draw(LANG.staff_developers,640,y,0,1,1,
    LANG.staff_developers:getWidth()/2,LANG.staff_developers:getHeight()/2)
end

return M