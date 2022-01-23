return {
    new = function ()
        local world = {}

        --all tiles table
        world.tiles = {}

        function world:addTile(tile)
            table.insert(self.tiles,tile)
        end

        function world:update()
        
        end

        function world:draw()
            for i = 1, #self.tiles do
                local tile = self.tiles[i]
                tile:draw()
            end
        end
        return world
    end
}