function love.load()

	require "SECS"
	require "Actor"
	require "World"

	world = World:new(10)
	
end

function love.update(dt)

	world:update(dt)

end

function love.draw()

	world:draw()

end