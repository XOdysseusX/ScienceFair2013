Actor = class:new()

function Actor:init(world, x, y, w, h, mass, type, shape, radius)

	self.body = love.physics.newBody(world, x, y, type)
	if shape == "rectangle" then
		self.shape = love.physics.newRectangleShape(w, h)
		self.s = "rectangle"
		self.fixture = love.physics.newFixture(self.body, self.shape)
	end
	if shape =="circle" then
		self.shape = love.physics.newCircleShape(radius)
		self.radius = radius
		self.s = "circle"	
		self.fixture = love.physics.newFixture(self.body, self.shape)
	end
	self.mass = mass

	
end

function Actor:update(dt)

end

function Actor:draw()
	if self.s == "rectangle" then
		love.graphics.polygon(
			"fill",
			self.body:getWorldPoints(self.shape:getPoints())
		)
	end
	
	if self.s == "circle" then
		love.graphics.circle(
			"fill",
			self.body:getX(), 
			self.body:getY(),
			self.shape:getRadius()
		)
	end
end

function Actor:setMass(mass)

	self.mass = mass

end

function Actor:setRestitution(restitution)

	self.fixture:setRestitution(restitution)

end
