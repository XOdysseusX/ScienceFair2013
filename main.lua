function love.load()

	require "SECS"
	require "Actor"
	require "World"
	require "Player"
	world = World:new(50)
	
end

function love.update(dt)


	world:update(dt)

end

function love.draw()

	love.graphics.push()
	
	world:draw()
	
	love.graphics.pop()

end
