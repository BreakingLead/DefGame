require("src.object.button")
local util = require("src.util.util")

local bg = util.loadImage("src/assets/image/mainmenu-bg.png")
local btn_start = Button(LANG.mainmenu_start,50,50,nil)
local btn_options = Button(LANG.mainmenu_options,50,250,nil)
local btn_exit = Button(LANG.mainmenu_exit,50,450,nil,function ()
    print("Exitting...")
    os.exit()
end)
local btn_staff = Button(LANG.mainmenu_staff,400,450,nil,function ()
    ChangeScene("staff")
end)

local M = {}

function M:load()
end

function M:update(dt)
    btn_start:update()
    btn_options:update()
    btn_exit:update()
    btn_staff:update()
end

function M:draw()
    love.graphics.draw(bg)
    btn_start:draw()
    btn_options:draw()
    btn_exit:draw()
    btn_staff:draw()
end

return M