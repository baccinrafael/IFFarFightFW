Funcs = require("scripts.funcs")
Bindings = require("scripts.bindings")
Player = require("scripts.player")

local const VIRTUAL_W, VIRTUAL_H = 1280, 720
-- Resoluçao da tela que e mostrada no jogo, as artes e fundos deveriam ser de 1920 por 1920 


function love.load()
	player = {}
	player.x = 50
	player.y = desktopWidth() / 2
	player.size = 20
	player.Nsize = 20

end

function love.draw()
	drawChar(1, player.x, player.y, player.size)
end

function love.update(dt)
	player.size = player.Nsize
	if love.keyboard.isDown("a") then
		player.x = player.x - 2
	end
	if love.keyboard.isDown("d") then
		player.x = player.x + 2
	end

	if love.keyboard.isDown("s") then
		player.size = player.size - 5
	end

end
