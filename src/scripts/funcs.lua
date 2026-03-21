Personagem = 0

function drawChar(charid, x, y, width, height)
    if charid == 1 then
	love.graphics.rectangle("fill", x, y, width, height)
    end
end

function playerJump()
     
end

function checkPlayerOnGround() 
    
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
