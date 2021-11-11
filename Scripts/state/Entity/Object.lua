Object = Class{__includes = Entity}



function Object:update(dt)
	-- body
	self:Movement(dt)
end

function Object:render( ... )
	-- body
	local index = OBJECT_FLOORS[math.random(#OBJECT_FLOORS)]
    love.graphics.draw(gTextures['tiles'], gFrames['tiles'][index],
         self._x + 5,self._y + 4 )
   
end