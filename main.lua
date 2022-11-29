LANG = require("src.lang.zh_cn")
local util = require("src.util.util")

function love.load()
    ChangeScene("mainmenu")
	love.graphics.setDefaultFilter("nearest","nearest",1)
	FONT_MAY7 = love.graphics.newFont("src/assets/font/may7/quan.ttf")
end

function love.update(dt)
	if Scene.update then Scene:update(dt) end
end

function love.draw()
	if Scene.draw then Scene:draw() end
end

function ChangeScene(nextScene)
	Scene = require("src.scene."..nextScene)
	if Scene.load then Scene:load() end
end
