PlayState = Class{__includes = BaseState}
_current = 3
function PlayState:init()
    gSounds['bg']:setLooping(true)
    gSounds['bg']:play()

    if(_current == 1) then 
        local room_walls = {Wall({grid_x = 8,grid_y = 1}),Wall({grid_x = 7,grid_y  = 1})}
        local Room = Room(17,room_walls)
        local Key = Key({grid_x = 7, grid_y = 7})
        local Chest = Chest({grid_x = 6,grid_y = 7})
        local objects = {Object({grid_x = 3, grid_y = 3}),Object({grid_x = 4, grid_y = 3})}
        local npcs = {NPC({grid_x = 2, grid_y = 3},2, true)}
        local traps = {Trap({grid_x = 1, grid_y = 3, isActive = true, types = 0}),Trap({grid_x = 1, grid_y = 4, isActive = true, types = 1})}
        local Princess = NPC({grid_x = 8, grid_y = 8},1,true)
        local def = {room = Room,
                    player = Player({grid_x = 1, grid_y = 1}),
                    objects = objects,
                    npcs = npcs,
                    traps = traps,
                    key = Key,
                    chest = Chest,
                    Princess = Princess
                    }
        self._Level = Level(def)
    end
    if(_current == 2) then
        local room_walls = {}
        for i = 1, 8 do
            table.insert(room_walls,Wall({grid_x = 1,grid_y = i}))
        end
        for i = 1, 4 do
            table.insert(room_walls,Wall({grid_x = 2,grid_y = i}))
        end
        for i = 3,5 do
            table.insert(room_walls,Wall({grid_x = i,grid_y = 1}))
        end
        -- for i = 4,8 do
        --     table.insert(room_walls,Wall({grid_x = i,grid_y = 6}))
        -- end
        table.insert(room_walls,Wall({grid_x = 8,grid_y = 7}))
        local Room = Room(20,room_walls)
        local Key = Key({grid_x = 4, grid_y = 5})
        local Chest = Chest({grid_x = 7,grid_y = 8})
        local objects = {Object({grid_x = 6, grid_y = 7}),Object({grid_x = 5, grid_y = 8}),Object({grid_x = 3, grid_y = 7}),Object({grid_x = 3, grid_y = 8})}
        local npcs = {NPC({grid_x = 4, grid_y = 5},2, true),NPC({grid_x = 7, grid_y = 5},2, true)}
        local traps = {Trap({grid_x = 7, grid_y = 3, isActive = true, types = 0})}
        local Princess = NPC({grid_x = 8, grid_y = 8},1,true)
        local def = {room = Room,
                    player = Player({grid_x = 3, grid_y = 4}),
                    objects = objects,
                    npcs = npcs,
                    traps = traps,
                    key = Key,
                    chest = Chest,
                    Princess = Princess
                    }
        self._Level = Level(def)
    end
    if(_current == 3) then
        local room_walls = {}
        
        for i = 1, 7 do
            table.insert(room_walls,Wall({grid_x = i,grid_y = 8}))
        end
        for i = 1, 8 do
            table.insert(room_walls,Wall({grid_x = 1,grid_y = i}))
        end
        
        for i = 1, 6 do
            table.insert(room_walls,Wall({grid_x = 3,grid_y = i}))
        end
        for i = 1, 5 do
            table.insert(room_walls,Wall({grid_x = i,grid_y = 1}))
        end
        for i = 1, 4 do
            table.insert(room_walls,Wall({grid_x = i,grid_y = 2}))
        end
        table.insert(room_walls,Wall({grid_x = 4,grid_y = 6}))
        table.insert(room_walls,Wall({grid_x = 8,grid_y = 1}))
        local Room = Room(30,room_walls)
        local Key = Key({grid_x = 8, grid_y = 8})
        local Chest = Chest({grid_x = 6,grid_y = 2})
        local objects = {Object({grid_x = 5, grid_y = 6}),Object({grid_x = 6, grid_y = 6}),Object({grid_x = 7, grid_y = 6}),Object({grid_x = 8, grid_y = 6}),
                            Object({grid_x = 7, grid_y = 2}),Object({grid_x = 7, grid_y = 3})}
        local npcs = {NPC({grid_x = 2, grid_y = 6},2, true)}
        local traps = {Trap({grid_x = 2, grid_y = 7, isActive = false, types = 1}),Trap({grid_x = 4, grid_y = 7, isActive = false, types = 1}),
                        Trap({grid_x = 8, grid_y = 7, isActive = false, types = 1})}
        local Princess = NPC({grid_x = 7, grid_y = 1},1,true)
        local def = {room = Room,
                    player = Player({grid_x = 2, grid_y = 4}),
                    objects = objects,
                    npcs = npcs,
                    traps = traps,
                    key = Key,
                    chest = Chest,
                    Princess = Princess
                    }
        self._Level = Level(def)
    end
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
    
    if(self._Level._isfinish == true) then
        self._Level._isfinish = false
        _current = _current +1
        self:init()
    end
end

function PlayState:render()
    self._Level:render()
    -- self._Room:render()
    -- self._Object:render()
    -- self._NPC:render()
    -- self._Trap:render()
    -- self._Player:render()

    love.graphics.print("Level :" ..tostring(_current) ,100,0)
end