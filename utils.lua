require 'Vector2'

--calculating specific corner coords
local function hexCorner(x,y,size,i, pointy)
    local ang = 0
    if pointy == true then
        ang = 30
    end
    local angle = (60 * i - ang) * math.pi / 180
    return Vector2(x + size * math.cos(angle), y + size * math.sin(angle))
end

return {
        --calculatin position of all coords
        hexCoords = function(x,y,size)
            local coords = {}
            for i = 1, 6 do
                local coord = hexCorner(x,y,size,i)
                table.insert(coords,coord.x)
                table.insert(coords,coord.y)
            end

            return coords
        end,

        tilesList = function()
            local enum = {
                GRASS = 1,
                TREES = 2,
                FOREST = 3,
                HILL = 4,
                HIGH_HILL = 5,
                MOUNTAIN = 6,
                SEA = 7,
                OCEAN = 8,
                FOREST_VILLAGE = 9,
                FOREST_CITY = 10,
                CAPITAL = 11,
                FARM = 12
            }

            return enum
        end,

        getTileImage = function (sprite,tileNum)
            local num = 1
            local quad = nil
            for i = 1, (HEX_IMG:getHeight()/QUAD_HEIGHT) do
                for j = 1, (HEX_IMG:getWidth()/QUAD_WIDTH) do
                    -- print(tileNum)
                    if tileNum == num then
                        quad = love.graphics.newQuad((j-1)*QUAD_WIDTH,(i-1)*QUAD_HEIGHT,QUAD_WIDTH,QUAD_HEIGHT,sprite:getWidth(),sprite:getHeight())
                        return quad
                    end
                    num = num + 1
                end
            end
            return quad
        end
}