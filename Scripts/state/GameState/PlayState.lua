PlayState = Class{__includes = BaseState}

function PlayState:init()
    local def = {room = Room(),
                player = Player({grid_x = 1, grid_y = 1}),
                object = Object({grid_x = 3, grid_y = 3}),
                npc = NPC({grid_x = 2, grid_y = 3}),
                trap = Trap({grid_x = 1, grid_y = 3, isActive = true, types = 0})
                }
    self._Level = Level(def)
    -- self._Room = Room()
    -- self._Player = Player({grid_x = 1, grid_y = 1})
    -- self._Object = Object({grid_x = 3, grid_y = 3})
    -- self._NPC = NPC({grid_x = 2, grid_y = 3})
    -- self._Trap = Trap({grid_x = 1, grid_y = 3, isActive = false, types = 1})
    -- self._Room:set_Tile_stt(1,1,false)
    -- self._Room:set_Tile_stt(3,3,false)
    -- self._Room:set_Tile_stt(2,3,false)
end

function PlayState:enter(params)

end

function PlayState:update(dt)
    -- self._Room:update(dt,self._Player)
    -- self._Player:update(dt,self._Room,self._Object,self._NPC,self._Trap)
    -- self._Trap:update(dt)
    -- self._Object:update(dt)
    -- if love.keyboard.wasPressed('r') then
    --     self:init()
    -- end
    self._Level:update(dt)
end

function PlayState:render()
    self._Level:render()
    -- self._Room:render()
    -- self._Object:render()
    -- self._NPC:render()
    -- self._Trap:render()
    -- self._Player:render()

    -- love.graphics.print(ALLOW_MOVE == false and '0' or '1')
end