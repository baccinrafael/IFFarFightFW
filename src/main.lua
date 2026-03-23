local const VIRTUAL_W, VIRTUAL_H = 1280, 720
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

	-- 1 = Standing
	-- 2 = Crouching
	-- 3 = Jumping

	love.mouse.setVisible(false)

	-- Sounds

	-- Assets
end

function love.draw()
	love.graphics.push()
	love.graphics.translate(offsetX, offsetY)
	love.graphics.scale(scaleX, scaleY)

	-- Graficos

	love.graphics.pop()

end

function love.update(dt)
end