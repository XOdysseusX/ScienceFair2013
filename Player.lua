Player = class:new()

function Player:init(world, x, y, w, h, mass, type)

  self.body = love.physics.newBody(world, x, y, type)
	self.shape = love.physics.newRectangleShape(w, h)
	self.mass = mass
	self.fixture = love.physics.newFixture(self.body, self.shape)
	
end

function Player:update(dt)
self:processKeys(dt)

end

function Player:processKeys(dt) -- The forces aren't final yet obviously
	if love.keyboard.isDown( "w" ) == true then
		self.body:applyForce( 0,-1000 ) -- 1st Arguement is X, 2nd is Y
	end
	if love.keyboard.isDown( "a" ) == true then
		self.body:applyForce( -1000 , 0 )
	end
	if love.keyboard.isDown( "d" ) == true then
		self.body:applyForce(1000,0) 
	end
	if love.mouse.isDown("l") == true then -- What shall happen?
		
	end
end
function Player:draw()

	love.graphics.polygon(
		"fill",
		self.body:getWorldPoints(self.shape:getPoints())
	)

end

function Player:setMass(mass)

	self.mass = mass

end

function Player:setRestitution(restitution)

	self.fixture:setRestitution(restitution)
end
