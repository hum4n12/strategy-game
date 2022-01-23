local utils = require 'utils'
return {
    new = function(x,y,size,sprite)
        local tile = {}
        tile.x = x or 0
        tile.y = y or 0
        tile.size = size or TILE_SIZE
        tile.sprite = sprite or nil
        tile.coords = utils.hexCoords(tile.x, tile.y, tile.size)

        function tile:draw()
            love.graphics.polygon("fill", self.coords)
        end

        return tile
    end
}