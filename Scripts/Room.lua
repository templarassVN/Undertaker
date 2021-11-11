Room = Class{}

function Room:init( ... )
	-- body
    self._moveremain = 4
	self.width = MAP_WIDTH
	self.height = MAP_HEIGHT
	self.tiles = {}
    self.wall = {}
    self.renderOffsetX = MAP_RENDER_OFFSET_X
    self.renderOffsetY = MAP_RENDER_OFFSET_Y

    -- used for drawing when this room is the next room, adjacent to the active
    self.adjacentOffsetX = 0
    self.adjacentOffsetY = 0
	self:generateFloor()
end

function Room:update(dt,object)
	-- body
    

end

function Room:decreaseMove( ... )
    -- body
    self._moveremain = self._moveremain -1
end

function Room:render( ... )
	-- body
    love.graphics.print( self._moveremain)
    love.graphics.print(self.tiles[3][1].avail == true and '1' or '0', 0,7)
    -- for y = 1, 4 do
    --     if y == 1 then
    --         for x = 1, self.width do
    --             local tile = self.wall[y][x]
    --             love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
    --              (x - 1) * TILE_SIZE + self.renderOffsetX, 
    --             -1* TILE_SIZE + self.renderOffsetY )
    --         end
    --     elseif y == 2 then
    --         for x = 1, self.width do
    --             local tile = self.wall[y][x]
    --             love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
    --              (x - 1) * TILE_SIZE + self.renderOffsetX, 
    --             8* TILE_SIZE + self.renderOffsetY )
    --         end
    --     elseif y == 3 then
    --         for x = 1, self.height do
    --             local tile = self.wall[y][x]
    --             love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
    --               - 1 * TILE_SIZE + self.renderOffsetX, 
    --             (x-1)* TILE_SIZE + self.renderOffsetY )
    --         end
    --     elseif y == 4 then
    --         for x = 1, self.height do
    --             local tile = self.wall[y][x]
    --             love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
    --               8 * TILE_SIZE + self.renderOffsetX, 
    --             (x-1)* TILE_SIZE + self.renderOffsetY )
    --         end

    --     end
    -- end

	for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.tiles[y][x]
            love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
                 (x - 1) * TILE_SIZE + self.renderOffsetX, 
                (y - 1) * TILE_SIZE + self.renderOffsetY )
        end
    end

end

function Room:generateFloor( ... )
	-- body
	for y = 1, self.height do
        table.insert(self.tiles, {})
        for x = 1, self.width do
        	id = TILE_FLOORS[math.random(#TILE_FLOORS)]    
            table.insert(self.tiles[y], {
                id = id,
                avail = true
            })
        end
    end

    for y = 1, 4 do
        table.insert(self.wall, {})
        if y == 1 then
            for x = 1, self.width do
                id = TILE_TOP_WALLS[math.random(#TILE_TOP_WALLS)]    
                table.insert(self.wall[y], {
                    id = id,
                    avail = true
                })
            end
        elseif y == 2 then
            for x = 1, self.width do
                id = TILE_BOTTOM_WALLS[math.random(#TILE_BOTTOM_WALLS)]    
                table.insert(self.wall[y], {
                    id = id,
                    avail = true
                })
            end
        elseif y == 3 then
            for x = 1, self.height do
                id = TILE_LEFT_WALLS[math.random(#TILE_LEFT_WALLS)]    
                table.insert(self.wall[y], {
                    id = id,
                    avail = true
                })
            end
        elseif y == 4 then
            for x = 1, self.height do
                id = TILE_RIGHT_WALLS[math.random(#TILE_RIGHT_WALLS)]    
                table.insert(self.wall[y], {
                    id = id,
                    avail = true
                })
            end

        end
    end
end

function Room:getTile(x,y)
    -- body
    if(x < 1 or x >8 or y < 1 or y > 8) then
        return nil
    end
    return self.tiles[y][x]
end

function Room:set_Tile_stt(x,y,stt)
    -- body
    self.tiles[y][x].avail = stt
end
