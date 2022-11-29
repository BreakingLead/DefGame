local util = require("src.util.util")
local Object =  require("src.lib.classic")
Button = Object:extend()



function Button:new(text,x,y,img)
    self.text = LANG.mainmenu_start
    self.x = 50
    self.y = 50
    self.size = 8
    self.img = util.loadImage("src/assets/image/button-1.png")
    if text then self.text = text end
    if x then self.x = x end
    if y then self.y = y end
    if img then self.img = img end
end

function Button:draw()
    love.graphics.draw(self.img,self.x,self.y,0,self.size,self.size,0,0,0,0)
    local ax,ay = util.getImageCenter(self.x,self.y,self.img)
    
    love.graphics.draw(self.text,30,30,0,0,0,0,0,0,0)
end