player = require('player') -- Call player functions


function love.load()
    local music = love.audio.newSource('music.mp3', 'stream')
    music:setLooping(true)
    love.audio.play(music)

end

function love.update(dt)
    player:movement()

end

function love.draw()
    
    player:draw()

end
