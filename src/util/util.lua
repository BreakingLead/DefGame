
local M = {}

function M.loadImage (path)
	local info = love.filesystem.getInfo( path )
	if info then
		return love.graphics.newImage( path )
	end
end

function M.getImageCenter (x,y,img,scale)
    local fx = img:getWidth()*scale + x
    local fy = img:getHeight()*scale + y
    local cx = (x+fx)/2
    local cy = (y+fy)/2
	return cx,cy
end

function M.mouseBoxCheck(ax,ay,bx,by)
    local mx,my = love.mouse.getPosition()
	if (ax<mx and mx<bx) and (ay<my and my<by)then
		return true
	end
	return false
end

return M