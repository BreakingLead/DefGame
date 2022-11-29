-- DO NOT CHANGE THE ORDER OF THE REQUIREMENT
FONT_MAY7 = love.graphics.newFont("src/assets/font/may7/quan.ttf",48)
require("src.util.lang")

-- Utils
local util = require("src.util.util")

function love.load()
	love.graphics.setDefaultFilter("nearest","nearest",1)
    ChangeScene("mainmenu")
end

function love.update(dt)
	if Scene.update then Scene:update(dt) end
end

function love.draw()
	if Scene.draw then Scene:draw() end
end

function ChangeScene(nextScene)
	Scene = require("src.scene."..nextScene)
	print("Scene changed to "..nextScene.."!")
	if Scene.load then Scene:load() end
end
