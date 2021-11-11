Entity = Class{ALLOW_MOVE = true}

function Entity:init(def)
	-- body

	self._grid_x = def.grid_x
	self._grid_y = def.grid_y
	self._x = self._grid_x*TILE_SIZE
	self._y = self._grid_y*TILE_SIZE 
	
	self._Dx = 0
	self._Dy = 0
	self._alive = true
	self._haveKey = false
end


function Entity:Movement( dt)
	-- body
	
	if (self._x >= self._grid_x*TILE_SIZE + TILE_SIZE) then		--right
		self._Dx = 0
		self._grid_x = self._grid_x+1
		Entity.ALLOW_MOVE = true
	elseif (self._x <= self._grid_x*TILE_SIZE - TILE_SIZE) then   --left
		self._Dx = 0
		self._grid_x = self._grid_x-1
		Entity.ALLOW_MOVE = true
	elseif (self._y >= self._grid_y*TILE_SIZE + TILE_SIZE) then   --down
		self._Dy = 0
		self._grid_y = self._grid_y+1
		Entity.ALLOW_MOVE = true
	elseif (self._y <= self._grid_y*TILE_SIZE - TILE_SIZE) then   --up
		self._Dy = 0
		self._grid_y = self._grid_y-1
		Entity.ALLOW_MOVE = true
	end

	if(self._Dx ~= 0 or self._Dy ~= 0 ) then
		Entity.ALLOW_MOVE = false
		self._x = self._x + math.floor(self._Dx*dt)
		self._y = self._y + math.floor(self._Dy*dt)
	
	end


end


function Entity:moveLeft(room,trap)
	-- body
	local next_tile = room:getTile(self._grid_x-1,self._grid_y)
	local current_tile = room:getTile(self._grid_x,self._grid_y)
	
	if (self._grid_x == 1 or next_tile == nil or  next_tile.avail== false or ALLOW_MOVE == false ) then
		self._Dx = 0
	else
		self._Dx = -100
		next_tile.avail = false
		current_tile.avail = true
		
		
	end
end

function Entity:moveRight( room,trap)
	-- body
	local next_tile = room:getTile(self._grid_x+1,self._grid_y)
	local current_tile = room:getTile(self._grid_x,self._grid_y)
	if (self._grid_x == 9 or next_tile == nil or next_tile.avail == false or ALLOW_MOVE == false) then
		self._Dx = 0
	else
		self._Dx = 100
		next_tile.avail = false
		current_tile.avail = true
	end
end

function Entity:moveUp(room,trap)
	-- body
	local next_tile = room:getTile(self._grid_x,self._grid_y-1)
	local current_tile = room:getTile(self._grid_x,self._grid_y)
	if (self._grid_y == 1 or next_tile == nil or next_tile.avail == false or ALLOW_MOVE == false) then
		self._Dy = 0
	else
		self._Dy = -100
		next_tile.avail = false
		current_tile.avail = true
	end
end

function Entity:moveDown( room,trap )
	-- body
	local next_tile = room:getTile(self._grid_x,self._grid_y+1)
	local current_tile = room:getTile(self._grid_x,self._grid_y)
	if (self._grid_y == 8 or next_tile == nil or next_tile.avail == false or ALLOW_MOVE == false) then
		self._Dy = 0
	else
		self._Dy = 100
		next_tile.avail = false
		current_tile.avail = true
	end
end




