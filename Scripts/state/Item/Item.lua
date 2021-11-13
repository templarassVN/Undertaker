Item = Class{}

function Item:init(def)
	-- body
	self._grid_x = def.grid_x
	self._grid_y = def.grid_y
	self._x = self._grid_x*TILE_SIZE
	self._y = self._grid_y*TILE_SIZE 
end