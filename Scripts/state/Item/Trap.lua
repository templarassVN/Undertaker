Trap = Class{__includes = Item}

function Trap:init(def)
	-- body
	Item.init(self,def)
	self._isActive = def.isActive
	self._types = def.types
end

function Trap:update(dt,player,room)
	-- body
	
	-- if love.keyboard.wasPressed('right') or love.keyboard.wasPressed('left') 
	-- 	or love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
	-- 	if(player._Dx ~= 0 or player._Dy ~= 0 ) then
	-- 		self:updateStt()
	-- 	end
	-- end
end

function Trap:render()
	-- body
	
	if(self._isActive == true) then
		index = TRAP_FLOORS[2]
	else
		index = TRAP_FLOORS[1]
	end
	love.graphics.draw(gTextures['trap'], gFrames['trap'][index],
         self._x+5,self._y + 4 )
	-- -- love.graphics.print(self._types == 0 and '1' or '0',0,15)
end


function Trap:updateStt()
	-- body

	if(self._types == 1) then
		if(self._isActive == true) then
			self._isActive = false
		else
			self._isActive = true
		end
	else 
		self._isActive = true
		return
	end
end
