player = {}
player.x = 70
player.y = 105
player.bullets = {}
player.cooldown = 20
player.speed = 2
player.image = love.graphics.newImage('player.png')
player.fire_sound = love.audio.newSource('Laser_Shoot2.wav', 'stream')
    player.fire = function()
        if player.cooldown <= 0 then
        love.audio.play(player.fire_sound)
        player.cooldown = 20
        bullet = {}
        bullet.x = player.x + 4
        bullet.y = player.y + 4
        table.insert(player.bullets, bullet)
        end
    end
    
function player:movement()
  
    player.cooldown = player.cooldown - 1
    
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end
    
    if love.keyboard.isDown("space") then
        player.fire()
    end
end

function player:draw()
      -- Draw the Player
    --                     r, g, b
    love.graphics.setColor(0, 0, 255)
    love.graphics.draw(player.image, player.x, player.y)
end

return player
