local Window = require"scripts.vars.window"

player = {}
player.x = desktopWidth
player.y = desktopHeight
player.speed = 5

function setPlayerChar(charid)
    Personagem = charid    
end

function getPlayerChar()
    return Personagem
end
