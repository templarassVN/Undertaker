Chest = Class{__includes = Entity}

function Chest:render( ... )
	-- body
	if (self._alive == true) then
	    love.graphics.draw(gTextures['chest'], gFrames['chest'][1],
	         self._x + 5,self._y + 4 )
	end
end

function Chest:selfDestruct(room)
	-- body
	if(self._alive == true) then
		gSounds['chest']:play()
		self._alive = false;
		room:set_Tile_stt(self._grid_x, self._grid_y,true)
	end
end