local util = require("src.util.util")
local Object =  require("src.lib.classic")
Button = Object:extend()


function Button:new(text,x,y,img,func)
    --Default arguments
    self.text = LANG.mainmenu_start
    self.x = 50
    self.y = 50
    self.size = 4
    self.img = util.loadImage("src/assets/image/button-1.png")

    if text then self.text = text end
    if x then self.x = x end
    if y then self.y = y end
    if img then self.img = img end
    if func then self.func = func end

    self.fx = self.x + self.img:getWidth()*self.size
    self.fy = self.y + self.img:getHeight()*self.size
end

function Button:update(dt)
    if util.mouseBoxCheck(self.x,self.y,self.fx,self.fy) then
        if love.mouse.isDown(1) then
            if self.func then self.func() end
        end
    end
end

function Button:draw()
    love.graphics.draw(self.img,self.x,self.y,0,self.size,self.size,0,0,0,0)
    local ax,ay = util.getImageCenter(self.x,self.y,self.img,self.size)
    love.graphics.draw(self.text,ax,ay,0,1,1,self.text:getWidth()/2,self.text:getHeight()/2,0,0)
end