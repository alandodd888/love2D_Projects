player = require('player') -- Call player functions
enemy = require('enemy') -- Call enemy functions
checkCollisions = require('checkcollisions') -- Call checkcollisions functions
particle_systems = require('particle_systems') -- Call particle_systems functions
game = require('game') -- Call game functions

love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
    -- Music File
    local music = love.audio.newSource('music.mp3', 'stream')
    music:setLooping(true)
    love.audio.play(music)
    
    -- Check game status
    game:status()
    
    -- Background File
    background_image = love.graphics.newImage('background.png')
    
    -- Load Enemy
    enemy:spawnEnemy()

end

function love.update(dt)
    -- Particle Controls
    particle_systems:update(dt)

    -- Player Controls
    player:movement()

    if  #enemies_controller.enemies == 0  then
        -- we win !!
        game_win = true
    end
    for _,e in pairs(enemies_controller.enemies) do
      if e.y >= love.graphics.getHeight()/5 then
        game_over = true
      end
      e.y = e.y + 1 * e.speed
    end

    for i,b in ipairs(player.bullets) do
        if b.y < 30 then
            table.remove(player.bullets, i)
        end
        b.y = b.y - 10
    end
    checkCollisions(enemies_controller.enemies, player.bullets)
end

function love.draw()

    love.graphics.scale(5)
    love.graphics.draw(background_image, 0, 0)

    -- Check game status
    if game_over then
      love.graphics.print("Game Over!")
      return
    elseif game_win then
      love.graphics.print("You Won!")
    end

    -- Player Draw function
    player:draw()

    love.graphics.setColor(255, 255, 255)
     for _,e in pairs(enemies_controller.enemies) do
         love.graphics.draw(enemies_controller.image, e.x, e.y)
     end

     -- Draw bullets
     love.graphics.setColor(255, 255, 255)
     for _,b in pairs(player.bullets) do
         love.graphics.rectangle("fill", b.x, b.y, 2, 2)
     end

     -- Draw Particles to Screen
     particle_systems:draw()
end
