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
	player.y = VIRTUAL_H / 1.3
	player.speed = 3
	player.height = -160
	player.width = 50

	player.isDashing = false
	player.dashCooldown = 60
	player.dashTimer = 0

	player.Nheight = player.height
	player.state = 1
	-- 1 = Standing
	-- 2 = Crouching
	-- 3 = Jumping

	love.mouse.setVisible(false)

	-- Sounds
	dashSound = love.audio.newSource("assets/sounds/dash.wav", "static")

	-- Assets
	backgroundImg = love.graphics.newImage("assets/wallpaper.jpg")
end

function love.draw()
	love.graphics.push()
	love.graphics.translate(offsetX, offsetY)
	love.graphics.scale(scaleX, scaleY)

	-- Graficos
	love.graphics.setColor(1, 1, 1, 0.5)
	love.graphics.draw(backgroundImg) 

	love.graphics.setColor(1, 1, 1, 1)
	drawChar(1, player.x, player.y, player.width, player.height)

	love.graphics.pop()

end

function love.update(dt)
	if player.x >= VIRTUAL_W - player.width then
		player.x = VIRTUAL_W - player.width
	elseif player.x <= 0 then
		player.x = 0
	end

	-- Reset Vars
	if player.state == 2 then
		player.height = player.Nheight
	end
	if player.isDashing then
		player.dashTimer = player.dashTimer + 2
		if player.dashTimer >= 45 then
			player.isDashing = false
			player.dashTimer = 0
			player.dashCooldown = 120
		end
	else
		player.dashCooldown = player.dashCooldown - 1
	end

	-- Movement
	if love.keyboard.isDown("a") and player.state == 1 then
		if love.keyboard.isDown("space") and player.isDashing == false then
			player.x = player.x - player.speed * 40
			player.isDashing = true

			dashSound:play()
		else
			player.x = player.x - player.speed
		end
	end
	if love.keyboard.isDown("d") and player.state == 1 then
		if love.keyboard.isDown("space") and player.isDashing == false then
			player.x = player.x + player.speed * 40
			player.isDashing = true

			dashSound:play()
		else
			player.x = player.x + player.speed
		end
	end
	if love.keyboard.isDown("s") then
		player.state = 2
	else
		player.state = 1
	end

	-- Check State
	if player.state == 2 then
		player.height = player.height + 10
	end

	-- if love.keyboard.isDown("y") then

	-- end
end
