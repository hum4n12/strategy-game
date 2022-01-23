local utils = require 'utils'
return {
    new = function(x,y,size,sprite)
        local tile = {}
        tile.x = x or 0
        tile.y = y or 0
        tile.size = size or TILE_SIZE
        tile.sprite = sprite or nil
        tile.coords = utils.hexCoords(tile.x, tile.y, tile.size)
        tile.quad = nil

        function tile:draw()
            if self.sprite ~= nil and self.quad ~= nil then
                local resize = 2*TILE_SIZE / QUAD_WIDTH
                love.graphics.draw(self.sprite,
                    self.quad,
                    self.x,self.y, --position
                    nil, --rotation
                    resize,resize, --scaling
                    QUAD_WIDTH/2,QUAD_WIDTH --offset
                )
            else
                love.graphics.polygon("fill", self.coords)
            end
        end

        return tile
    end
}