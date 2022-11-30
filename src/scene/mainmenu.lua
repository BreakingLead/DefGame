-- REQUIREMENTS
require("src.object.button")
local util = require("src.util.util")

-- OBJECTS
local objects = {}

local bg = util.loadImage("src/assets/image/mainmenu-bg.png")

objects[1]={"btn_start",Button(LANG.mainmenu_start,50,50,nil)}
objects[2]={"btn_options",Button(LANG.mainmenu_options,50,250,nil)}
objects[3]={"btn_exit",Button(LANG.mainmenu_exit,50,450,nil,function ()
    print("Exitting...")
    os.exit()
end)}
objects[4]={"btn_staff", Button(LANG.mainmenu_staff,400,450,nil,function ()
    ChangeScene("staff")
end)}

local choose_ptr=1
local chosen=1



local M = {}

function M:load()
end

function M:update(dt)
    for index, value in ipairs(objects) do
        value[2]:update(dt)
        value[2].size = 4
    end
    objects[choose_ptr][2].size=6
end

function love.keypressed(key,scancode,isrepeat)
    if key=="up" then
        if choose_ptr>1 then
            choose_ptr=choose_ptr-1
        else
            choose_ptr = #objects
        end
    elseif key=="down" then
        if choose_ptr<#objects then
            choose_ptr=choose_ptr+1
        else
            choose_ptr = 1
        end
    elseif key == "enter" or key == "z" then
        objects[choose_ptr][2].func()
    end
end

function M:draw()
    love.graphics.draw(bg)
    for index, value in ipairs(objects) do
        value[2]:draw()
    end
end

return M