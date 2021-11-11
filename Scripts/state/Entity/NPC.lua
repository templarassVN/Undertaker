NPC = Class{__includes = Entity}

function NPC:render( ... )
	-- body
	if (self._alive == true) then
	    love.graphics.draw(gTextures['npc'], gFrames['npc'][55],
	         self._x + 5,self._y + 4 )
	end
end

function NPC:selfDestruct(room)
	-- body
	self._alive = false;
	room:set_Tile_stt(self._grid_x, self._grid_y,true)
end