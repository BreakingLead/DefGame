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
	Scene:update(dt)
end

function love.draw()
	Scene:draw()
end

function ChangeScene(nextScene)
	Scene = require("src.scene."..nextScene)
	Log("Scene changed to "..nextScene.."!")
	Scene:load()
end
