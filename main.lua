function love.load()
    --globals
    TILE_SIZE = 40

    --modules
    require 'Vector2'
    World = require 'World'
    World = World.new()
    Tile = require 'Tile'
    World:addTile(Tile.new(100,100))
    World:addTile(Tile.new(200,100))
    World:addTile(Tile.new(300,100))
end

function love.update(dt)

end

function love.draw()
    World:draw()
end