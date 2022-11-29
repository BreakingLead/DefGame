
local M = {}

function M.loadImage (path)
	local info = love.filesystem.getInfo( path )
	if info then
		return love.graphics.newImage( path )
	end
end

function M.getImageCenter (x,y,img)
    local fx = img:getWidth() + x
    local fy = img:getHeight() + y
    local cx = (x+fx)/2
    local cy = (y+fy)/2
	return cx,cy
end

return M