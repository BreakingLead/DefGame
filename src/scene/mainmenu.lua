-- REQUIREMENTS
require("src.object.button")
require("src.object.buttongroup")
require("src.util.lang")
local util = require("src.util.util")

-- OBJECTS
local bG1 = ButtonGroup()
bG1:addButton(Button("btn_start",50,50,LANG.mainmenu_start))
bG1:addButton(Button("btn_options",50,250,LANG.mainmenu_options))
bG1:addButton(Button("btn_exit",50,450,LANG.mainmenu_exit,function ()
    print("Exitting...")
    os.exit()
end))
bG1:addButton(Button("btn_staff",400,450,LANG.mainmenu_staff,function ()
    ChangeScene("staff")
end))

local bg = util.loadImage("src/assets/image/mainmenu-bg.png")



local M = {}

function M:load()

end

function M:update(dt)
    bG1:update(dt)
end

function love.keypressed(key,scancode,isrepeat)
    if key=="up" then
        bG1:preSelectButtonInList(-1)
    elseif key=="down" then
        bG1:preSelectButtonInList(1)
    elseif key == "enter" or key == "z" then
        bG1:useButton()
    end
end

function M:draw()
    love.graphics.draw(bg)
    bG1:draw()
end

return M