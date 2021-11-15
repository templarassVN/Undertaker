Player = Class{__includes = Entity}

function Player:init(def)
	-- body
	Entity.init(self,def)
	self._iswining = false
end

function Player:update(dt,room,objects,npcs,traps,key,chest,princess)
	-- body
	self:Movement(dt)
	self:rescuePrincess(princess)
	-- print(princess._grid_x,princess._grid_y)
	if(key._grid_x == self._grid_x and key._grid_y == self._grid_y) then
		key:selfDestruct(room)
		self._haveKey = true
	end

	

	if(Entity.ALLOW_MOVE == true) then
		
		if love.keyboard.wasPressed('right') and self._Dx == 0 and self._Dy == 0 then
			gSounds['move']:play()
			local tile = room:getTile(self._grid_x + 1,self._grid_y)
			for i,trap in pairs(traps) do
				if(tile ~= nil and tile.avail == true) then
		    		self:hitRight( room,trap )
		    	end
		    end

			self:moveRight(room)

			if(self._haveKey == true and chest._grid_x == self._grid_x + 1 and chest._grid_y == self._grid_y) then
				chest:selfDestruct(room)
			end
			-- if(key._grid_x == self._grid_x and key._grid_y == self._grid_y) then
			-- 	key:selfDestruct()
			-- end

			for i,trap in pairs(traps) do
				if(self._Dx == 0) then
					self:belowTrap(room,trap )
				end
				if(self._grid_x<MAP_WIDTH) then
					trap:updateStt()
				end
			end
			

			for i,object in pairs(objects) do
        		self:pushRight(room,object)
    		end
			
			for i,npc in pairs(npcs) do
				self:slainRight(room,npc)
			end

			room:decreaseMove()
	    end
	    if love.keyboard.wasPressed('left') and self._Dx == 0 and self._Dy == 0 then
	    	gSounds['move']:play()
	    	local tile = room:getTile(self._grid_x - 1,self._grid_y)
	    	for i,trap in pairs(traps) do
				if(tile ~= nil and tile.avail == true) then
	    			self:hitLeft( room,trap )
	    		end
	    	end

	    	self:moveLeft(room)

	    	if(self._haveKey == true and chest._grid_x == self._grid_x - 1 and chest._grid_y == self._grid_y) then
				chest:selfDestruct(room)
			end

	    	for i,trap in pairs(traps) do
				if(self._Dx == 0) then
					self:belowTrap(room,trap )
				end
				if(self._grid_x>1) then
					
					trap:updateStt()
				end
			end

			for i,object in pairs(objects) do
				self:pushLeft(room,object)
			end

			for i,npc in pairs(npcs) do
				self:slainLeft(room,npc)
			end
			room:decreaseMove()
	    end

	    if love.keyboard.wasPressed('up') and self._Dx == 0 and self._Dy == 0 then
	    	gSounds['move']:play()
	    	local tile = room:getTile(self._grid_x ,self._grid_y - 1)
	    	for i,trap in pairs(traps) do
				if(tile ~= nil and tile.avail == true) then
					self:hitUp( room,trap )
				end
			end

			self:moveUp(room)

			if(self._haveKey == true and chest._grid_x == self._grid_x and chest._grid_y == self._grid_y - 1) then
				chest:selfDestruct(room)
			end

			for i,trap in pairs(traps) do
				if(self._Dy == 0) then
					-- print("hitDownTrap")
					self:belowTrap(room,trap )
				end
				if(self._grid_y>1) then
					
					trap:updateStt()
				end
			end
			
			for i,object in pairs(objects) do
				self:pushUp(room,object)
			end

			for i,npc in pairs(npcs) do
				self:slainUp(room,npc)
			end		
			room:decreaseMove()
	    end
	    if love.keyboard.wasPressed('down') and self._Dx == 0 and self._Dy == 0 then
	    	gSounds['move']:play()
			local tile = room:getTile(self._grid_x ,self._grid_y + 1)
			for i,trap in pairs(traps) do
				if(tile ~= nil and tile.avail == true) then
					self:hitDown( room,trap )
				end
			end

			self:moveDown(room)

			if(self._haveKey == true and chest._grid_x == self._grid_x and chest._grid_y == self._grid_y + 1) then
				chest:selfDestruct(room)
			end

			for i,trap in pairs(traps) do
				if(self._Dy == 0) then
					
					self:belowTrap(room,trap )
				end
				if(self._grid_y<MAP_HEIGHT) then
					
					trap:updateStt()
				end
			end

			for i,object in pairs(objects) do
				self:pushDown(room,object)
			end

			for i,npc in pairs(npcs) do
				self:slainDown(room,npc)
			end
			room:decreaseMove()
	    end
	end
end

function Player:render( ... )
	-- body
	love.graphics.draw(gTextures['character-walk'], gFrames['character-walk'][2],
                 self._x + 5, self._y -  8 )
	-- love.graphics.print(tostring(self._grid_x) .. " " .. tostring(self._grid_y) ,0,0)
	-- love.graphics.print(Entity.ALLOW_MOVE == true and '1' or '0',0,30)

end

-- function Player:hitTrap(room,trap)
-- 	-- body
-- 	if(trap._grid_x == self._grid_x and trap._grid_y == self._grid_y and trap._isActive == true) then
-- 		return true
-- 	end
-- 	return false
-- end

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

function Player:rescuePrincess(princess)
	-- body
	
	if((princess._grid_x - 1 == self._grid_x and princess._grid_y == self._grid_y )
		or (princess._grid_x + 1 == self._grid_x and princess._grid_y == self._grid_y) 
		or (princess._grid_x  == self._grid_x and princess._grid_y + 1 == self._grid_y )
		or (princess._grid_x  == self._grid_x and princess._grid_y - 1 == self._grid_y )) then

		self._iswining = true
	end
end

