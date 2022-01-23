local Tile = require '../Tile'

return {
    new = function (x,y,size,sprite)
        local tile = Tile.new(x,y,size,sprite)
        print(sprite)
        if sprite ~= nil then
            tile.quad = love.graphics.newQuad(0,0,32,48,sprite:getWidth(),sprite:getHeight())
        end

        return tile
    end
}