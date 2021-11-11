Class = require 'lib/class'
push = require 'lib/push'

require 'Scripts/Util'
require 'Scripts/Room'
require 'Scripts/constant'
require 'Scripts/Trap'

require 'Scripts/state/Entity/Entity'
require 'Scripts/state/Entity/Object'
require 'Scripts/state/Entity/NPC'
require 'Scripts/state/Entity/Player'
require 'Scripts/Level'

require 'Scripts/state/BaseState'
require 'Scripts/StateMachine'
require 'Scripts/state/GameState/StartState'
require 'Scripts/state/GameState/PlayState'



gTextures = {
	['background'] = love.graphics.newImage('graphics/bg.jpg'),
    ['tiles'] = love.graphics.newImage('graphics/tilesheet.png'),
    ['character-walk'] = love.graphics.newImage('graphics/character_walk.png'),
    ['character-swing-sword'] = love.graphics.newImage('graphics/character_swing_sword.png'),
    ['npc'] = love.graphics.newImage('graphics/entities.png'),
    ['trap'] =  love.graphics.newImage('graphics/Spike Trap.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
    ['character-walk'] = GenerateQuads(gTextures['character-walk'], 16, 32),
    ['character-swing-sword'] = GenerateQuads(gTextures['character-swing-sword'], 32, 32),
    ['npc'] = GenerateQuads(gTextures['npc'], 16, 16),
    ['trap'] = GenerateQuads(gTextures['trap'], 16, 16),
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['gothic-medium'] = love.graphics.newFont('fonts/GothicPixels.ttf', 16),
    ['gothic-large'] = love.graphics.newFont('fonts/GothicPixels.ttf', 32),
    ['zelda'] = love.graphics.newFont('fonts/zelda.otf', 32),
    ['zelda-small'] = love.graphics.newFont('fonts/zelda.otf', 16)
}