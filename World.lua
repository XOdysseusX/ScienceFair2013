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
		}
	self.player = Player:new(self.stage, 50, 400, 50, 50, 10, "dynamic"), 
	self.actors[1]:setRestitution(0.3)

end

function World:update(dt)

	self.stage:update(dt)
	self.player:update(dt)

end

function World:draw()

	for i = 1, #self.actors do
	
		self.actors[i]:draw()
	
	end
	self.player:draw()

end
