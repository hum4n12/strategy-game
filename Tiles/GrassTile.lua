local Tile = require '../Tile'
local utils = require 'utils'

return {
    new = function (x,y,size,sprite)
        local tile = Tile.new(x,y,size,sprite)
        if sprite ~= nil then
            tile.quad = utils.getTileImage(sprite,TILES_LIST.GRASS)
        end

        return tile
    end
}