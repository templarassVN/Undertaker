StartState = Class{__includes = BaseState}

function StartState:init()

end

function StartState:enter(params)

end

function StartState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function StartState:render()
    love.graphics.draw(gTextures['background'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['background']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['background']:getHeight())

    

    love.graphics.setFont(gFonts['zelda'])
    love.graphics.setColor(34, 34, 34, 255)
    love.graphics.printf('Under taker', 2, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 , VIRTUAL_WIDTH, 'center')
end