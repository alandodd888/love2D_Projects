function checkCollisions(enemies, bullets)
  for i, e in ipairs(enemies) do
    for _, b in pairs(bullets) do
        if b.y <= e.y + e.height and b.x > e.x and b.x < e.x + e.width then
          particle_systems:spawn(e.x, e.y)
          table.remove(enemies, i)
        end
      end
    end
end

return checkCollisions
