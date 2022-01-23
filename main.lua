function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    --globals
    TILE_SIZE = 50
    QUAD_WIDTH = 32
    QUAD_HEIGHT = 48
    HEX_IMG = love.graphics.newImage('assets/hex.png')
    --modules
    require 'Vector2'

    World = require 'World'
    World = World.new()
    Tile = require 'Tiles/GrassTile'
    World:addTile(Tile.new(100,100,nil,HEX_IMG))
    World:addTile(Tile.new(200,100))
    World:addTile(Tile.new(300,100))
end

function love.update(dt)

end

function love.draw()
    World:draw()
end