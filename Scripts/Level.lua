Level = Class{}


function Level:init(def)
	-- body
	self._init = def
	self._Room = def.room:clone()
    self._Player = def.player:clone()
    self._Object = def.object:clone()
    self._NPC = def.npc:clone()
    self._Trap = def.trap:clone()
    self._Room:set_Tile_stt(1,1,false)
    self._Room:set_Tile_stt(3,3,false)
    self._Room:set_Tile_stt(2,3,false)
end

function Level:update(dt)
	-- body
	self._Room:update(dt,self._Player)
    self._Player:update(dt,self._Room,self._Object,self._NPC,self._Trap)
    self._Trap:update(dt,self._Player)
    self._Object:update(dt)
    

    if love.keyboard.wasPressed('r') then
        self:init(self._init)
    end
end

function Level:render( ... )
	-- body
	self._Room:render()
    self._Trap:render()
    self._Object:render()
    self._NPC:render()
    self._Player:render()

    -- love.graphics.print(ALLOW_MOVE == false and '0' or '1')
   end

