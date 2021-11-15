Key = Class{__includes = Item}

function Key:render()
	-- body
	if (self._alive == true) then
	    love.graphics.draw(gTextures['key'], gFrames['key'][1],
	         self._x + 5,self._y + 4 )
	end
end

function Key:selfDestruct(room)
	-- body
	if(self._alive == true) then
		gSounds['key']:play()
		self._alive = false;
		room:set_Tile_stt(self._grid_x, self._grid_y,true)
	end
	
	
end