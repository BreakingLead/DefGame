require("src.object.button")
local util = require("src.util.util")
local bg = util.loadImage("src/assets/image/mainmenu-bg.png")
local btn1 = Button(nil,nil,nil,nil)

local M = {}

function M:load()
end

function M:update(dt)
end

function M:draw()
    love.graphics.draw(bg)
    btn1:draw()
end

return M