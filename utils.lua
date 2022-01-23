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
        end
}