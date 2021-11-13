NPC = Class{__includes = Entity}

function NPC:init(def,types)
	-- body
	Entity.init(self,def)
	self.types = types
end

function NPC:render( ... )
	-- body
	if (self._alive == true) then
	    love.graphics.draw(gTextures['npc'], gFrames['npc'][NPC_SPRITE[self.types]],
	         self._x + 5,self._y + 4 )
	end
end

function NPC:selfDestruct(room)
	-- body
	self._alive = false;
	room:set_Tile_stt(self._grid_x, self._grid_y,true)
end