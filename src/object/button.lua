local util = require("src.util.util")
local Object =  require("src.lib.classic")
Button = Object:extend()


function Button:new(name,x,y,text,func,img)
    --Default arguments
    self.name = "Button"
    self.text = nil
    self.x = 50
    self.y = 50
    self.size = 4
    self.img = util.loadImage("src/assets/image/button-1.png")

    if text then self.text = text end
    if x then self.x = x end
    if y then self.y = y end
    if img then self.img = img end
    if func then self.func = func end
end

function Button:update(dt)
end

function Button:draw()
    -- Draw the button image.
    love.graphics.draw(self.img,self.x,self.y,0,self.size,self.size,0,0,0,0)
    -- Draw the text.
    local ax,ay = util.getImageCenter(self.x,self.y,self.img,self.size)
    love.graphics.draw(self.text,ax,ay,0,1,1,self.text:getWidth()/2,self.text:getHeight()/2,0,0)
end