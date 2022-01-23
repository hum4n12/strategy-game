function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineWidth(5)
    --globals
    TILE_SIZE = 50
    QUAD_WIDTH = 32
    QUAD_HEIGHT = 48
    HEX_IMG = love.graphics.newImage('assets/hex.png')
    --modules
    require 'Vector2'
    utils = require 'utils'
    Collisions = require 'Collisions'
    TILES_LIST = utils:tilesList()
    Mouse = Vector2(0,0)
    Mouse.isPressed = false
    World = require 'World'
    World = World.new()
    Tile = require 'Tiles/GrassTile'
    World:addTile(Tile.new(100,100,nil,HEX_IMG))
    World:addTile(Tile.new(200,100))
    World:addTile(Tile.new(300,100))
end

function love.update(dt)
    Mouse.x, Mouse.y = love.mouse.getPosition()

    for i,v in ipairs(World.tiles) do
        v.border = false
        if Collisions:pointInsideHexagon(Mouse.x,Mouse.y,v.x,v.y,v.coords) then
            if Mouse.isPressed then
                print(v.x,v.y)
                Mouse.isPressed = false
            end
            v.border = true
            Mouse.x = nil
            Mouse.y = nil
            break
        end
    end

    Mouse.x = nil
    Mouse.y = nil
end

function love.draw()
    World:draw()
end

function love.mousepressed( x, y, button, istouch, presses )
    Mouse.isPressed = true
end