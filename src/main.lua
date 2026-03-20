Funcs = require("scripts.funcs")
Bindings = require("scripts.bindings")
Player = require("scripts.player")

local const
VIRTUAL_W, VIRTUAL_H = 1280, 720
-- Resoluçao da tela que e mostrada no jogo, as artes e fundos deveriam ser de 1920 por 1920

-- Variaveis das janelas

local realW = love.graphics.getWidth()
local realH = love.graphics.getHeight()

scaleX = realW / VIRTUAL_W
scaleY = realH / VIRTUAL_H

local scale = math.min(scaleX, scaleY)
scaleX = scale
scaleY = scale

offsetX = (realW - VIRTUAL_W * scale) / 2
offsetY = (realH - VIRTUAL_H * scale) / 2

-- Fim das variaveis das janelas
function love.load()
	player = {}
	player.x = VIRTUAL_W / 2
	player.y = VIRTUAL_H / 2 + VIRTUAL_H / 10
	player.size = 20
	player.Nsize = 20
	player.state = 1
	-- 1 = Standing
	-- 2 = Crouching
	-- 3 = Jumping
end

function love.draw()
	love.graphics.push()
	love.graphics.translate(offsetX, offsetY)
	love.graphics.scale(scaleX, scaleY)

	-- Graficos
	love.graphics.setColor(1, 0, 1)
	drawChar(1, player.x, player.y, player.size)

	love.graphics.pop()
end

function love.update(dt)

	player.size = player.Nsize
	if love.keyboard.isDown("a") and player.state == 1 then
		player.x = player.x - 2
	end
	if love.keyboard.isDown("d") and player.state == 1 then
		player.x = player.x + 2
	end

	if love.keyboard.isDown("s") then
		player.state = 2
	else
		player.state = 1
	end

	if player.state == 2 then
		player.size = player.size - 2
	end

end
