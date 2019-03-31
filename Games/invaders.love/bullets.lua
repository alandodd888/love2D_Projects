bullets = {}

function bullets:draw()
     -- Draw bullets
     love.graphics.setColor(255, 255, 255)
     for _,b in pairs(player.bullets) do
         love.graphics.rectangle("fill", b.x, b.y, 2, 2)
     end
end

return bullets