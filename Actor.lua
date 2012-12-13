Actor = class:new()

function Actor:init(world, x, y, w, h, mass, type)

	self.body = love.physics.newBody(world, x, y, type)
	self.shape = love.physics.newRectangleShape(w, h)
	self.mass = mass
	self.fixture = love.physics.newFixture(self.body, self.shape)

end

function Actor:update(dt)

end

function Actor:draw()

	love.graphics.polygon(
		"fill",
		self.body:getWorldPoints(self.shape:getPoints())
	)

end