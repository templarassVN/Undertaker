Level = Class{}

local function copy(src)
    des = {}
    for i,object in pairs(src) do
        table.insert(des,object:clone())
    end
    return des
end

local function render(obj)
    -- body
    for i,object in pairs(obj) do
        object:render()
    end
end

local function set_tile_false(room,objects)
    -- body
    for i,object in pairs(objects) do
        room:set_Tile_stt(object._grid_x,object._grid_y,false)
    end

end 


function Level:init(def)
	-- body
	self._init = def
	self._Room = def.room:clone()
    self._Player = def.player:clone()
    self._Objects = copy(def.objects)
    self._NPCs = copy(def.npcs)
    self._Traps = copy(def.traps)
    self._Key = def.key:clone()
    self._Chest = def.chest:clone() 
    self._Room:set_Tile_stt(self._Player._grid_x,self._Player._grid_y,false)
    self._Room:set_Tile_stt(self._Chest._grid_x,self._Chest._grid_y,false)
    set_tile_false(self._Room,self._NPCs)
    set_tile_false(self._Room,self._Objects)
    set_tile_false(self._Room,self._Room.walls)
end

function Level:update(dt)
	-- body
	self._Room:update(dt,self._Player)
    self._Player:update(dt,self._Room,self._Objects,self._NPCs,self._Traps,self._Key, self._Chest)
    
    for i,object in pairs(self._Objects) do
        object:update(dt)
    end
    

    if love.keyboard.wasPressed('r') then
        self:init(self._init)
    end
end

function Level:render( ... )
	-- body
	self._Room:render()
    render(self._Traps)
    render(self._Objects)
    render(self._NPCs)
    self._Player:render()
    self._Chest:render()
    self._Key:render()

    -- love.graphics.print(ALLOW_MOVE == false and '0' or '1')
end

