Player = Class{__includes = Entity}

function Player:update(dt,room,object,npc,trap)
	-- body
	self:Movement(dt)
	
	if(Entity.ALLOW_MOVE == true) then
		if love.keyboard.wasPressed('right') and self._Dx == 0 and self._Dy == 0 then
			local tile = room:getTile(self._grid_x - 1,self._grid_y)
			if(tile ~= nil and tile.avail == true) then
	    		self:hitRight( room,trap )
	    	end
			self:moveRight(room)
			if(self._Dx == 0) then
				self:belowTrap(room,trap )
			end
			if(self._grid_x<MAP_WIDTH) then
				room:decreaseMove()
				trap:updateStt()
			end

			self:pushRight(room,object)
			self:slainRight(room,npc)

			
	    end
	    if love.keyboard.wasPressed('left') and self._Dx == 0 and self._Dy == 0 then
	    	local tile = room:getTile(self._grid_x - 1,self._grid_y)
			if(tile ~= nil and tile.avail == true) then
	    		self:hitLeft( room,trap )
	    	end
	    	self:moveLeft(room)
			if(self._Dx == 0) then
				self:belowTrap(room,trap )
			end
			if(self._grid_x>1) then
				room:decreaseMove()
				trap:updateStt()
			end

			
			self:pushLeft(room,object)
			self:slainLeft(room,npc)
	    end
	    if love.keyboard.wasPressed('up') and self._Dx == 0 and self._Dy == 0 then
	    	local tile = room:getTile(self._grid_x ,self._grid_y - 1)
			if(tile ~= nil and tile.avail == true) then
				self:hitUp( room,trap )
			end
			self:moveUp(room)
			if(self._Dy == 0) then
				self:belowTrap(room,trap )
			end
			if(self._grid_y>1) then
				room:decreaseMove()
				trap:updateStt()
			end
			
			self:pushUp(room,object)
			self:slainUp(room,npc)
			
			
	    end
	    if love.keyboard.wasPressed('down') and self._Dx == 0 and self._Dy == 0 then
	    	

			local tile = room:getTile(self._grid_x ,self._grid_y + 1)
			if(tile ~= nil and tile.avail == true) then
				self:hitDown( room,trap )
			end
			self:moveDown(room)
			if(self._Dy == 0) then
				self:belowTrap(room,trap )
			end
			if(self._grid_y<MAP_HEIGHT) then
				room:decreaseMove()
				trap:updateStt()
			end

			self:pushDown(room,object)
			self:slainDown(room,npc)
			
	    end
	end
end

function Player:render( ... )
	-- body
	love.graphics.draw(gTextures['character-walk'], gFrames['character-walk'][2],
                 self._x + 5, self._y -  8 )
	-- love.graphics.print(self._Dx,0,15)
	-- love.graphics.print(old_grid_X,0,30)
end

function Player:hitTrap(room,trap)
	-- body
	if(trap._grid_x == self._grid_x and trap._grid_y == self._grid_y and trap._isActive == true) then
		return true
	end
	return false
end

--Push the object
function Player:pushLeft(room,object)
	-- body
	if (object._grid_x == self._grid_x - 1 and object._grid_y == self._grid_y) then 
		object:moveLeft(room)
	end
end

function Player:pushRight(room,object)
	-- body
	if (object._grid_x == self._grid_x + 1 and object._grid_y == self._grid_y) then 
		object:moveRight(room)
		
	end
end

function Player:pushUp(room,object)
	-- body
	if (object._grid_x == self._grid_x and object._grid_y == self._grid_y - 1) then 
		object:moveUp(room)
		
	end
end

function Player:pushDown(room,object)
	-- body
	if (object._grid_x == self._grid_x and object._grid_y == self._grid_y + 1) then 
		object:moveDown(room)
		
	end
end


--Slain the enemy
function Player:slainLeft( room, npc )
	-- body
	if (npc._grid_x == self._grid_x - 1 and npc._grid_y == self._grid_y) then 
		npc:selfDestruct(room)
	end
end

function Player:slainRight( room, npc )
	-- body
	if (npc._grid_x == self._grid_x + 1 and npc._grid_y == self._grid_y) then 
		npc:selfDestruct(room)
	end
end

function Player:slainUp( room, npc )
	-- body
	if (npc._grid_x == self._grid_x and npc._grid_y == self._grid_y - 1) then 
		npc:selfDestruct(room)
	end
end

function Player:slainDown( room, npc )
	-- body
	if (npc._grid_x == self._grid_x and npc._grid_y == self._grid_y + 1) then 
		npc:selfDestruct(room)
	end
end

--ativate trap
function Player:hitLeft( room,trap )
	-- body
	local x = self._grid_x - 1
	local y = self._grid_y
	local tile = room:getTile(x,y)
	if (trap._grid_x == x and trap._grid_y == y ) then
		if(trap._types == 1 and trap._isActive == false) or (trap._types == 0 and trap._isActive == true) then 
			room:decreaseMove()
		end
	end
end

function Player:hitRight( room,trap )
	-- body
	local x = self._grid_x + 1
	local y = self._grid_y
	local tile = room:getTile(x,y)
	if (trap._grid_x == x and trap._grid_y == y ) then
		if(trap._types == 1 and trap._isActive == false) or (trap._types == 0 and trap._isActive == true) then  
			room:decreaseMove()
		end
	end
end


function Player:hitUp( room,trap )
	-- body
	local x = self._grid_x  
	local y = self._grid_y - 1
	local tile = room:getTile(x,y)
	if (trap._grid_x == x and trap._grid_y == y ) then
		if(trap._types == 1 and trap._isActive == false) or (trap._types == 0 and trap._isActive == true) then 
			room:decreaseMove()
		end
	end
end


function Player:hitDown( room,trap )
	-- body
	local x = self._grid_x 
	local y = self._grid_y + 1
	local tile = room:getTile(x,y)
	if (trap._grid_x == x and trap._grid_y == y) then
		if(trap._types == 1 and trap._isActive == false) or (trap._types == 0 and trap._isActive == true) then 
			room:decreaseMove()
		end
	end
end

function Player:belowTrap( room,trap )
	-- body
	if (trap._grid_x == self._grid_x and trap._grid_y == self._grid_y and trap._isActive == true) then
		room:decreaseMove() 
	end
end
