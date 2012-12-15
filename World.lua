World = class:new()

function World:init(meterSize)

	love.physics.setMeter(meterSize)
	
	self.stage = love.physics.newWorld(
		0,
		9.81 * meterSize,
		true
	)
	
	self.actors = {
		Actor:new(self.stage, 400, 600, 800, 10, 50, "static", "rectangle"),
		Actor:new(self.stage, 400, 500, 50, 50, 50, "dynamic", "rectangle"),
		}
	
	self.player = Player:new(self.stage, 50, 50, meterSize)

end

function World:update(dt)

	self.stage:update(dt)
	self.player:update(dt)

end

function World:draw(metersize)

	for i = 1, #self.actors do
	
		self.actors[i]:draw()
	
	end
	self.player:draw(metersize)

end
