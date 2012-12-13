World = class:new()

function World:init(meterSize)

	love.physics.setMeter(meterSize)
	
	self.stage = love.physics.newWorld(
		0,
		9.81 * meterSize,
		true
	)
	
	self.actors = {
		Actor:new(self.stage, 200, 20, 500, 10, 50, "dynamic"),
		Actor:new(self.stage, 400, 500, 50, 50, 50, "static"),
		Actor:new(self.stage, 50, 400, 50, 50, 10, "static"),
	}

end

function World:update(dt)

	self.stage:update(dt)

end

function World:draw()

	for i = 1, #self.actors do
	
		self.actors[i]:draw()
	
	end

end