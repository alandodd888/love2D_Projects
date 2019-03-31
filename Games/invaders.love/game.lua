game = {}

-- Game Results
function game:load()
    game_over = false
    game_win = false

end

-- Draw game status
function game:draw()
  
    if game_over then
      love.graphics.print("Game Over!")
      return
    elseif game_win then
      love.graphics.print("You Won!")
    end

end

return game
