return {
    pointInTriangle = function (px, py, x1, y1, x2, y2, x3, y3)
        local ax, ay = x1 - px, y1 - py
        local bx, by = x2 - px, y2 - py
        local cx, cy = x3 - px, y3 - py
        local sab = ax*by - ay*bx < 0
        if sab ~= (bx*cy - by*cx < 0) then
            return false
        end
        return sab == (cx*ay - cy*ax < 0)
    end,

    pointInsideHexagon = function (self,x,y,cx,cy,vertices)
        if x == nil or y == nil then
            return false
        end
        
        local t1x = 0
        local t1y = 0
        local t2x = 0
        local t2y = 0

        for i = 1, #vertices-4, 2 do
            t1x = vertices[i]
            t1y = vertices[i+1]
            t2x = vertices[i+2]
            t2y = vertices[i+3]

            if self.pointInTriangle(x,y,cx,cy,t1x,t1y,t2x,t2y) then
                return true
            end
        end
        t1x = vertices[1]
        t1y = vertices[2]
        if self.pointInTriangle(x,y,cx,cy,t1x,t1y,t2x,t2y) then
            return true
        end

        return false
    end
}