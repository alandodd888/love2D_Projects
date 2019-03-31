player = require('player') -- Call player functions
enemy = require('enemy') -- Call enemy functions

love.graphics.setDefaultFilter('nearest', 'nearest')


function love.load()
    -- Music File
    local music = love.audio.newSource('music.mp3', 'stream')
    music:setLooping(true)
    love.audio.play(music)

    -- Game Results
    game_over = false
    game_win = false

    -- Background File
    background_image = love.graphics.newImage('background.png')

    for i=0, 10 do
    enemies_controller:spawnEnemy(i * 15,0)
    end

end

function love.update(dt)
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


end
