<<<<<<< HEAD
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
=======
Player = class:new()

PART_TORSO = 1
PART_RIGHT_LEG = 2
PART_LEFT_LEG = 3
PART_RIGHT_ARM = 4
PART_LEFT_ARM = 5
PART_HEAD = 6
function Player:init(world, x, y, meter)

	self.meter = meter
	
	self.parts = {
		-- Torso
		Actor:new(world, x                , y                 , self.meter*.4, self.meter,     1, "dynamic", "rectangle"),
		-- Right Leg
		Actor:new(world, x + self.meter*.1, y + self.meter*1.1, self.meter*.2, self.meter,     1, "dynamic", "rectangle"),
		-- Left Leg
		Actor:new(world, x - self.meter*.1, y + self.meter*1.1, self.meter*.2, self.meter,     1, "dynamic", "rectangle"),
		-- Right Arm
		Actor:new(world, x - self.meter*.8, y - self.meter*.5,  self.meter   , self.meter*.15, 1, "dynamic", "rectangle"),
		-- Left Arm
		Actor:new(world, x + self.meter*.8, y - self.meter*.5,  self.meter   , self.meter*.15, 1, "dynamic", "rectangle"),
		-- Head
		Actor:new(world, x                , y - self.meter*.8, 0             , 0             , 1, "dynamic", "circle"    , self.meter*.25)
		
	}
	
	love.physics.newRevoluteJoint(
		self.parts[PART_LEFT_LEG].body,
		self.parts[PART_TORSO].body,
		x - self.meter*.1,
		y + self.meter*.5,
		true
	)
	
	love.physics.newRevoluteJoint(
		self.parts[PART_RIGHT_LEG].body,
		self.parts[PART_TORSO].body,
		x + self.meter*.1,
		y + self.meter*.5,
		true
	)
	
	love.physics.newRevoluteJoint(
		self.parts[PART_LEFT_ARM].body,
		self.parts[PART_TORSO].body,
		x + self.meter*.3,
		y - self.meter*.5,
		true
	)
	
	love.physics.newRevoluteJoint(
		self.parts[PART_RIGHT_ARM].body,
		self.parts[PART_TORSO].body,
		x - self.meter*.3,
		y - self.meter*.5,
		true
	)
	love.physics.newDistanceJoint(
		self.parts[PART_HEAD].body,
		self.parts[PART_TORSO].body,
		x, 
		y - self.meter*.65, 
		x, 
		y - self.meter*.7, 
		false
	)
end

function Player:update(dt)

	self:processKeys(dt)
	
end

function Player:processKeys(dt)

	if love.keyboard.isDown("d") then
		self.parts[PART_TORSO].body:applyForce(1500, 0)
		self.parts[PART_HEAD].body:applyForce( 500, 0)
	elseif love.keyboard.isDown("a") then
		self.parts[PART_TORSO].body:applyForce(-1500, 0)
		self.parts[PART_HEAD].body:applyForce(-500, 0)
	end
	
	if love.keyboard.isDown("w") then
		self.parts[PART_TORSO].body:applyForce(0, -1500)
		self.parts[PART_HEAD].body:applyForce(0,-500)
	end

end
function Player:draw()

	--Draw its torso and limbs
	for i = 1, #self.parts do
		self.parts[i]:draw()
	end

end

function Player:setMass(mass)

	self.mass = mass

end
>>>>>>> Cleaned Player Class
